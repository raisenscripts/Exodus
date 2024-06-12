getgenv().Exodus = {
    Options = {
        ['Intro'] = true,
        ['SerialKey'] = "ur_key_here" 
    },
    Aimbot = {
        ['Enabled'] = true,
        ['Keybinds'] = "q",
        ['Locking'] = false, -- // don't touch
        ['Prediction'] = 0.1365, 
        ['Smoothing'] = false,
        ['Smoothness'] = 0.08,
        ['Shake'] = false,
        ['Value'] = 0.7, -- // Shake Value
        ['NormalAimpart'] = "HumanoidRootPart",
        ['IgnorePart'] = true,
        ['IgnoredParts'] = {"RightFoot", "LeftFoot"},
		['AimpartType'] = "Nearest Part", -- // "Normal", "Nearest Part", "Nearest Point"
        ['Aimpart'] = "HumanoidRootPart",
    },
    FOV = {
        ['Enabled'] = false,
        ['Amount'] = 3000, -- // Dynamic Value
        ['FOVType'] = "Static", -- // "Dynamic", "Static"
        ['Radius'] = 120,
        ['Filled'] = false,
        ['Sides'] = 25,
        ['Thickness'] = 1,
        ['Transparency'] = 1,
        ['Color'] = Color3.fromRGB(74, 219, 0)
    },
    Resolving = {
        ['Enabled'] = true,
        ['Type'] = "When Velocity is too high",
        ['Positive'] = 60,
        ['Negetive'] = 60
    },
    Checks = {
        ['YAxis'] = false,
        ['Wall'] = true,
        ['Visible'] = true,
        ['ForceField'] = true,
        ['SelfAlive'] = true,
        ['KO'] = true,
        ['Grabbed'] = true,
        ['Crew'] = false,
        ['InFOV'] = false,
        ['SelfReload'] = false,
        ['FirstPerson'] = false,
        ['AllowThirdPersonShiftLock'] = false,
        ['ThirdPerson'] = false,
    },
    Macro = {
        ['Keybind'] = "v",
        ['Speed'] = 1,
        ['Type'] = "First" -- // "First", "Third"
    },
    Direction = { -- // Silent Aim
        ['Enabled'] = true,
        ['Keybinds'] = "p",
        ['Prediction'] = 0.12,
        ['AimpartType'] = "Nearest Point", -- // "Normal", "Nearest Part", "Nearest Point"
        ['Aimpart'] = "HumanoidRootPart",
        ['NormalAimpart'] = "HumanoidRootPart",
        ['IgnorePart'] = true,
        ['IgnoredParts'] = {"LeftFoot", "RightFoot"}
    },
    Resolving = {
        ['Enabled'] = false,
        ['Type'] = "When Velocity is too high",
        ['Positive'] = 60,
        ['Negetive'] = 60,
    },
    FOV = {
        ['Enabled'] = true,
        ['Radius'] = 120,
        ['FOVType'] = "Static", -- // "Dynamic", "Static"
        ['FOVType2'] = "Cursor",
        ['Amount'] = 3000,
        ['Filled'] = false,
        ['Sides'] = 25,
        ['Thickness'] = 1,
        ['Transparency'] = 1,
        ['Color'] = Color3.fromRGB(74, 219, 0)
    },
    Checks = {
        ['HitChance'] = 100,
        ['YAxis'] = false,
        ['SelfAlive'] = true,
        ['SelfReload'] = true,
        ['InFOV'] = true,
        ['Grabbed'] = true,
        ['ForceField'] = false,
        ['Crew'] = false,
        ['Wall'] = false,
        ['KO'] = false,
    },
    NoClip = {
        ['Enabled'] = true,
        ['Key'] = "t",
        ['GunName'] = "[Shotgun]",
        ['Delay'] = 0.1
    }
}

script_key = getgenv().Exodus.Options.SerialKey
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
local Players = game:GetService("Players")
local LP = Players["LocalPlayer"]
while not LP do -- // Leaked by Splitta & Consist /My Larp
    Players["ChildAdded"]:Wait()
    LP = Players["LocalPlayer"] -- // Leaked by Splitta & Consist /My Larp
end
local Char = LP["Character"]
while not Char do -- // Leaked by Splitta & Consist /My Larp
    LP["CharacterAdded"]:Wait() -- // Leaked by Splitta & Consist /My Larp
    Char = LP["Character"]
end -- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
local Services = { 
    Workspace = game:GetService("Workspace"),
    RunService = game:GetService("RunService"),
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    GuiService = game:GetService("GuiService"),
    ReplicatedStorage = game:GetService("ReplicatedStorage")
}

