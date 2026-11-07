"""Intentional, localized behavior repairs applied after static deobfuscation.

The attachment itself has these defects. Preserve the cipher/guard and all
unrelated code; match unique source boundaries in both compact and formatted
Luau. The checker compiles and tests extracted repaired functions, not Roblox.
"""
import re

# Unique source boundaries (the generator emits compact Luau; the checked-in
# deliverable is formatted). Never replace an unexpected occurrence silently.
BOUNDARIES = (
    ('physics', r'local function saveCharacterPhysics\(\)', r'local function detectFloor\(\)'),
    ('accel', r'Toggles\s*\.\s*RemoveAcceleration\s*:\s*OnChanged\(function\(o\)', r'Toggles\s*\.\s*EnableCharacterJump\s*:\s*OnChanged\(function\(o\)'),
    ('twerk', r'Toggles\s*\.\s*TwerkDance\s*:\s*OnChanged\(function\(o\)', r'Functions\s*=\s*\{'),
    ('noclip', r'NoclipConnection\s*=\s*nil\s+NoclipParts\s*=\s*\{\}', r'MonumentParts\s*=\s*\{\}'),
    ('phase', r'function updatePhase\(\)', r'Toggles\s*\.\s*Phase\s*:\s*OnChanged\(updatePhase\)'),
    ('godmode_should', r'local function shouldUseGodmode\(\)', r'local function trackThreat\(o\)'),
    ('godmode_toggle', r'Toggles\s*\.\s*Godmode\s*:\s*OnChanged\(function\(o\)', r'Groupboxes\s*\.\s*Other\s*:\s*AddDropdown\('),
    ('godmode_apply', r'local function applyGodmode\(\)', r'local function restoreGodmode\(\)'),
    ('godmode_restore', r'local function restoreGodmode\(\)', r'local function saveCharacterPhysics\(\)'),
    ('godmode_render', r'Connections\s*\.\s*GodmodeEnforce\s*=\s*RunService\s*\.\s*RenderStepped\s*:\s*Connect\(function\(\)', r'VulnerableLastY\s*=\s*nil'),
    ('crouch', r'Functions\s*\.\s*IsCrouching\s*=\s*function\(\)', r'ESP_FIGURE_NAMES\s*=\s*\{'),
    ('unload', r'if\s+NoclipConnection\s+then', r'if\s+ET\s+then'),
)

