--[[ 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ DanHub Main Script                                                      │
  │ v1.0.0-New                                                              │
  │ Copyright(c) Rafael Soley R.                                            │
  └─────────────────────────────────────────────────────────────────────────┘
--]] -- // Imports \\ --
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanLib/main/merc.lua"))()

-- // Config \\ --
local darkDex = false
local textToSpam = "DanHub is the best hub"
local waitTime = 1
local Noclip = nil
local Clip = nil
local dev = nil
local player = game.Players.LocalPlayer
local walkspeed = player.Character.Humanoid.WalkSpeed
local jump = player.Character.Humanoid.JumpPower
local Aimbot = {
  Enabled = false,
  TeamCheck = true,
  AimPart = "Torso",
  Sensitivity = 0,
  CircleSides = 64,
  CircleColor = Color3.fromRGB(255, 255, 255),
  CircleTransparency = 0.7,
  CircleRadius = 120,
  CircleFilled = false,
  CircleVisible = false,
  CircleThickness = 0
}

getgenv().Hy_Silent = {
  Enabled = true,
  
  ClassName = "Universal Silent Aim - Averiias, Stefanuk12, xaxa",
  ToggleKey = "RightShift",
  
  TeamCheck = true,
  VisibleCheck = true, 
  TargetPart = "Torso",
  SilentAimMethod = "Raycast",
  
  FOVRadius = 130,
  FOVVisible = true,
  ShowSilentAimTarget = true, 
  
  MouseHitPrediction = false,
  MouseHitPredictionAmount = 0.165,
  HitChance = 100
}

local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall
local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

if getgenv().Hy_Dev then
  dev = true
else
  dev = false
end

-- // Services \\ --
local Players = game:GetService("Players")
local Run = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local UserInput = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")

-- // Instances \\ --
local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = Aimbot.CircleRadius
FOVCircle.Filled = Aimbot.CircleFilled
FOVCircle.Color = Aimbot.CircleColor
FOVCircle.Visible = Aimbot.CircleVisible
FOVCircle.Radius = Aimbot.CircleRadius
FOVCircle.Transparency = Aimbot.CircleTransparency
FOVCircle.NumSides = Aimbot.CircleSides
FOVCircle.Thickness = Aimbot.CircleThickness

-- // ESP \\ --
-- not working

-- // Anticheat Bypasses \\ --

-- // Events \\ --
UserInput.InputBegan:Connect(function(Input)
  if Input.UserInputType == Enum.UserInputType.MouseButton2 then
    Holding = true
  end
end)
UserInput.InputEnded:Connect(function(Input)
  if Input.UserInputType == Enum.UserInputType.MouseButton2 then
    Holding = false
  end
end)
Run.RenderStepped:Connect(function()
  FOVCircle.Position = Vector2.new(UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y)
  FOVCircle.Radius = Aimbot.CircleRadius
  FOVCircle.Filled = Aimbot.CircleFilled
  FOVCircle.Color = Aimbot.CircleColor
  FOVCircle.Visible = Aimbot.CircleVisible
  FOVCircle.Radius = Aimbot.CircleRadius
  FOVCircle.Transparency = Aimbot.CircleTransparency
  FOVCircle.NumSides = Aimbot.CircleSides
  FOVCircle.Thickness = Aimbot.CircleThickness

  if Holding == true and Aimbot.Enabled == true then
    Tween:Create(Camera, TweenInfo.new(Aimbot.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[Aimbot.AimPart].Position)}):Play()
  end
end)

-- // Functions \\ --
function noclip()
  Clip = false
  local function Nocl()
    if Clip == false and player.Character ~= nil then
      for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
          v.CanCollide = false
        end
      end
    end
    wait(0.21) -- basic optimization
  end
  Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
  if Noclip then
    Noclip:Disconnect()
  end
  Clip = true
end

function GetClosestPlayer()
  local MaximumDistance = Aimbot.CircleRadius
  local Target = nil

  for _, v in next, Players:GetPlayers() do
    if v.Name ~= player.Name then
      if Aimbot.TeamCheck == true then
        if v.Team ~= player.Team then
          if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and
            v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
            local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge)
                                                            .Position)
            local VectorDistance = (Vector2.new(UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y) -
                                     Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

            if VectorDistance < MaximumDistance then
              Target = v
            end
          end
        end
      end
    else
      if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and
        v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
        local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
        local VectorDistance = (Vector2.new(UserInput:GetMouseLocation().X, UserInput:GetMouseLocation().Y) -
                                 Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

        if VectorDistance < MaximumDistance then
          Target = v
        end
      end
    end
  end

  return Target
end

function notBehindWall(target)
  local ray = Ray.new(Camera.CFrame.Position, (target.Position - Camera.CFrame.Position).unit * 300)
  local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Camera})
  if part then
    local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
    if not humanoid then
      humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
    end
    if humanoid and target and humanoid.Parent == target.Parent then
      local pos, visible = camera:WorldToScreenPoint(target.Position)
      if visible then
        return true
      end
    end
  end