local Local = {
    Player = Services.Players.LocalPlayer,
    Camera = Services.Workspace.CurrentCamera,
    Mouse = Services.Players.LocalPlayer:GetMouse()
}
-- // Leaked by Splitta & Consist /My Larp
local AimlockTarget, RootPartPosition, Real_Magnitude, vis, ray, ignoreList, part, Velocity, Main, feign,
    AimlockTargetName, SilentTarget, Aimplace, SilentVelocity, CurrentPosition, Time, Distance, SilCurrentPosition,
    SilTime, SilDistance, pos, ac, idk -- // Leaked by Splitta & Consist /My Larp

local Keybinds = {
    Aimbot = Enum.KeyCode.Q, -- // Leaked by Splitta & Consist /My Larp
    Direction = Enum.KeyCode.P -- // Leaked by Splitta & Consist /My Larp
}
 -- // Leaked by Splitta & Consist /My Larp
local Player = game:GetService("Players").LocalPlayer -- // Leaked by Splitta & Consist /My Larp
local Mouse = Player:GetMouse() -- // Leaked by Splitta & Consist /My Larp
local SilPreviousPosition = Vector3.new() -- // Leaked by Splitta & Consist /My Larp
local PreviousPosition = Vector3.new() -- // Leaked by Splitta & Consist /My Larp

local CamCircle = Drawing.new("Circle") -- // Leaked by Splitta & Consist /My Larp 
CamCircle.Color = getgenv().Exodus.FOV.Color -- // Leaked by Splitta & Consist /My Larp
CamCircle.Thickness = getgenv().Exodus.FOV.Thickness -- // Leaked by Splitta & Consist /My Larp
CamCircle.Transparency = getgenv().Exodus.FOV.Transparency -- // Leaked by Splitta & Consist /My Larp
CamCircle.NumSides = getgenv().Exodus.FOV.Sides -- // Leaked by Splitta & Consist /My Larp
CamCircle.Radius = getgenv().Exodus.FOV.Radius -- // Leaked by Splitta & Consist /My Larp
CamCircle.Visible = getgenv().Exodus.FOV.Enabled -- // Leaked by Splitta & Consist /My Larp
CamCircle.Filled = getgenv().Exodus.FOV.Filled -- // Leaked by Splitta & Consist /My Larp
 -- // Leaked by Splitta & Consist /My Larp
local SilentCircle = Drawing.new("Circle") -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Visible = getgenv().Exodus.FOV.Enabled -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Transparency = getgenv().Exodus.FOV.Transparency -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Radius = getgenv().Exodus.FOV.Radius -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Thickness = getgenv().Exodus.FOV.Thickness -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Color = getgenv().Exodus.FOV.Color -- // Leaked by Splitta & Consist /My Larp
SilentCircle.NumSides = getgenv().Exodus.FOV.Sides -- // Leaked by Splitta & Consist /My Larp
SilentCircle.Filled = getgenv().Exodus.FOV.Filled -- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
local function IsOnScreen(a, Setting) -- // Leaked by Splitta & Consist /My Larp
    if Setting.Visible then -- // Leaked by Splitta & Consist /My Larp
        local _, vis = Services.Workspace.CurrentCamera:WorldToScreenPoint(a.Position) -- // Leaked by Splitta & Consist /My Larp
        if vis then -- // Leaked by Splitta & Consist /My Larp
            return true -- // Leaked by Splitta & Consist /My Larp 
        else -- // Leaked by Splitta & Consist /My Larp 
            return false -- // Leaked by Splitta & Consist /My Larp
        end -- // Leaked by Splitta & Consist /My Larp
    else -- // Leaked by Splitta & Consist /My Larp
        return true -- // Leaked by Splitta & Consist /My Larp
    end -- // Leaked by Splitta & Consist /My Larp
end -- // Leaked by Splitta & Consist /My Larp

local function Wall(a, Setting) -- // Leaked by Splitta & Consist /My Larp
    if Setting.Wall then -- // Leaked by Splitta & Consist /My Larp
        ray = Ray.new(Local.Camera.CFrame.Position, a.HumanoidRootPart.Position - Local.Camera.CFrame.Position)
        ignoreList = {Local.Player.Character, a.Parent}
        part = Services.Workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
        if not part then -- // Leaked by Splitta & Consist /My Larp
            return true -- // Leaked by Splitta & Consist /My Larp
        end -- // Leaked by Splitta & Consist /My Larp
        return false -- // Leaked by Splitta & Consist /My Larp
    else
        return true -- // Leaked by Splitta & Consist /My Larp 
    end
end -- // Leaked by Splitta & Consist /My Larp

