"""Generate an OPTIONAL behavior-repair variant from the faithful reconstruction.

The original attachment has real movement bugs. These fixes deliberately differ
from it; never overwrite cheesy.deobfuscated.luau or call this exact recovery.
This script does not execute Luau or fetch any external code.
"""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'cheesy.deobfuscated.luau'
OUTPUT = ROOT / 'cheesy.movement-repaired.luau'


def replace_once(text: str, old: str, new: str) -> str:
    if text.count(old) != 1:
        raise AssertionError(f'Expected one movement patch target, found {text.count(old)}: {old[:90]!r}')
    return text.replace(old, new, 1)


def patch(text: str) -> str:
    assert text.startswith('-- Reconstructed from cheesy.obfuscated.luau.txt')
    text = replace_once(
        text,
        '\t\tCustomPhysics = PhysicalProperties.new(\n'
        '\t\t\t100,\n'
        '\t\t\tHumanoidRootPart.CustomPhysicalProperties.Friction,\n'
        '\t\t\tHumanoidRootPart.CustomPhysicalProperties.Elasticity,\n'
        '\t\t\tHumanoidRootPart.CustomPhysicalProperties.FrictionWeight,\n'
        '\t\t\tHumanoidRootPart.CustomPhysicalProperties.ElasticityWeight\n'
        '\t\t)',
        '\t\t-- CustomPhysicalProperties can be nil when the part uses its material defaults.\n'
        '\t\tlocal rootPhysics = HumanoidRootPart.CustomPhysicalProperties\n'
        '\t\t\tor HumanoidRootPart.CurrentPhysicalProperties\n'
        '\t\tif rootPhysics then\n'
        '\t\t\tCustomPhysics = PhysicalProperties.new(\n'
        '\t\t\t\t100,\n'
        '\t\t\t\trootPhysics.Friction,\n'
        '\t\t\t\trootPhysics.Elasticity,\n'
        '\t\t\t\trootPhysics.FrictionWeight,\n'
        '\t\t\t\trootPhysics.ElasticityWeight\n'
        '\t\t\t)\n'
        '\t\telse\n'
        '\t\t\tCustomPhysics = nil\n'
        '\t\tend')
    text = replace_once(text,
        '\t\t\t\tif Toggles.RemoveAcceleration and Toggles.RemoveAcceleration.Value then\n'
        '\t\t\t\t\tT.CustomPhysicalProperties = CustomPhysics\n',
        '\t\t\t\tif Toggles.RemoveAcceleration and Toggles.RemoveAcceleration.Value and CustomPhysics then\n'
        '\t\t\t\t\tT.CustomPhysicalProperties = CustomPhysics\n')
    text = replace_once(text,
        '\tToggles.RemoveAcceleration:OnChanged(function(o)\n'
        '\t\tfor T, k in pairs(PartProperties) do\n'
        '\t\t\tT.CustomPhysicalProperties = o and CustomPhysics or k\n',
        '\tToggles.RemoveAcceleration:OnChanged(function(o)\n'
        '\t\tfor T, k in pairs(PartProperties) do\n'
        '\t\t\tT.CustomPhysicalProperties = (o and CustomPhysics) or k\n')

    first = text.index('\tNoclipConnection = nil\n\tNoclipParts = {}\n')
    last = text.index('\tToggles.Noclip:OnChanged(updateNoclip)\n', first) + len('\tToggles.Noclip:OnChanged(updateNoclip)\n')
    text = text[:first] + '''\tNoclipConnection = nil
\tNoclipParts = {}
\tlocal noclipOriginalCollision = {}
\tlocal noclipDescendantConnection = nil
\tlocal noclipCharacter = nil
\tlocal function collectNoclipParts()
\t\tTableClear(NoclipParts)
\t\tif not Character then
\t\t\treturn
\t\tend
\t\tfor _, part in Character:GetDescendants() do
\t\t\tif part:IsA("BasePart") then
\t\t\ttable.insert(NoclipParts, part)
\t\t\tend
\t\tend
\tend
\tlocal function setNoclipPartsCollision(restore, force)
\t\tif restore then
\t\t\t-- Noclip and Phase share collision ownership. Do not undo one while
\t\t\t-- the other is active; an unload forces both to release it.
\t\t\tif not force and (Toggles.Noclip.Value or Toggles.Phase.Value) then
\t\t\t\treturn
\t\t\tend
\t\t\tfor part, original in pairs(noclipOriginalCollision) do
\t\t\t\tif part.Parent then
\t\t\t\t\tpart.CanCollide = original
\t\t\t\tend
\t\t\tend
\t\t\tTableClear(noclipOriginalCollision)
\t\t\treturn
\t\tend
\t\tfor _, part in ipairs(NoclipParts) do
\t\t\tif part.Parent then
\t\t\t\tif noclipOriginalCollision[part] == nil then
\t\t\t\t\tnoclipOriginalCollision[part] = part.CanCollide
\t\t\t\tend
\t\t\t\tpart.CanCollide = false
\t\t\tend
\t\tend
\tend
\tfunction updateNoclip()
\t\tif NoclipConnection then
\t\t\tNoclipConnection:Disconnect()
\t\t\tNoclipConnection = nil
\t\tend
\t\tif noclipDescendantConnection then
\t\t\tnoclipDescendantConnection:Disconnect()
\t\t\tnoclipDescendantConnection = nil
\t\tend
\t\tif noclipCharacter ~= Character then
\t\t\tsetNoclipPartsCollision(true, true)
\t\t\tnoclipCharacter = Character
\t\tend
\t\tif Toggles.Noclip.Value then
\t\t\tcollectNoclipParts()
\t\t\tsetNoclipPartsCollision(false)
\t\t\tif Character then
\t\t\t\tnoclipDescendantConnection = Character.DescendantAdded:Connect(function(part)
\t\t\t\t\tif part:IsA("BasePart") then
\t\t\t\t\t\ttable.insert(NoclipParts, part)
\t\t\t\t\t\tsetNoclipPartsCollision(false)
\t\t\t\t\tend
\t\t\t\tend)
\t\t\tend
\t\t\tNoclipConnection = RunService.Stepped:Connect(function()
\t\t\t\tsetNoclipPartsCollision(false)
\t\t\tend)
\t\telse
\t\t\tsetNoclipPartsCollision(true)
\t\tend
\tend
\tToggles.Noclip:OnChanged(updateNoclip)
''' + text[last:]
    text = replace_once(text,
        '\t\tif Toggles.Phase.Value then\n\t\t\tcollectPhaseParts()\n',
        '\t\tif Toggles.Phase.Value then\n\t\t\tcollectPhaseParts()\n\t\t\tcollectNoclipParts()\n')
    text = replace_once(text,
        '\t\t\t\t\tcollectPhaseParts()\n\t\t\t\tend)\n',
        '\t\t\t\t\tcollectPhaseParts()\n\t\t\t\t\tcollectNoclipParts()\n\t\t\t\tend)\n')
    phase = text.index('\tfunction updatePhase()\n')
    begin = text.index('\t\t\t\tfor o, T in ipairs(Phase.Parts) do\n', phase)
    end = text.index('\t\t\t\tif HumanoidRootPart and (Humanoid and (CurrentCamera and Phase.Body)) then\n', begin)
    text = text[:begin] + '\t\t\t\tsetNoclipPartsCollision(false)\n' + text[end:]
    text = replace_once(text,
        '\t\tif NoclipConnection then\n\t\t\tNoclipConnection:Disconnect()\n'
        '\t\t\tNoclipConnection = nil\n\t\t\tpcall(setNoclipPartsCollision, true)\n\t\tend\n',
        '\t\tif NoclipConnection then\n\t\t\tNoclipConnection:Disconnect()\n'
        '\t\t\tNoclipConnection = nil\n\t\tend\n'
        '\t\tif noclipDescendantConnection then\n'
        '\t\t\tnoclipDescendantConnection:Disconnect()\n'
        '\t\t\tnoclipDescendantConnection = nil\n'
        '\t\tend\n'
        '\t\tpcall(setNoclipPartsCollision, true, true)\n')
    # TwerkDance originally never stored its animation track, so off was a no-op.
    text = replace_once(text,
        '\t\t\tlocal P = k:LoadAnimation(o)\n\t\t\tP.Looped = true\n\t\t\tP:Play()\n'
        '\t\telse\n\t\t\tif TwerkTrack then\n\t\t\t\tTwerkTrack:Stop()\n\t\t\tend\n',
        '\t\t\tif TwerkTrack then\n\t\t\t\tTwerkTrack:Stop()\n\t\t\tend\n'
        '\t\t\tTwerkTrack = k:LoadAnimation(o)\n'
        '\t\t\tTwerkTrack.Looped = true\n'
        '\t\t\tTwerkTrack:Play()\n'
        '\t\telse\n\t\t\tif TwerkTrack then\n'
        '\t\t\t\tTwerkTrack:Stop()\n'
        '\t\t\t\tTwerkTrack = nil\n\t\t\tend\n')
    return text.replace(
        '-- Reconstructed from cheesy.obfuscated.luau.txt by tools/deobfuscate.py.',
        '-- Movement-repaired variant; intentional changes from the original attachment.\n'
        '-- See MOVEMENT_REPAIRS.md; not runtime-tested in Roblox.', 1)


if __name__ == '__main__':
    OUTPUT.write_text(patch(SOURCE.read_text()))
    print(f'Wrote {OUTPUT} ({OUTPUT.stat().st_size:,} bytes)')