end

function playerClosestToMouse()
  local target = nil
  local maxDist = 100

  function getPlayerClosestToMouse()
    local target = nil
    local maxDist = 100
    for _,v in pairs(plrs:GetPlayers()) do
        if v.Character then
            if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= plr.TeamColor then
                local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                if dist < maxDist and vis then
                    local torsoPos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                    local torsoDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(torsoPos.X, torsoPos.Y)).magnitude
                    local headPos = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local headDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(headPos.X, headPos.Y)).magnitude
                    if torsoDist > headDist then
                        if notBehindWall(v.Character.Head) then
                            target = v.Character.Head
                        end
                    else
                        if notBehindWall(v.Character.HumanoidRootPart) then
                            target = v.Character.HumanoidRootPart
                        end
                    end
                    maxDist = dist
                end
            end
        end
    end
    return target
  end
end
-- // Main \\ --
local GUI = Lib:Create{
  Name = "DanHub",
  Size = UDim2.fromOffset(600, 400),
  Theme = Lib.Themes.Dark,
  Link = "https://github.com/rsley/DanHub"
}

if dev then
  GUI:Notification{
    Title = "Developer Mode",
    Text = "You are currently in developer mode, this means that you have access to some features that are not fully finished and may be buggy. You are playing on " .. gamename .. ".",
    Duration = 5
  }
else
  GUI:Notification{
    Title = "Welcome",
    Text = "Welcome to DanHub, made by IDEalistic, your current game is " ..
      game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. ".",
    Duration = 3
  }
end

-- // Tabs \\ --
local Main = GUI:Tab{
  Name = "Main",
  Icon = "rbxassetid://8569322835"
}
local Local = GUI:Tab{
  Name = "Local",
  Icon = "rbxassetid://8569322835"
}
local ESP = GUI:Tab{
  Name = "ESP",
  Icon = "rbxassetid://8569322835"
}
local Combat = GUI:Tab{
  Name = "Combat",
  Icon = "rbxassetid://8569322835"
}

-- // Main Tab \\ --
Main:Button{
  Name = "Destroy GUI",
  Description = "Destroy DanHub's GUI",
  Callback = function()
    GUI:Notification{
      Title = "Alert",
      Text = "DanHub will be destroyed in 3 seconds.",
      Duration = 3,
      Callback = function()
        for i, v in pairs(game.CoreGui:GetDescendants()) do
          if v.Name == getgenv().Hy_Name then
            v:Destroy()
          end
        end
      end
    }
  end
}
Main:Button{
  Name = "Build Tools",
  Description = "Gives you build tools by F3X",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanHub/main/utils/btools.lua"))()
  end
}
Main:Button{
  Name = "Dex Explorer",
  Description = "Opens Dex Explorer",
  Callback = function()
    GUI:Prompt{
      Followup = false,
      Title = "Dex Explorer",
      Text = "Do you want to use the regular or dark version?",
      Buttons = {
        dark = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanHub/main/utils/dexdark.lua"))()
        end,
        regular = function()
          loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
        end
      }
    }
  end
}
Main:Button{
  Name = "RemoteSpy",
  Description = "Spy for remote events",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
  end
}
Main:Button{
  Name = "Infinite Yield",
  Description = "Admin commands, just without actual admin.",
  Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  end
}
Main:Button{
  Name = "Owl Hub",
  Description = "Owl Hub, a hub for multiple games",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
  end
}
Main:Button{
  Name = "Vape V4",
  Description = "Vape V4 for Roblox, by 7GrandDadPGN",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
      true))()
  end
}