local function IsInRadius(a, Setting) -- // Leaked by Splitta & Consist /My Larp
    if Setting.InFOV then
        for _, v in pairs(a:GetChildren()) do
            if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
                local pos = Local.Camera:WorldToViewportPoint(v.Position)
                local dis = (Vector2.new(Local.Mouse.X, Local.Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                if dis < SilentCircle.Radius then
                    return true
                end
            elseif v:IsA("Accessory") then
                local pos = Local.Camera:WorldToViewportPoint(v.Handle.Position)
                local dis = (Vector2.new(Local.Mouse.X, Local.Mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                if dis < SilentCircle.Radius then
                    return true
                end
            end
        end
        return false
    else
        return true
    end
end

local function Grabbed(a, Setting)
    if Setting.Grabbed then -- // Leaked by Splitta & Consist /My Larp
        if a:FindFirstChild("GRABBING_CONSTRAINT") ~= nil then
            return false -- // Leaked by Splitta & Consist /My Larp 
        else
            return true -- // Leaked by Splitta & Consist /My Larp
        end
    else -- // Leaked by Splitta & Consist /My Larp
        return true
    end
end

local function getClosestPartToCursor(a, Setting)
    local closestPart -- // Leaked by Splitta & Consist /My Larp
    local shortestDistance = math.huge -- // Leaked by Splitta & Consist /My Larp
    if Setting.IgnorePart then -- // Leaked by Splitta & Consist /My Larp
        for _, v in pairs(a:GetChildren()) do -- // Leaked by Splitta & Consist /My Larp
            if (not table.find(Setting.IgnoredParts, v.Name)) then
                if v:IsA("Part") or v:IsA("MeshPart") then -- // Leaked by Splitta & Consist /My Larp
                    local WrldToViewportPointP = Services.Workspace.CurrentCamera:WorldToScreenPoint(v.Position)
                    local Distance = (Vector2.new(WrldToViewportPointP.X, WrldToViewportPointP.Y) -
                                         Vector2.new(Local.Mouse.X, Local.Mouse.Y)).Magnitude
                    if Distance < shortestDistance then -- // Leaked by Splitta & Consist /My Larp
                        shortestDistance = Distance -- // Leaked by Splitta & Consist /My Larp
                        closestPart = v -- // Leaked by Splitta & Consist /My Larp
                    end
                end
            end
        end
        return closestPart -- // Leaked by Splitta & Consist /My Larp
    elseif not Setting.IgnorePart then -- // Leaked by Splitta & Consist /My Larp
        for _, v in next, a:GetChildren() do
            if v:IsA("Part") or v:IsA("MeshPart") then -- // Leaked by Splitta & Consist /My Larp
                local WrldToViewportPointP = Services.Workspace.CurrentCamera:WorldToScreenPoint(v.Position)
                local Distance = (Vector2.new(WrldToViewportPointP.X, WrldToViewportPointP.Y) -
                                     Vector2.new(Local.Mouse.X, Local.Mouse.Y)).Magnitude
                if Distance < shortestDistance then
                    shortestDistance = Distance -- // Leaked by Splitta & Consist /My Larp
                    closestPart = v -- // Leaked by Splitta & Consist /My Larp
                end
            end -- // Leaked by Splitta & Consist /My Larp
        end -- // Leaked by Splitta & Consist /My Larp
        return closestPart
    end
end

local function getClosestPointOnPart(Part) -- // Leaked by Splitta & Consist /My Larp -- // Leaked by Splitta & Consist /My Larp
    local mouseray = Local.Mouse.UnitRay
    mouseray = mouseray.Origin + (mouseray.Direction * (Part.Position - mouseray.Origin).Magnitude)
    local point =
        (mouseray.Y >= (Part.Position - Part.Size / 2).Y and mouseray.Y <= (Part.Position + Part.Size / 2).Y) and
            (Part.Position + Vector3.new(0, -Part.Position.Y + mouseray.Y, 0)) or Part.Position
    local check = RaycastParams.new() -- // Leaked by Splitta & Consist /My Larp
    check.FilterType = Enum.RaycastFilterType.Whitelist
    check.FilterDescendantsInstances = {Part} -- // Leaked by Splitta & Consist /My Larp
    local ray = Services.Workspace:Raycast(mouseray, (point - mouseray), check)
    if ray then 
        return ray.Position
    else
        return Local.Mouse.Hit.Position
    end
end

local function SelfAlive(Setting) -- // Leaked by Splitta & Consist /My Larp
    if game.PlaceId == 12442317726 then
        if Setting.SelfAlive then
            if Local.Player.Character:FindFirstChild("BodyEffects")["KO"].Value == false then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        if Setting.SelfAlive then

            if Local.Player.Character:FindFirstChild("BodyEffects")["K.O"].Value == false then
                return true
            else
                return false
            end
        else
            return true
        end
    end
end

local function TargetKO(a, Setting)
    if game.PlaceId == 10355218822 or game.PlaceId == 12154107359 then
        if Setting.KO then
            if a:FindFirstChild("DEAD") ~= nil or a.Health < 3 then
                return false
            else
                return true
            end
        else -- // Leaked by Splitta & Consist /My Larp
            return true -- // Leaked by Splitta & Consist /My Larp
        end
    elseif game.PlaceId == 12442317726 then
        if Setting.KO then -- // Leaked by Splitta & Consist /My Larp
            if a:FindFirstChild("BodyEffects")["KO"].Value == false then
                return true
            else
                return false -- // Leaked by Splitta & Consist /My Larp
            end
        else -- // Leaked by Splitta & Consist /My Larp
            return true
        end
    else
        if Setting.KO then
            if a:FindFirstChild("BodyEffects")["K.O"].Value == false then
                return true
            else
                return false
            end
        else
            return true
        end
    end
end

local function SilentHitChance()
    if math.random(0, 100) <= getgenv().Exodus.Checks.HitChance then
        return true
    else
        return false
    end
end

local function TargetForceField(a, Setting)
    if Setting.ForceField then
        if not (a:FindFirstChildOfClass("ForceField")) then
            return true
        else
            return false
        end
    else
        return true
    end
end

local function SelfReload(Setting)
    if Setting.SelfReload then
        if game.PlaceId ~= 9825515356 then
            if Local.Player.Character.BodyEffects.Reload.Value == false then
                return true
            else
                return false
            end
        else
            if Local.Player.Character.BodyEffects.Reloading.Value == false then
                return true
            else
                return false
            end
        end
    else
        return true
    end
end

local function Crew(b, Setting)
    if Setting.Crew then
        if Local.Player.DataFolder.Information:FindFirstChild('Crew').Value ~= "" and
            Services.Players[b].DataFolder.Information:FindFirstChild('Crew').Value ~= "" then
            if Local.Player.DataFolder.Information.Crew.Value ~= Services.Players[b].DataFolder.Information.Crew.Value then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return true -- // Leaked by Splitta & Consist /My Larp
    end
end

local function IsInFirstPerson(Setting)
    if Setting.FirstPerson and Setting.AllowThirdPersonShiftLock == false then
        if (Local.Camera.CFrame.p - Local.Camera.Focus.p).Magnitude < 0.7 then
            return true
        else
            return false
        end
    elseif Setting.FirstPerson and Setting.AllowThirdPersonShiftLock then
        if (Local.Camera.CFrame.p - Local.Camera.Focus.p).Magnitude < 0.7 or Services.UserInputService.MouseBehavior ==
            Enum.MouseBehavior.LockCenter then
            return true
        else
            return false
        end
    end
    return true
end
 -- // Leaked by Splitta & Consist /My Larp
local function IsInThirdPerson(Setting)
    if Setting.ThirdPerson then
        if (Local.Camera.CFrame.p - Local.Camera.Focus.p).Magnitude > 0.7 then
            return true
        else
            return false
        end
    end
    return true
end

local function aimbot(feign)
    if getgenv().Exodus.Aimbot.Smoothing then
        Local.Camera.CFrame = Local.Camera.CFrame:Lerp(Main, getgenv().Exodus.Aimbot.Smoothness,
            Enum.EasingStyle.Quad, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    end -- // Leaked by Splitta & Consist /My Larp
end
-- // Leaked by Splitta & Consist /My Larp
local function getClosestPlayerToCursor(Setting)
    local Target, Closest = nil, 1 / 0
    for _, v in pairs(Services.Players:GetPlayers()) do
        if (v.Character and v ~= Local.Player and v.Character:FindFirstChild("HumanoidRootPart")) and
            IsOnScreen(v.Character:FindFirstChild("HumanoidRootPart"), getgenv().Exodus.Direction) and
            Wall(v.Character, getgenv().Exodus.Direction) then
            local Position, OnScreen = Local.Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Local.Mouse.X, Local.Mouse.Y)).Magnitude
            if (Setting > Distance and Distance < Closest and OnScreen) then
                Closest = Distance
                Target = v
            end -- // Leaked by Splitta & Consist /My Larp
        end
    end -- // Leaked by Splitta & Consist /My Larp
    return Target
end
-- // Leaked by Splitta & Consist /My Larp
Services.UserInputService.InputBegan:Connect(function(input)
    if not (Services.UserInputService:GetFocusedTextBox()) then
        if input.KeyCode == Keybinds.Aimbot and AimlockTarget == nil then
            if getgenv().Exodus.Aimbot.Locking ~= true then
                getgenv().Exodus.Aimbot.Locking = true
            end
            local Target;
            if game.PlaceId == 10355218822 or game.PlaceId == 12154107359 then
                if Target ~= nil then
                    AimlockTarget = Services.Workspace.NPC.Dummy
                    AimlockTargetName = Services.Workspace.NPC.Dummy.Name
                end
            else -- // Leaked by Splitta & Consist /My Larp
                Target = getClosestPlayerToCursor(700)
                if Target ~= nil then
                    AimlockTarget = Target.Character
                    AimlockTargetName = Target.Name
                end -- // Leaked by Splitta & Consist /My Larp
            end

        elseif input.KeyCode == Keybinds.Aimbot and AimlockTarget ~= nil then
            if AimlockTarget ~= nil then
                AimlockTarget = nil
            end
            if getgenv().Exodus.Aimbot.Locking ~= false then
                getgenv().Exodus.Aimbot.Locking = false
            end
        end
    end
end)

if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...)
        return ...
    end
end -- // Leaked by Splitta & Consist /My Larp

local Velocity = nil;
local lastPosition = Vector3.new(0, 0, 0)
local lastTime = tick()
local SilentlastPosition = Vector3.new(0, 0, 0)
local SilentlastTime = tick()

Services.RunService.Heartbeat:Connect(LPH_JIT_MAX(function()
    if getgenv().Exodus.Aimbot.Enabled == true and getgenv().Exodus.Aimbot.Locking == true and AimlockTarget and
        AimlockTarget:FindFirstChild(getgenv().Exodus.Aimbot.Aimpart) then
        if getgenv().Exodus.FOV.Enabled then
            CamCircle.Radius = getgenv().Exodus.FOV.Radius
            CamCircle.Visible = getgenv().Exodus.FOV.Enabled
            CamCircle.Position = Vector2.new(Services.UserInputService:GetMouseLocation().X,
                Services.UserInputService:GetMouseLocation().Y)
        elseif getgenv().Exodus.FOV.Enabled == false then
            if CamCircle.Visible ~= false then
                CamCircle.Visible = getgenv().Exodus.FOV.Enabled
            end
        end
        if getgenv().Exodus.Aimbot.AimpartType == "Normal" then
            getgenv().Exodus.Aimbot.Aimpart = getgenv().Exodus.Aimbot.NormalAimpart
        end
        if getgenv().Exodus.Aimbot.AimpartType == "Nearest Part" then
            getgenv().Exodus.Aimbot.Aimpart = tostring(
                getClosestPartToCursor(AimlockTarget, getgenv().Exodus.Aimbot))
        end
        if getgenv().Exodus.FOV.FOVType == "Dynamic" then
            if Local.Player.Character:FindFirstChild("HumanoidRootPart") then
                feign = (Local.Camera.CFrame.Position - AimlockTarget.HumanoidRootPart.Position).magnitude
                getgenv().Exodus.FOV.Radius = (getgenv().Exodus.FOV.Amount / feign)
            end
        end
        if SelfAlive(getgenv().Exodus.Aimbot.Checks) and TargetKO(AimlockTarget, getgenv().Exodus.Aimbot.Checks) and
            IsOnScreen(AimlockTarget[getgenv().Exodus.Aimbot.Aimpart], getgenv().Exodus.Aimbot.Checks) and
            Wall(AimlockTarget, getgenv().Exodus.Aimbot.Checks) and
            IsInRadius(AimlockTarget, getgenv().Exodus.Aimbot.Checks) and
            TargetForceField(AimlockTarget, getgenv().Exodus.Aimbot.Checks) and
            Crew(AimlockTargetName, getgenv().Exodus.Aimbot.Checks) and SelfReload(getgenv().Exodus.Aimbot.Checks) and
            IsInFirstPerson(getgenv().Exodus.Aimbot.Checks) and IsInThirdPerson(getgenv().Exodus.Aimbot.Checks) and
            Grabbed(AimlockTarget, getgenv().Exodus.Aimbot.Checks) and
            AimlockTarget:FindFirstChild("HumanoidRootPart") then
            if getgenv().Exodus.Aimbot.AimpartType == "Nearest Part" or
                getgenv().Exodus.Aimbot.AimpartType == "Normal" then
                ac = AimlockTarget[getgenv().Exodus.Aimbot.Aimpart].Position
            elseif getgenv().Exodus.Aimbot.AimpartType == "Nearest Point" then
                getgenv().Exodus.Aimbot.Aimpart = tostring(
                    getClosestPartToCursor(AimlockTarget, getgenv().Exodus.Aimbot))
                ac = getClosestPointOnPart(AimlockTarget[getgenv().Exodus.Aimbot.Aimpart])
            end
            pcall(function()
                local currentPosition = AimlockTarget.HumanoidRootPart.Position
                local currentTime = tick()
                local deltaPos = currentPosition - lastPosition
                local deltaTime = currentTime - lastTime
                if getgenv().Exodus.Resolving.Enabled then
                    if getgenv().Exodus.Resolving.Type == "When Velocity is too high" then
                        if (AimlockTarget.HumanoidRootPart.Velocity).magnitude >
                            getgenv().Exodus.Resolving.Positive or
                            (AimlockTarget.HumanoidRootPart.Velocity).magnitude <
                            -getgenv().Exodus.Resolving.Negetive then
                            if deltaTime >= 0.03 then
                                Velocity = deltaPos / deltaTime
                                lastPosition = currentPosition
                                lastTime = currentTime
                            end
                            if getgenv().Exodus.ChecksYAxis == false then
                                Velocity = Vector3.new(Velocity.X, 0, Velocity.Z)
                            end
                        else
                            if getgenv().Exodus.ChecksYAxis == false then
                                Velocity = Vector3.new(AimlockTarget.HumanoidRootPart.Velocity.X, 0,
                                    AimlockTarget.HumanoidRootPart.Velocity.Z)
                            else
                                Velocity = AimlockTarget.HumanoidRootPart.Velocity
                            end
                        end
                    else
                        if deltaTime >= 0.03 then
                            Velocity = deltaPos / deltaTime
                            lastPosition = currentPosition
                            lastTime = currentTime
                        end
                        if getgenv().Exodus.ChecksYAxis == false then
                            Velocity = Vector3.new(Velocity.X, 0, Velocity.Z)
                        end
                    end
                else
                    if getgenv().Exodus.ChecksYAxis == false then
                        Velocity = Vector3.new(AimlockTarget.HumanoidRootPart.Velocity.X, 0,
                            AimlockTarget.HumanoidRootPart.Velocity.Z)
                    else
                        Velocity = AimlockTarget.HumanoidRootPart.Velocity
                    end
                end
                if getgenv().Exodus.Aimbot.Shake then
                    if getgenv().Exodus.Aimbot.Predict then
                        Main = CFrame.new(Local.Camera.CFrame.p, ac +
                            Vector3.new(
                                math.random(-getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.01,
                                math.random(-getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.1, math.random(
                                    -getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.1) +
                            (Vector3.new(Velocity.X, Velocity.Y, Velocity.Z)) *
                            getgenv().Exodus.Aimbot.PredictAmmount)
                    else
                        Main = CFrame.new(Local.Camera.CFrame.p, ac +
                            Vector3.new(
                                math.random(-getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.01,
                                math.random(-getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.1, math.random(
                                    -getgenv().Exodus.Aimbot.Value,
                                    getgenv().Exodus.Aimbot.Value) * 0.1))
                    end
                else
                    if getgenv().Exodus.Aimbot.Predict then
                        Main = CFrame.new(Local.Camera.CFrame.p,
                            ac + (Vector3.new(Velocity.X, Velocity.Y, Velocity.Z)) *
                                getgenv().Exodus.Aimbot.PredictAmmount)
                    else
                        Main = CFrame.new(Local.Camera.CFrame.p, ac)
                    end
                end
                if getgenv().Exodus.Aimbot.Smoothness then
                    aimbot(Main)
                else
                    if getgenv().Exodus.Aimbot.Predict then
                        Local.Camera.CFrame = CFrame.new(Local.Camera.CFrame.Position, ac +
                            (Vector3.new(Velocity.X, Velocity.Y, Velocity.Z)) *
                            getgenv().Exodus.Aimbot.PredictAmmount)
                    else
                        Local.Camera.CFrame = CFrame.new(Local.Camera.CFrame.Position, ac)
                    end
                end
            end)
        end
    else
        getgenv().Exodus.Aimbot.Locking = false
        AimlockTarget = nil
        CamCircle.Visible = false
    end
    if getgenv().Exodus.Direction.Enabled then
        SilentTarget = getClosestPlayerToCursor(700)
        if SilentTarget and SilentTarget.Character and SilentTarget.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                local SilentcurrentPosition = SilentTarget.Character.HumanoidRootPart.Position
                local SilentcurrentTime = tick()
                local SilentdeltaPos = SilentcurrentPosition - SilentlastPosition
                local SilentdeltaTime = SilentcurrentTime - SilentlastTime
                if getgenv().Exodus.Resolving.Enabled then
                    if getgenv().Exodus.Direction.Type == "When Velocity is too high" then
                        if (SilentTarget.Character.HumanoidRootPart.Velocity).magnitude >
                            getgenv().Exodus.Resolving.Positive or
                            (SilentTarget.Character.HumanoidRootPart.Velocity).magnitude <
                            -getgenv().Exodus.Resolving.Negetive then
                            if SilentdeltaTime >= 0.03 then
                                SilentVelocity = SilentdeltaPos / SilentdeltaTime
                                SilentlastPosition = SilentcurrentPosition
                                SilentlastTime = SilentcurrentTime
                            end
                            if getgenv().Exodus.Checks.YAxis == false then
                                SilentVelocity = Vector3.new(SilentVelocity.X, 0, SilentVelocity.Z)
                            end
                        else
                            if getgenv().Exodus.Checks.YAxis == false then
                                SilentVelocity = Vector3.new(SilentTarget.Character.HumanoidRootPart.Velocity.X, 0,
                                    SilentTarget.Character.HumanoidRootPart.Velocity.Z)
                            else
                                SilentVelocity = SilentTarget.Character.HumanoidRootPart.Velocity
                            end
                        end
                    else
                        if SilentdeltaTime >= 0.03 then
                            SilentVelocity = SilentdeltaPos / SilentdeltaTime
                            SilentlastPosition = SilentcurrentPosition
                            SilentlastTime = SilentcurrentTime
                        end
                        if getgenv().Exodus.Checks.YAxis == false then
                            SilentVelocity = Vector3.new(Velocity.X, 0, Velocity.Z)
                        end
                    end
                else
                    if getgenv().Exodus.Checks.YAxis == false then
                        SilentVelocity = Vector3.new(SilentTarget.Character.HumanoidRootPart.Velocity.X, 0,
                            SilentTarget.Character.HumanoidRootPart.Velocity.Z)
                    else
                        SilentVelocity = SilentTarget.Character.HumanoidRootPart.Velocity
                    end
                end
                if getgenv().Exodus.Direction.AimpartType == "Nearest Part" then
                    getgenv().Exodus.Direction.Aimpart =
                        tostring(getClosestPartToCursor(SilentTarget.Character, getgenv().Exodus.Direction))
                    Aimplace = (SilentTarget.Character[getgenv().Exodus.Direction.Aimpart].Position) +
                                   (SilentVelocity * getgenv().Exodus.Direction.Prediction)
                elseif getgenv().Exodus.Direction.AimpartType == "Normal" then
                    getgenv().Exodus.Direction.Aimpart = getgenv().Exodus.Direction.NormalAimpart
                    Aimplace = (SilentTarget.Character[getgenv().Exodus.Direction.Aimpart].Position) +
                                   (SilentVelocity * getgenv().Exodus.Direction.Prediction)
                elseif getgenv().Exodus.Direction.AimpartType == "Nearest Point" then
                    getgenv().Exodus.Direction.Aimpart =
                        tostring(getClosestPartToCursor(SilentTarget.Character, getgenv().Exodus.Direction))
                    Aimplace = (getClosestPointOnPart(
                        SilentTarget.Character[getgenv().Exodus.Direction.Aimpart]) +
                                   (SilentVelocity * getgenv().Exodus.Direction.Prediction))
                end
            end)
        end
        if getgenv().Exodus.FOV.Enabled then
            SilentCircle.Radius = getgenv().Exodus.FOV.Radius
            if getgenv().Exodus.FOV.FOVType2 == "Cursor" then
                SilentCircle.Visible = getgenv().Exodus.FOV.Enabled
                SilentCircle.Position = Vector2.new(Local.Mouse.X, Local.Mouse.Y + Services.GuiService:GetGuiInset().Y)
            else
                if SilentTarget then
                    local PlayerPosition = SilentTarget.Character.HumanoidRootPart.Position + SilentVelocity *
                                               getgenv().Exodus.Direction.Prediction
                    local OnScreenPosition = Local.Camera:WorldToViewportPoint(PlayerPosition)
                    SilentCircle.Position = (Vector2.new(OnScreenPosition.X, OnScreenPosition.Y))
                    SilentCircle.Visible = getgenv().Exodus.FOV.Enabled
                else
                    SilentCircle.Visible = false
                end
            end
        else
            SilentCircle.Visible = getgenv().Exodus.FOV.Enabled
        end
        if SilentTarget and SilentTarget.Character and SilentTarget.Character.HumanoidRootPart then
            if getgenv().Exodus.FOV.FOVType == "Dynamic" then
                if Local.Player.Character:FindFirstChild("HumanoidRootPart") then
                    idk = (Local.Camera.CFrame.Position - SilentTarget.Character.HumanoidRootPart.Position).magnitude
                    getgenv().Exodus.FOV.Radius = (getgenv().Exodus.FOV.Amount / idk)
                end
            end
        end
    else
        if SilentCircle.Visible ~= false then
            SilentCircle.Visible = false
        end
    end
end))

local function getgamesnamecall()
    if game.PlaceId == 2788229376 or game.PlaceId == 4106313503 or game.PlaceId == 12442317726 then
        return "UpdateMousePos"
    elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
        return "MousePos"
    elseif game.PlaceId == 9825515356 then
        return "GetMousePos"
    else
        return "UpdateMousePos"
    end
end
    if getgenv().CheckIfScriptLoaded == true then
        game.StarterGui:SetCore("SendNotification", {
        Title = "Exodus.cc | .gg/Exoduscc",
        Text = "New Sets Loaded! | ColloperWasHere ",
        Duration = 5,
        })
        return
   end

getgenv().CheckIfScriptLoaded = true


local function MainEventLocate()
    for _, v in pairs(Services.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" then
            return v
        end
    end
end

local function SilentActivator(Place)
    if getgenv().Exodus.Direction.Enabled then
        if SilentTarget and SilentTarget.Character and SilentVelocity then
            if TargetKO(SilentTarget.Character, getgenv().Exodus.Checks) and
                IsOnScreen(SilentTarget.Character[getgenv().Exodus.Direction.Aimpart],
                    getgenv().Exodus.Checks) and
                Wall(SilentTarget.Character, getgenv().Exodus.Checks) and
                IsInRadius(SilentTarget.Character, getgenv().Exodus.Checks) and
                TargetForceField(SilentTarget.Character, getgenv().Exodus.Checks) and
                Crew(SilentTarget.Name, getgenv().Exodus.Checks) and
                Grabbed(SilentTarget.Character, getgenv().Exodus.Checks) and
                SilentTarget.Character:FindFirstChild("HumanoidRootPart") then
                MainEventLocate():FireServer(getgamesnamecall(), Place)
            end
        end
    end
end

Local.Player.Character.ChildAdded:Connect(LPH_JIT_MAX(function(tool)
    if tool:IsA("Tool") and
        (tool:FindFirstChild("Script") or tool:FindFirstChild("GunScript") or tool:FindFirstChild("weaponInfo")) then
        tool.Activated:Connect(function()
            SilentActivator(Aimplace)
        end)
    end
end))

Local.Player.CharacterAdded:Connect(LPH_JIT_MAX(function(Character)
    Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") and
            (tool:FindFirstChild("Script") or tool:FindFirstChild("GunScript") or tool:FindFirstChild("weaponInfo")) then
            tool.Activated:Connect(function()
                SilentActivator(Aimplace)
            end)
        end
    end)
end))

Services.UserInputService.InputBegan:Connect(LPH_JIT_MAX(function(input)
    if not (Services.UserInputService:GetFocusedTextBox()) then
        if input.KeyCode == Keybinds.Direction then
            if getgenv().Exodus.Direction.Enabled then
                getgenv().Exodus.Direction.Enabled = false
            elseif getgenv().Exodus.Direction.Enabled == false then
                getgenv().Exodus.Direction.Enabled = true
            end
        end
    end
end))
if getgenv().Exodus.Options.Intro then
    local Tracer = Drawing.new("Image")
    local Blur = Instance.new("BlurEffect")
    local screenSize = Services.Workspace.CurrentCamera.ViewportSize
    local centerPosition = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
    Tracer.Position = centerPosition
    Tracer.Size = Vector2.new(0, 0)
    Tracer.Visible = true
    Tracer.Data = game:HttpGet("https://i.imgur.com/rkMgDJG.png")
    Blur.Size = 0
    Blur.Parent = Services.Workspace.CurrentCamera
    for i = 1, 100 do
        Tracer.Size = Tracer.Size + (Vector2.new(540, 540) - Tracer.Size) / 20
        Tracer.Position = centerPosition - Tracer.Size / 2
        if Blur.Size ~= 10 then
            Blur.Size = Blur.Size + 1
        end
        task.wait()
    end
    Tracer.Size = Vector2.new(540, 540)
    Tracer.Position = centerPosition - Tracer.Size / 2
    wait(0.75)
    for i = 1, 85 do
        if Tracer.Transparency ~= 0 then
            Tracer.Transparency = Tracer.Transparency - 0.01
        end
        if Blur.Size ~= 0 then
            Blur.Size = Blur.Size - 1
        end
        task.wait()
    end
    Tracer.Size = Vector2.new(0, 0)
    Blur:Destroy()
end

wait(0.5)


-- // Misc

-- // Macro

local SpeedGlitch = false
Mouse.KeyDown:Connect(function(Key)
    if Key == (getgenv().Exodus.Macro.Keybind) and getgenv().Exodus.Macro.Type == "Third" then
        SpeedGlitch = not SpeedGlitch
        if SpeedGlitch == true then
            repeat
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
            until SpeedGlitch == false
        end
    end
end)
Mouse.KeyDown:Connect(function(Key)
    if Key == (getgenv().Exodus.Macro.Keybind) and getgenv().Exodus.Macro.Type == "First" then
        SpeedGlitch = not SpeedGlitch
        if SpeedGlitch == true then
            repeat
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                task.wait(getgenv().Exodus.Macro.Speed / 100)
            until SpeedGlitch == false
        end
    end
end)

-- // 360 Keybind

-- // NoClip

if getgenv().Exodus.NoClip.Enabled == true then
    local Keybind = getgenv().Exodus.NoClip.Key
    while true do
        local function OnKeyPress(Input)
            if Input.KeyCode == Enum.KeyCode[Keybind:upper()] then
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == getgenv().Exodus.NoClip.GunName then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        task.wait(getgenv().Exodus.NoClip.Delay)
                        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                    end
                end
            end
        end
        task.wait(getgenv().Exodus.NoClip.Delay)
    end
end
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp
-- // Leaked by Splitta & Consist /My Larp