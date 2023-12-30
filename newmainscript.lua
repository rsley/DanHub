--[[ 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ DanHub Main Script                                                      │
  │ v1.0.0-New                                                              │
  │ Copyright(c) Rafael Soley R.                                            │
  └─────────────────────────────────────────────────────────────────────────┘
--]]

-- // Imports \\ --
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanLib/main/merc.lua"))()

-- // Config \\ --
local darkDex = false
local textToSpam = "DanHub is the best hub"
local waitTime = 1
local Noclip = nil
local Clip = nil

-- // Functions \\ --
function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
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
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

-- // Main \\ --
local GUI = Lib:Create{
  Name = "DanHub",
  Size = UDim2.fromOffset(600, 400),
  Theme = Lib.Themes.Dark,
  Link = "https://github.com/rsley/DanHub",
}
--GUI:Credit{
--  Name = "IDEalistic",
--  Description = "Developed the script and modified the library",
--  Discord = "idealistical"
--}
GUI:Notification{
  Title = "Welcome",
  Text = "Welcome to DanHub, made by IDEalistic, your current game is " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. ".",
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
        for i,v in pairs(game.CoreGui:GetDescendants()) do
          if v.Name == getgenv().Hy_Name then
            v:Destroy()
          end
        end
      end
    }
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
  Name = "Infinite Yield",
  Description = "Admin commands, just without actual admin.",
  Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
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
  Name = "Vape V4",
  Description = "Vape V4 for Roblox, by 7GrandDadPGN",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4For Roblox/main/NewMainScript.lua", true))()
  end
}

-- // Local Tab \\ --
Local:Slider{
  Name = "WalkSpeed",
  Description = "Changes your walkspeed",
  Default = 16,
  Min = 16,
  Max = 500,
  Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
  end
}
Local:Slider{
  Name = "JumpPower",
  Description = "Changes your jumppower",
  Default = 50,
  Min = 50,
  Max = 500,
  Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
  end
}
Local:Slider{
  Name = "HipHeight",
  Description = "Changes your hipheight",
  Default = 0,
  Min = 0,
  Max = 500,
  Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = value
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
