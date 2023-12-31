--[[ 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ DanHub Main Script                                                      │
  │ v1.0.0-New                                                              │
  │ Copyright(c) Rafael Soley R.                                            │
  └─────────────────────────────────────────────────────────────────────────┘
--]]-- // Imports \\ --
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanLib/main/merc.lua"))()

-- // Config \\ --
local darkDex = false
local textToSpam = "DanHub is the best hub"
local waitTime = 1
local Noclip = nil
local Clip = nil
local player = game.Players.LocalPlayer

-- // Services \\ --
local Players = game:GetService("Players")
local Run = game:GetService("RunService")

-- // ESP \\ --
local mainEsp = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
getgenv().ExunysDeveloperESP = {
	DeveloperSettings = {
		Path = "conf.cfg",
		UnwrapOnCharacterAbsence = false,
		UpdateMode = "RenderStepped",
		TeamCheckOption = "TeamColor",
		RainbowSpeed = 1, -- Bigger = Slower
		WidthBoundary = 1.5 -- Smaller Value = Bigger Width
	},

	Settings = {
		Enabled = true,
		PartsOnly = false,
		TeamCheck = false,
		AliveCheck = true,
		LoadConfigOnLaunch = true,
		EnableTeamColors = false,
		TeamColor = Color3.fromRGB(170, 170, 255)
	},

	Properties = {
		ESP = {
			Enabled = true,
			RainbowColor = false,
			RainbowOutlineColor = true,
			Offset = 10,

			Color = Color3.fromRGB(255, 255, 255),
			Transparency = 1,
			Size = 14,

			OutlineColor = Color3.fromRGB(0, 0, 0),
			Outline = true,

			DisplayDistance = true,
			DisplayHealth = false,
			DisplayName = false,
			DisplayDisplayName = true,
			DisplayTool = true
		},

		Tracer = {
			Enabled = false,
			RainbowColor = false,
			RainbowOutlineColor = false,
			Position = 1, -- 1 = Bottom; 2 = Center; 3 = Mouse

			Transparency = 1,
			Thickness = 1,
			Color = Color3.fromRGB(255, 255, 255),

			Outline = true,
			OutlineColor = Color3.fromRGB(0, 0, 0)
		},

		HeadDot = {
			Enabled = false,
			RainbowColor = false,
			RainbowOutlineColor = false,

			Color = Color3.fromRGB(255, 255, 255),
			Transparency = 1,
			Thickness = 1,
			NumSides = 30,
			Filled = false,

			OutlineColor = Color3.fromRGB(0, 0, 0),
			Outline = true
		},

		Box = {
			Enabled = true,
			RainbowColor = false,
			RainbowOutlineColor = false,

			Color = Color3.fromRGB(255, 255, 255),
			Transparency = 1,
			Thickness = 1,
			Filled = false,

			OutlineColor = Color3.fromRGB(0, 0, 0),
			Outline = true
		},

		HealthBar = {
			Enabled = true,
			RainbowOutlineColor = false,
			Offset = 4,
			Blue = 100,
			Position = 3, -- 1 = Top; 2 = Bottom; 3 = Left; 4 = Right

			Thickness = 1,
			Transparency = 1,

			OutlineColor = Color3.fromRGB(0, 0, 0),
			Outline = true
		},

		Chams = {
			Enabled = false, -- Keep disabled, broken, WIP...
			RainbowColor = false,

			Color = Color3.fromRGB(255, 255, 255),
			Transparency = 0.2,
			Thickness = 1,
			Filled = true
		},

		Crosshair = {
			Enabled = true,
			RainbowColor = false,
			RainbowOutlineColor = false,
			TStyled = false,
			Position = 1, -- 1 = Mouse; 2 = Center

			Size = 12,
			GapSize = 6,
			Rotation = 0,

			Rotate = false,
			RotateClockwise = true,
			RotationSpeed = 5,

			PulseGap = false,
			PulsingStep = 10,
			PulsingSpeed = 5,
			PulsingBounds = {4, 8}, -- {...}[1] => GapSize Min; {...}[2] => GapSize Max

			Color = Color3.fromRGB(0, 255, 0),
			Thickness = 1,
			Transparency = 1,

			OutlineColor = Color3.fromRGB(0, 0, 0),
			Outline = true,

			CenterDot = {
				Enabled = false,
				RainbowColor = false,
				RainbowOutlineColor = false,

				Radius = 2,

				Color = Color3.fromRGB(0, 255, 0),
				Transparency = 1,
				Thickness = 1,
				NumSides = 60,
				Filled = false,

				OutlineColor = Color3.fromRGB(0, 0, 0),
				Outline = true
			}
		}
	}

	-- The rest is core data for the functionality of the module...
}

-- // Events \\ --

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

-- // Main \\ --
local GUI = Lib:Create{
  Name = "DanHub",
  Size = UDim2.fromOffset(600, 400),
  Theme = Lib.Themes.Dark,
  Link = "https://github.com/rsley/DanHub"
}
-- GUI:Credit{
--  Name = "IDEalistic",
--  Description = "Developed the script and modified the library",
--  Discord = "idealistical"
-- }
GUI:Notification{
  Title = "Welcome",
  Text = "Welcome to DanHub, made by IDEalistic, your current game is " ..
    game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. ".",
  Duration = 3
}

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
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
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
Local:Slider{
  Name = "WalkSpeed",
  Description = "Changes your walkspeed",
  Default = 16,
  Min = 16,
  Max = 500,
  Callback = function(value)
    player.Character.Humanoid.WalkSpeed = value
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
ESP:Toggle{
  Name = "ESP",
  StartingState = false,
  Description = "Extrasensory perception",
  Callback = function(state)
    if state then
      GUI:Prompt{
        Followup = false,
        Title = "ESP",
        Text = "The current ESP is a little faulty and not fully finished, do you want to load it anyway?",
        Buttons = {
          yes = function()
            mainEsp:Load()
          end,
          no = function()
            GUI:Notification{
              Title = "Info",
              Text = "ESP has not been loaded.",
              Duration = 3
            }
          end
        }
      }
    else
      GUI:Prompt{
        Followup = false,
        Title = "ESP",
        Text = "Do you really want to unload the ESP? Once done, you can not load it back in without rejoining.",
        Buttons = {
          yes = function()
            mainEsp:Exit()
          end,
          no = function()
            GUI:Notification{
              Title = "Info",
              Text = "ESP has not been unloaded.",
              Duration = 3
            }
          end
        }
      }
    end
  end
}
