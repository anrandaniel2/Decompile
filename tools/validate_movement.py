"""Isolated Luau-VM checks for repaired movement in the main readable script.

Only the extracted physics, animation, and collision functions are executed
against plain tables and signals; neither full script nor Roblox APIs run.
"""
import argparse
import shutil
import subprocess
import tempfile
from pathlib import Path

OUTPUT = Path(__file__).resolve().parents[1] / 'cheesy.deobfuscated.luau'


def extract(text: str, start: str, end: str) -> str:
    assert text.count(start) == text.count(end) == 1, (start, end)
    return text[text.index(start):text.index(end)]


def run(luau: str, folder: Path, name: str, snippet: str, setup: str, check: str):
    # Never include the full script or fetched code in a VM test.
    assert 'HttpGet' not in snippet and 'loadstring' not in snippet and 'game:' not in snippet
    script = folder / (name + '.luau')
    script.write_text(setup + '\n' + snippet + '\n' + check)
    result = subprocess.run([luau, str(script)], cwd=folder, capture_output=True,
                            text=True, timeout=10)
    if result.returncode or 'PASS:' not in result.stdout or result.stderr:
        raise AssertionError(f'{name}: {result.stdout} {result.stderr}')
    print(result.stdout.strip())


def main(luau: str):
    patched = OUTPUT.read_text()
    compiler = Path(luau).with_name('luau-compile')
    subprocess.run([str(compiler), '--null', str(OUTPUT)],
                   check=True, capture_output=True, timeout=30)

    collision = extract(patched, '\tNoclipConnection = nil\n\tNoclipParts = {}\n',
                        '\tMonumentParts = {}\n')
    # The extraction stops before the unrelated monument code; it contains
    # just the collision functions and their OnChanged registration.
    collision_setup = '''local function signal()
    local s = {}
    function s:Connect(fn) self.fn=fn; return {Disconnect=function() s.fn=nil end} end
    function s:Fire(...) if self.fn then self.fn(...) end end
    return s
end
local function part(collides)
    return {Parent=true, CanCollide=collides, IsA=function(_,class) return class=="BasePart" end}
end
local root, collider = part(false), part(true)
Character = {DescendantAdded=signal(), GetDescendants=function() return {root,collider} end}
local function TableClear(t) for key in pairs(t) do t[key]=nil end end
Toggles = {Noclip={Value=false,OnChanged=function(self,fn) self.callback=fn end}, Phase={Value=false}}
RunService = {Stepped=signal()}
'''
    collision_check = '''Toggles.Noclip.Value=true
updateNoclip()
assert(not root.CanCollide and not collider.CanCollide)
local added=part(true)
Character.DescendantAdded:Fire(added)
assert(not added.CanCollide, "new parts must also be suppressed")
Toggles.Noclip.Value=false
updateNoclip()
assert(not root.CanCollide and collider.CanCollide and added.CanCollide,
       "each part's previous collision value must be restored")
Toggles.Noclip.Value=true
updateNoclip()
Toggles.Phase.Value=true
Toggles.Noclip.Value=false
updateNoclip()
assert(not collider.CanCollide, "Phase still owns collision")
Toggles.Phase.Value=false
setNoclipPartsCollision(true)
assert(collider.CanCollide)
print("PASS: noclip restoration, descendants, and Phase overlap")
'''
    physics = extract(patched, '\tlocal function saveCharacterPhysics()\n',
                      '\tlocal function detectFloor()\n')
    dance = extract(patched, '\tToggles.TwerkDance:OnChanged(function(o)\n',
                    '\tFunctions =')
    physics_setup = '''local function TableClear(t) for key in pairs(t) do t[key]=nil end end
local part = {CustomPhysicalProperties=nil,
    CurrentPhysicalProperties={Friction=.3, Elasticity=.5, FrictionWeight=1, ElasticityWeight=2},
    IsA=function(_,class) return class=="BasePart" end}
HumanoidRootPart = part
Character = {GetDescendants=function() return {part} end,
    FindFirstChildOfClass=function() return {LoadAnimation=function()
        return {Play=function(t) t.played=true end, Stop=function(t) t.stopped=true end}
    end} end}
PartProperties = {}
Toggles = {RemoveAcceleration={Value=true},
    TwerkDance={OnChanged=function(self,fn) self.callback=fn end}}
PhysicalProperties = {new=function(d,f,e,fw,ew)
    return {Density=d,Friction=f,Elasticity=e,FrictionWeight=fw,ElasticityWeight=ew}
end}
LocalPlayer = {Character=Character}
Instance = {new=function() return {} end}
'''
    physics_check = '''saveCharacterPhysics()
assert(CustomPhysics and CustomPhysics.Density==100 and CustomPhysics.Friction==.3)
assert(part.CustomPhysicalProperties == CustomPhysics)
Toggles.TwerkDance.callback(true)
local active = TwerkTrack
assert(active and active.played)
Toggles.TwerkDance.callback(false)
assert(active.stopped and TwerkTrack==nil)
print("PASS: nil root material physics and animation toggle on/off")
'''
    with tempfile.TemporaryDirectory(prefix='movement-isolated-') as folder:
        folder = Path(folder)
        run(luau, folder, 'collision', collision, collision_setup, collision_check)
        run(luau, folder, 'physics-and-animation', physics + dance,
            physics_setup, physics_check)


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--luau', default=shutil.which('luau'))
    args = cli.parse_args()
    if not args.luau:
        cli.error('Luau CLI required: pass --luau PATH')
    main(str(Path(args.luau).resolve()))
