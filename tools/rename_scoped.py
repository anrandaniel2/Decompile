"""Lexically scoped renamer for short top-level Luau functions and variables.

A raw substitution of `w` or `F` corrupts hundreds of unrelated callback
parameters. This walker only renames identifiers resolving to the corresponding
root-level local binding. It does not touch strings or property names.
"""
from __future__ import annotations


def rename_top_level_bindings(source: bytes, parser, function_names: dict[str, str],
                              variable_names: dict[str, str],
                              nested_names: list[tuple[str, str]] | None = None) -> tuple[bytes, int]:
    tree = parser.parse(source)
    if tree.root_node.has_error:
        raise ValueError('Cannot safely rename code that does not parse')
    changes: list[tuple[int, int, bytes]] = []
    scopes: list[dict[str, str | None]] = [{}]
    root = tree.root_node
    defined: set[str] = set()
    nested_index = 0
    nested_names = nested_names or []

    def text(node):
        return source[node.start_byte:node.end_byte].decode('utf-8')

    def lookup(name):
        for scope in reversed(scopes):
            if name in scope:
                return scope[name]
        return None

    def maybe_rename(node):
        name = text(node)
        new = lookup(name)
        if new is not None:
            changes.append((node.start_byte, node.end_byte, new.encode()))

    def declare_variable(node, at_root):
        name = text(node)
        target = variable_names.get(name) if at_root else None
        scopes[-1][name] = target
        if target:
            defined.add(name)
            changes.append((node.start_byte, node.end_byte, target.encode()))

    def params(node):
        if node:
            for parameter in node.named_children:
                if parameter.type == 'parameter':
                    identifier = next((child for child in parameter.named_children
                                       if child.type == 'identifier'), None)
                    if identifier:
                        scopes[-1][text(identifier)] = None

    def walk(node):
        nonlocal nested_index
        kind = node.type
        if kind in ('chunk', 'block'):
            if kind == 'block':
                scopes.append({})
            for statement in node.named_children:
                walk(statement)
            if kind == 'block':
                scopes.pop()
            return

        if kind == 'function_declaration':
            name_node = node.child_by_field_name('name')
            local = bool(node.children and node.children[0].type == 'local')
            if name_node is not None:
                name = text(name_node)
                if local:
                    top_level = node.parent == root
                    if top_level:
                        target = function_names.get(name)
                    elif nested_names and len(name) <= 3:
                        if nested_index >= len(nested_names):
                            raise ValueError(f'Unexpected nested function {name!r}')
                        expected, target = nested_names[nested_index]
                        nested_index += 1
                        if name != expected:
                            raise ValueError(f'Nested function {nested_index}: expected {expected!r}, got {name!r}')
                    else:
                        target = None
                    scopes[-1][name] = target
                    if target:
                        if top_level:
                            defined.add(name)
                        changes.append((name_node.start_byte, name_node.end_byte,
                                        target.encode()))
                else:
                    walk(name_node)
            scopes.append({})
            params(node.child_by_field_name('parameters'))
            body = node.child_by_field_name('body')
            if body: walk(body)
            scopes.pop()
            return

        if kind == 'function_definition':
            scopes.append({})
            params(node.child_by_field_name('parameters'))
            body = node.child_by_field_name('body')
            if body: walk(body)
            scopes.pop()
            return

        if kind == 'variable_declaration':
            # Initializers see the old scope: local x = x invokes the outer x.
            assignment = next((c for c in node.named_children
                               if c.type == 'assignment_statement'), None)
            if assignment:
                varlist = next((c for c in assignment.named_children
                                if c.type == 'variable_list'), None)
                for child in assignment.named_children:
                    if child != varlist: walk(child)
                if varlist:
                    for child in varlist.named_children:
                        if child.type == 'identifier':
                            declare_variable(child, node.parent == root)
                        else:
                            walk(child)
            else:
                for child in node.named_children:
                    if child.type == 'variable_list':
                        for var in child.named_children:
                            if var.type == 'identifier':
                                declare_variable(var, node.parent == root)
                    elif child.type == 'identifier':
                        declare_variable(child, node.parent == root)
                    else:
                        walk(child)
            return

        if kind == 'for_statement':
            clause = node.child_by_field_name('clause')
            loop_scope = {}
            if clause:
                for child in clause.named_children:
                    if child.type == 'identifier' and child == clause.child_by_field_name('name'):
                        loop_scope[text(child)] = None
                    elif child.type == 'variable_list':
                        for var in child.named_children:
                            if var.type == 'identifier': loop_scope[text(var)] = None
                    else:
                        walk(child)
            scopes.append(loop_scope)
            body = node.child_by_field_name('body')
            if body: walk(body)
            scopes.pop()
            return

        if kind == 'identifier':
            # Dot fields and method names are table keys, not local variables.
            parent = node.parent
            if parent and parent.type in ('dot_index_expression', 'method_index_expression') \
                    and parent.child_by_field_name('field') == node:
                return
            maybe_rename(node)
            return

        for child in node.named_children:
            walk(child)

    walk(root)
    expected = set(function_names) | set(variable_names)
    if defined != expected:
        raise ValueError(f'Unexpected top-level declarations: missing={expected-defined}')
    if nested_names and nested_index != len(nested_names):
        raise ValueError(f'Expected {len(nested_names)} nested functions, saw {nested_index}')
    for start, end, replacement in sorted(changes, reverse=True):
        source = source[:start] + replacement + source[end:]
    if parser.parse(source).root_node.has_error:
        raise ValueError('Scoped renaming introduced a Luau syntax error')
    return source, len(changes)
