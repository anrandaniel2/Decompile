# Decompile

`cheesy.deobfuscated.luau` is the standalone reconstructed script. Its UI is
built with native WindUI windows, tabs, sections, and controls, using a pinned
WindUI revision. A separate state layer connects the WindUI controls to the
script's gameplay callbacks, keybind modes, translations, and saved options; it
does not expose the old Obsidian UI constructors.

The script's other runtime dependencies and gameplay code remain in place,
including remote code loading and its original telemetry. WindUI is beta software.
Former tabboxes are shown as separate WindUI sections. The original custom
cursor setting was removed because WindUI does not provide an equivalent.
Configs continue to use `cheesy/Configs` and the original `objects` format and
`autoload.txt`; WindUI themes are stored separately in `cheesy/Data`. The pinned
WindUI key picker has a known limitation when rebinding to a mouse button;
keyboard rebinding and activation of existing mouse bindings are supported.

The original queue-on-teleport URL pointed to an upstream script with a
different UI. To queue this version, set `getgenv().CheesyWindScriptURL` to a
URL serving this WindUI script **before** execution. Without it,
queue-on-teleport reports that a URL is required rather than silently loading
the old version.

## Addons

Addons in `cheesy/addons` receive native WindUI objects instead of Obsidian
wrappers. Existing addons using `AddToggle`, `AddLeftGroupbox`, or other
Obsidian-specific calls need to be ported. For example:

```lua
cheesy.AddonInfo = {
    Title = "My addon",
    Description = "A native WindUI addon",
    Floor = "Mines", -- optional, or a list of floors
}

-- Groupbox is a native WindUI section on the User Addons tab.
cheesy.Groupbox:Toggle({
    Title = "Example",
    Value = false,
    Callback = function(enabled)
        print("Example enabled:", enabled)
    end,
})

-- Create tracked tabs and sections so reload and floor filtering work.
local tab = cheesy:Tab("My addon", "star")
local section = cheesy:Section("Actions", tab)
section:Button({ Title = "Hello", Callback = function() print("Hello") end })
```

`cheesy.Window`, `cheesy.Tabs`, and `cheesy.Library` expose the native window,
tabs, and WindUI library. `cheesy:Notify` takes WindUI notification fields.
Use `cheesy:Connect(connection)` to track connections for cleanup. Controls
created directly by addons are not automatically included in cheesy configs;
addons must manage their own persistence or explicitly use `cheesy.UIState`.
Only tabs and sections created through `cheesy:Tab` and `cheesy:Section` are
tracked for addon reload and floor filtering.

## Development and checks

Edit `tools/cheesy_ui_state.luau`, then run `python3 tools/embed_ui_state.py` to
update the standalone script. With the Luau CLI installed, run:

```sh
python3 -m unittest discover -s tests -p 'test_*.py' -v
python3 tests/run_wind_native.py /path/to/luau
python3 tests/run_addons.py /path/to/luau
python3 tests/run_prompts.py /path/to/luau
luau-compile cheesy.deobfuscated.luau
```

The tests use Roblox/WindUI test doubles and check the migrated control inventory,
state behavior, config persistence, and addon reload/floor filtering. They do
not replace testing in Roblox with a supported executor.