FRAGMENTS = {
    'physics': """local function saveCharacterPhysics()
		if not Character or not HumanoidRootPart then
			return
		end
		TableClear(PartProperties)
		-- CustomPhysicalProperties can be nil when the part uses its material defaults.
		local rootPhysics = HumanoidRootPart.CustomPhysicalProperties
			or HumanoidRootPart.CurrentPhysicalProperties
		if rootPhysics then
			CustomPhysics = PhysicalProperties.new(
				100,
				rootPhysics.Friction,
				rootPhysics.Elasticity,
				rootPhysics.FrictionWeight,
				rootPhysics.ElasticityWeight
			)
		else
			CustomPhysics = nil
		end
		for o, T in Character:GetDescendants() do
			if T:IsA("BasePart") then
				PartProperties[T] = T.CustomPhysicalProperties
				if Toggles.RemoveAcceleration and Toggles.RemoveAcceleration.Value and CustomPhysics then
					T.CustomPhysicalProperties = CustomPhysics
				end
			end
		end
	end
""",
    'accel': """Toggles.RemoveAcceleration:OnChanged(function(o)
		for T, k in pairs(PartProperties) do
			T.CustomPhysicalProperties = (o and CustomPhysics) or k
		end
	end)
""",
    'twerk': """Toggles.TwerkDance:OnChanged(function(o)
		local T = LocalPlayer.Character
		if not T then
			return
		end
		if o then
			local o = Instance.new("Animation")
			o.AnimationId = "rbxassetid://12874447851"
			local k = T:FindFirstChildOfClass("Humanoid")
			if not k then
				return
			end
			if TwerkTrack then
				TwerkTrack:Stop()
			end
			TwerkTrack = k:LoadAnimation(o)
			TwerkTrack.Looped = true
			TwerkTrack:Play()
		else
			if TwerkTrack then
				TwerkTrack:Stop()
				TwerkTrack = nil
			end
		end
	end)
""",
    'noclip': """NoclipConnection = nil
	NoclipParts = {}
	local noclipOriginalCollision = {}
	local noclipDescendantConnection = nil
	local noclipCharacter = nil
	local function collectNoclipParts()
		TableClear(NoclipParts)
		if not Character then
			return
		end
		for _, part in Character:GetDescendants() do
			if part:IsA("BasePart") then
			table.insert(NoclipParts, part)
			end
		end
	end
	local function setNoclipPartsCollision(restore, force)
		if restore then
			-- Noclip and Phase share collision ownership. Do not undo one while
			-- the other is active; an unload forces both to release it.
			if not force and (Toggles.Noclip.Value or Toggles.Phase.Value) then
				return
			end
			for part, original in pairs(noclipOriginalCollision) do
				if part.Parent then
					part.CanCollide = original
				end
			end
			TableClear(noclipOriginalCollision)
			return
		end
		for _, part in ipairs(NoclipParts) do
			if part.Parent then
				if noclipOriginalCollision[part] == nil then
					noclipOriginalCollision[part] = part.CanCollide
				end
				part.CanCollide = false
			end
		end
	end
	function updateNoclip()
		if NoclipConnection then
			NoclipConnection:Disconnect()
			NoclipConnection = nil
		end
		if noclipDescendantConnection then
			noclipDescendantConnection:Disconnect()
			noclipDescendantConnection = nil
		end
		if noclipCharacter ~= Character then
			setNoclipPartsCollision(true, true)
			noclipCharacter = Character
		end
		if Toggles.Noclip.Value then
			collectNoclipParts()
			setNoclipPartsCollision(false)
			if Character then
				noclipDescendantConnection = Character.DescendantAdded:Connect(function(part)
					if part:IsA("BasePart") then
						table.insert(NoclipParts, part)
						setNoclipPartsCollision(false)
					end
				end)
			end
			NoclipConnection = RunService.Stepped:Connect(function()
				setNoclipPartsCollision(false)
			end)
		else
			setNoclipPartsCollision(true)
		end
	end
	Toggles.Noclip:OnChanged(updateNoclip)
""",
    'phase': """function updatePhase()
		if Phase.Connection then
			Phase.Connection:Disconnect()
			Phase.Connection = nil
		end
		if Phase.Body then
			Phase.Body:Destroy()
			Phase.Body = nil
		end
		if Phase.CharConn then
			Phase.CharConn:Disconnect()
			Phase.CharConn = nil
		end
		if Toggles.Phase.Value then
			collectPhaseParts()
			collectNoclipParts()
			if Character then
				Phase.CharConn = Character.ChildAdded:Connect(function()
					task.wait()
					collectPhaseParts()
					collectNoclipParts()
				end)
			end
			Phase.Connection = RunService.Stepped:Connect(function()
				if not Character then
					return
				end
				setNoclipPartsCollision(false)
				if HumanoidRootPart and (Humanoid and (CurrentCamera and Phase.Body)) then
					local o = Vector3.zero
					local T = Humanoid.MoveDirection
					if T.Magnitude > 0 then
						local k = CurrentCamera.CFrame.LookVector
						local P = CurrentCamera.CFrame.RightVector
						local w = T:Dot(k)
						local F = T:Dot(P)
						o = k * w + P * F
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
						o = o + Vector3.yAxis
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
						o = o - Vector3.yAxis
					end
					if o.Magnitude > 0 then
						o = o.Unit
					end
					Phase.Body.Velocity = o * 2.25
				end
			end)
			Phase.Body = Instance.new("BodyVelocity")
			Phase.Body.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
			Phase.Body.P = math.huge
			Phase.Body.Velocity = Vector3.zero
			if HumanoidRootPart then
				Phase.Body.Parent = HumanoidRootPart
			end
		elseif not Toggles.Noclip.Value then
			collectNoclipParts()
			setNoclipPartsCollision(true)
		end
	end
""",
    'unload': """if NoclipConnection then
			NoclipConnection:Disconnect()
			NoclipConnection = nil
		end
		if noclipDescendantConnection then
			noclipDescendantConnection:Disconnect()
			noclipDescendantConnection = nil
		end
		pcall(setNoclipPartsCollision, true, true)
""",
    'godmode_should': """local function shouldUseGodmode()
        if not (Toggles and (Toggles.Godmode and Toggles.Godmode.Value)) then
            return false
        end
        -- The attachment's sink implementation explicitly does nothing on
        -- these floors. Do not keep spoofing the Crouch remote there.
        if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
            return false
        end
        if getGodmodeMethod() == 1 then
            return true
        end
        return hasActiveThreats()
    end
""",
    'godmode_toggle': """Toggles.Godmode:OnChanged(function(enabled)
        if enabled then
            if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
                UiLibrary:Notify({
                    ["Title"] = "Godmode unavailable",
                    ["Description"] = "This godmode method does not support " .. tostring(CurrentFloor),
                    ["Time"] = 5,
                })
                return
            end
            if shouldUseGodmode() then
                applyGodmode()
            end
        else
            restoreGodmode()
        end
    end)
""",
    'godmode_apply': """local function applyGodmode()
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
			return
		end
		-- The root moves down for the server, but the torso must move up
		-- relative to it in the SAME update so the local avatar stays level.
		local lowerTorso = Character:FindFirstChild("LowerTorso")
		local rootJoint = lowerTorso and lowerTorso:FindFirstChild("Root")
		if not rootJoint then
			if not GodmodeState.MissingVisualJointWarned then
				GodmodeState.MissingVisualJointWarned = true
				warn("Godmode unavailable: LowerTorso.Root joint is missing; cannot hide the visual sink")
			end
			return
		end
		if not CheesyState.OriginalC1 then
			CheesyState.OriginalC1 = rootJoint.C1
		end
		if not Character:GetAttribute("GodmodeSunk") then
			rootJoint.C1 = CheesyState.OriginalC1 * CFrame.new(0, -2.346, 0)
			HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, -2.346, 0)
			Humanoid.HipHeight = 0.05
			Character:SetAttribute("GodmodeSunk", true)
			CheesyState.SkipGodmodeCrouchForce = true
			local remoteOk, remoteError = pcall(function()
				if GameRemotes then
					local crouch = GameRemotes:FindFirstChild("Crouch")
					if crouch then
						crouch:FireServer(true, true)
					end
				end
			end)
			CheesyState.SkipGodmodeCrouchForce = false
			if not remoteOk then
				warn("Godmode Crouch remote failed: " .. tostring(remoteError))
			end
		end
	end
""",
    'godmode_restore': """local function restoreGodmode()
        if not Character or not Humanoid or not HumanoidRootPart then
            return
        end
        if Character:GetAttribute("GodmodeSunk") then
            -- Undo both halves together; waiting for RenderStepped can make
            -- the local avatar visibly drop or jump for a frame.
            local lowerTorso = Character:FindFirstChild("LowerTorso")
            local rootJoint = lowerTorso and lowerTorso:FindFirstChild("Root")
            if rootJoint and CheesyState.OriginalC1 then
                rootJoint.C1 = CheesyState.OriginalC1
            end
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 2.346, 0)
            Character:SetAttribute("GodmodeSunk", nil)
        end
        Humanoid.HipHeight = CheesyState.OriginalHipHeight or 2.396
        CheesyState.SkipGodmodeCrouchForce = true
        pcall(function()
            local crouch = GameRemotes and GameRemotes:FindFirstChild("Crouch")
            if crouch then
                crouch:FireServer(false, false)
            end
            Character:SetAttribute("Crouching", false)
        end)
        CheesyState.SkipGodmodeCrouchForce = false
    end
""",
    'godmode_render': """Connections.GodmodeEnforce = RunService.RenderStepped:Connect(function()
		if _Unloading then
			return
		end
		if not Character or not Humanoid or not HumanoidRootPart then
			return
		end
		if not Toggles or not Toggles.Godmode then
			return
		end
		local o = shouldUseGodmode()
		local T = Character:GetAttribute("GodmodeSunk") and true or false
		if o and not T then
			applyGodmode()
		elseif not o and T then
			restoreGodmode()
		end
		if
			CurrentFloor ~= "Fools"
			and (
				CurrentFloor ~= "OldHotel"
				and not (CurrentCamera and CurrentCamera:FindFirstChild("MinecartRig"))
			)
		then
			HumanoidRootPart.CanCollide = false
		end
		for o, T in Character:GetChildren() do
			if T:IsA("BasePart") then
				T.CanCollide = false
			end
		end
		local k = Character:FindFirstChild("Collision")
		local P = Character:FindFirstChild("CollisionPart")
		local w = Character:FindFirstChild("CollisionClone")
		if CurrentFloor == "OldHotel" or CurrentFloor == "Fools" then
			local T = o and (Functions.GetNearestEntity() and 200)
				or Toggles.FigureGodmodeFools and (Toggles.FigureGodmodeFools.Value and (Functions.GetNearestFigure() and 200))
				or 0
			CheesyState.SpoofOffset = T
			if k then
				k.Position = HumanoidRootPart.Position + Vector3.new(0, T, 0)
				k.CanCollide = false
			end
			if CurrentFloor == "Fools" then
				if k and k:FindFirstChild("CollisionCrouch") then
					k.CollisionCrouch.CanCollide = false
				end
				if w and w:FindFirstChild("CollisionCrouch") then
					w.CollisionCrouch.CanCollide = false
				end
			end
			HumanoidRootPart.CanCollide = not Toggles.Noclip.Value
		else
			if k then
				k.CanCollide = false
				if k:FindFirstChild("CollisionCrouch") then
					k.CollisionCrouch.CanCollide = false
				end
			end
			if w and w:FindFirstChild("CollisionCrouch") then
				local T = o or Functions.IsCrouching()
				w.CanCollide = not (Toggles.Noclip.Value or T)
				w.CollisionCrouch.CanCollide = not (Toggles.Noclip.Value or not T)
			elseif w then
				w.CanCollide = not (Toggles.Noclip.Value or o or Functions.IsCrouching())
			else
				HumanoidRootPart.CanCollide = not Toggles.Noclip.Value
			end
			local T = Character:FindFirstChild("LowerTorso")
			local F = T and T:FindFirstChild("Root")
			if F and CheesyState.OriginalC1 then
				F.C1 = CheesyState.OriginalC1 * CFrame.new(0, o and -2.346 or 0, 0)
			end
			local A = o and 2.328 or 0.18
			if k then
				k.Position = HumanoidRootPart.Position + Vector3.new(0, A, 0)
			end
			if P then
				P.Position = HumanoidRootPart.Position + Vector3.new(0, A, 0)
			end
			if
				k and (k:FindFirstChild("CollisionCrouch") and (w and w:FindFirstChild("CollisionCrouch")))
			then
				local T = o and 1.328 or -0.982
				k.CollisionCrouch.Position = HumanoidRootPart.Position + Vector3.new(0, T, 0)
				w.CollisionCrouch.CollisionGroup = k.CollisionCrouch.CollisionGroup
			end
			if w and w:FindFirstChild("CollisionCrouch") then
				w.CollisionCrouch.Position = HumanoidRootPart.Position
					+ Vector3.new(0, o and 0.75 or -0.982, 0)
			end
		end
		if w and k then
			w.CollisionGroup = k.CollisionGroup
			w.Position = HumanoidRootPart.Position + Vector3.new(0, o and 1.75 or 0.18, 0)
		end
		local F = GameRemotes and GameRemotes:FindFirstChild("Crouch")
		if F and (CharacterCollisionPart and tick() - CheesyState.LastCrouchFire > 0.1) then
			local T = o or Functions.IsCrouching()
			if Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value then
				T = true
			end
			F:FireServer(T and true or false, true)
			CheesyState.LastCrouchFire = tick()
		end
		local A = o or Functions.IsCrouching()
		if Toggles.CrouchSpoof and Toggles.CrouchSpoof.Value then
			A = true
		end
		if Character:GetAttribute("Crouching") ~= A then
			Character:SetAttribute("Crouching", A)
		end
	end)
""",
    'crouch': """Functions.IsCrouching = function()
		if CurrentFloor == "Fools" or CurrentFloor == "OldHotel" then
			return Character:GetAttribute("Crouching")
		end
		return CharacterCollisionPart ~= nil and CharacterCollisionPart.CollisionGroup == "PlayerCrouching"
	end
""",
}


def repair(text: str) -> str:
    for name, start, finish in BOUNDARIES:
        matches = list(re.finditer(start, text))
        if name == 'unload':
            # The same conditional may appear outside unload; choose the one
            # inside its local function, after the movement helpers.
            anchor = text.index('local function unloadCheesy()')
            matches = [m for m in matches if m.start() > anchor]
        if len(matches) != 1:
            raise AssertionError(f'{name}: expected one start, got {len(matches)}')
        begin = matches[0].start()
        end = re.search(finish, text[begin:])
        if end is None:
            raise AssertionError(f'{name}: end boundary missing')
        stop = begin + end.start()
        if stop <= begin:
            raise AssertionError(name)
        text = text[:begin] + FRAGMENTS[name].strip() + '\n\t' + text[stop:]
    return text