-- // Local Tab \\ --
Local:Button{
  Name = "Rejoin",
  Description = "Rejoins the game",
  Callback = function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
  end
}
Local:Button{
  Name = "Server Hop",
  Description = "Hops servers",
  Callback = function()
    local hopper = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanHub/main/utils/serverhop.lua"))()
    hopper:Teleport(game.PlaceId)
  end
}
Local:Button{
  Name = "Spawn Part",
  Description = "Spawns a part beneath your feet",
  Callback = function()
    local part = Instance.new("Part")
    part.Parent = game.Workspace
    part.CFrame = player.Character.HumanoidRootPart.CFrame
  end
}
Local:Toggle{
  Name = "Consistent Modifiers",
  StartingState = false,
  Description = "Makes your walkspeed and jumppower consistent",
  Callback = function(state)
    if state then
      Run.RenderStepped:Connect(function()
        player.Character.Humanoid.WalkSpeed = walkspeed
        player.Character.Humanoid.JumpPower = jump
      end)
    else
      Run.RenderStepped:Connect(function()
        player.Character.Humanoid.WalkSpeed = 16
        player.Character.Humanoid.JumpPower = 50
      end)
    end
  end
}
Local:Slider{
  Name = "WalkSpeed",
  Description = "Changes your walkspeed",
  Default = 16,
  Min = 16,
  Max = 500,
  Callback = function(value)
    player.Character.Humanoid.WalkSpeed = value
    walkspeed = value
  end
}
Local:Slider{
  Name = "JumpPower",
  Description = "Changes your jumppower",
  Default = 50,
  Min = 50,
  Max = 500,
  Callback = function(value)
    player.Character.Humanoid.JumpPower = value
    jump = value
  end
}
Local:Slider{
  Name = "HipHeight",
  Description = "Changes your hipheight",
  Default = 0,
  Min = 0,
  Max = 500,
  Callback = function(value)
    player.Character.Humanoid.HipHeight = value
  end
}
Local:Slider{
  Name = "FOV",
  Description = "Changes your FOV",
  Default = 70,
  Min = 70,
  Max = 120,
  Callback = function(value)
    game.Workspace.CurrentCamera.FieldOfView = value
  end
}
Local:Toggle{
  Name = "Noclip",
  StartingState = false,
  Description = "Allows you to noclip through walls",
  Callback = function(state)
    if state then
      noclip()
    else
      clip()
    end
  end
}

-- // ESP Tab \\ --
-- faulty 

-- // Combat Tab \\ --
Combat:Button{
  Name = "Averiias",
  Description = "Universal silent aim",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanHub/main/dev/beta.silentaim.lua"))()
  end
}
Combat:Toggle{
  Name = "Aimbot",
  StartingState = false,
  Description = "Aims at the closest player",
  Callback = function(state)
    Aimbot.Enabled = state
  end
}
Combat:Toggle{
  Name = "Silent Aim",
  StartingState = false,
  Description = "Aims at the closest player without moving your camera",
  Callback = function(state)
    if state then
      gmt.__namecall = newcclosure(function(self, ...)
        local Args = {...}
        local method = getnamecallmethod()
        if tostring(self) == "HitPart" and tostring(method) == "FireServer" then
            Args[1] = getPlayerClosestToMouse()
            Args[2] = getPlayerClosestToMouse().Position
            return self.FireServer(self, unpack(Args))
        end
        return oldNamecall(self, ...)
      end)
    else
      gmt.__namecall = oldNamecall
    end
  end
}
Combat:ColorPicker{
  Style = Lib.ColorPickerStyles.Legacy,
  Callback = function(color)
    Aimbot.CircleColor = color
  end
}
Combat:Toggle{
  Name = "Team Check",
  StartingState = true,
  Description = "Checks if the player is on your team",
  Callback = function(state)
    Aimbot.TeamCheck = state
  end
}
Combat:Dropdown{
  Name = "Aim Part",
  StartingText = "Torso",
  Description = "The part to aim at",
  Items = {
    "Head",
    "Torso",
    "HumanoidRootPart"
  },
}
Combat:Slider{
  Name = "Sensitivity",
  Description = "Changes the sensitivity of the aimbot",
  Default = 0,
  Min = 0,
  Max = 1,
  Callback = function(value)
    Aimbot.Sensitivity = value
  end
}
Combat:Slider{
  Name = "Circle Radius",
  Description = "Changes the radius of the circle",
  Default = 120,
  Min = 80,
  Max = 500,
  Callback = function(value)
    Aimbot.CircleRadius = value
  end
}
Combat:Toggle{
  Name = "Circle Filled",
  StartingState = false,
  Description = "Fills the circle",
  Callback = function(state)
    Aimbot.CircleFilled = state
  end
}
Combat:Toggle{
  Name = "Circle Visible",
  StartingState = false,
  Description = "Makes the circle visible",
  Callback = function(state)
    Aimbot.CircleVisible = state
  end
}
Combat:Slider{
  Name = "Circle Transparency",
  Description = "Changes the transparency of the circle",
  Default = 0.7,
  Min = 0,
  Max = 1,
  Callback = function(value)
    Aimbot.CircleTransparency = value
  end
}
Combat:Slider{
  Name = "Circle Thickness",
  Description = "Changes the thickness of the circle",
  Default = 0,
  Min = 0,
  Max = 10,
  Callback = function(value)
    Aimbot.CircleThickness = value
  end
}