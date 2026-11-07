"""Offline Luau smoke tests for the repaired godmode state/remote paths.

Run only small extracted helpers with fake character parts and a fake Crouch
remote. Do not run the full Roblox/executor script or any fetched libraries.
"""
import argparse
import shutil
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'cheesy.deobfuscated.luau'


def extract(source: str, start: str, next_start: str) -> str:
    if source.count(start) != 1:
        raise AssertionError(f'Expected one {start!r} in output')
    a = source.index(start)
    b = source.index(next_start, a + len(start))
    return source[a:b]


def validate(luau: str) -> None:
    source = OUTPUT.read_text()
    functions = extract(source, 'local function getGodmodeMethod()',
                        'local function trackThreat(o)')
    functions += extract(source, 'local function applyGodmode()',
                         'local function saveCharacterPhysics()')
    toggle = extract(source, 'Toggles.Godmode:OnChanged(function(enabled)',
                     'Groupboxes.Other:AddDropdown(')
    render = extract(source,
                     'Connections.GodmodeEnforce = RunService.RenderStepped:Connect(function()',
                     'VulnerableLastY = nil')
    if 'GameRemotes.Crouch:FireServer(true, true)' in render:
        raise AssertionError('RenderStepped still sends unthrottled Crouch remotes')
    if 'tick() - CheesyState.LastCrouchFire > 0.1' not in render:
        raise AssertionError('RenderStepped lost its rate-limited Crouch path')
    for snippet in (functions, toggle, render):
        if any(unsafe in snippet for unsafe in ('HttpGet', 'loadstring', 'game:')):
            raise AssertionError('Test extraction includes unsafe code')
    test = '''
local attrs = {}
local calls = {}
local failRemote = false
local crouchRemote = {FireServer = function(_,value,fromScript)
    calls[#calls + 1] = {value, fromScript}
    assert(CheesyState.SkipGodmodeCrouchForce == true, "bypass only around direct call")
    if failRemote then error("mock remote failure") end
end}
Character = {
    Parent = true,
    GetAttribute = function(_,key) return attrs[key] end,
    SetAttribute = function(_,key,value) attrs[key] = value end,
    FindFirstChild = function() return nil end,
}
Humanoid = {HipHeight=2.5}
HumanoidRootPart = {CFrame=0}
Vector3 = {new=function(_,y) return y end}
CheesyState = {OriginalHipHeight=2.5, SkipGodmodeCrouchForce=false}
Toggles = {Godmode={Value=true}}
Options = {GodmodeMethod={Value="Always enabled"}}
CurrentFloor = "Hotel"
GameRemotes = {FindFirstChild=function(_,key) if key=="Crouch" then return crouchRemote end end}
GodmodeState = {ActiveThreats={}}
warn = function() end
local notices = {}
UiLibrary = {Notify=function(_,message) notices[#notices+1]=message.Description end}
Toggles.Godmode.OnChanged=function(_,callback) Toggles.Godmode.callback=callback end
local function TableClear(t) for k in pairs(t) do t[k]=nil end end
''' + functions + toggle + '''
assert(shouldUseGodmode())
applyGodmode()
assert(Character:GetAttribute("GodmodeSunk") == true)
assert(Humanoid.HipHeight == 0.05 and HumanoidRootPart.CFrame == -2.346)
assert(#calls == 1 and calls[1][1] == true)
assert(CheesyState.SkipGodmodeCrouchForce == false, "state must reset after success")
restoreGodmode()
assert(Character:GetAttribute("GodmodeSunk") == nil)
assert(Humanoid.HipHeight == 2.5 and HumanoidRootPart.CFrame == 0)
assert(#calls == 2 and calls[2][1] == false)
failRemote = true
applyGodmode()
assert(CheesyState.SkipGodmodeCrouchForce == false, "state must reset after failure")
failRemote = false
restoreGodmode()
Options.GodmodeMethod.Value = "On entity spawn"
assert(not shouldUseGodmode())
local threat = {Parent=true}
GodmodeState.ActiveThreats[threat] = true
assert(shouldUseGodmode())
threat.Parent = nil
assert(not shouldUseGodmode())
CurrentFloor = "Fools"
Options.GodmodeMethod.Value = "Always enabled"
assert(not shouldUseGodmode())
local beforeCalls = #calls
Toggles.Godmode.callback(true)
assert(#calls == beforeCalls and #notices == 1)
assert(notices[1]:find("Fools") ~= nil)
CurrentFloor = "Hotel"
CharacterCollisionPart = nil
Functions = {}
''' + extract(source, 'Functions.IsCrouching = function()', 'ESP_FIGURE_NAMES = {') + '''
assert(Functions.IsCrouching() == false)
CharacterCollisionPart = {CollisionGroup="PlayerCrouching"}
assert(Functions.IsCrouching() == true)
print("PASS: godmode apply/restore, transient remote guard, threat method, missing collision part")
'''
    with tempfile.TemporaryDirectory(prefix='godmode-isolated-') as folder:
        path = Path(folder) / 'godmode.luau'
        path.write_text(test)
        process = subprocess.run([luau, str(path)], cwd=folder,
                                 capture_output=True, text=True, timeout=10)
        if process.returncode or process.stderr or 'PASS: godmode' not in process.stdout:
            raise AssertionError(f'Godmode mock failed: {process.stdout} {process.stderr}')
        print(process.stdout.strip())


if __name__ == '__main__':
    cli = argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--luau', default=shutil.which('luau'))
    args = cli.parse_args()
    if not args.luau:
        cli.error('Luau CLI required: pass --luau PATH')
    validate(str(Path(args.luau).resolve()))
