--[[ 
  ┌─────────────────────────────────────────────────────────────────────────┐
  │ DanHub Main Script                                                      │
  │ v1.0.0-New                                                              │
  │ Copyright(c) Rafael Soley R.                                            │
  └─────────────────────────────────────────────────────────────────────────┘
--]]

-- // Imports \\ --
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanLib/main/hydra.lua"))()

-- // Config \\ --
local darkDex = false
local textToSpam = "DanHub is the best hub"
local waitTime = 1

-- // Main \\ --
local Window = Lib.new("Global", game.Players.LocalPlayer.UserId, "Premium")

-- // Tabs \\ --
local Main = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")

-- // Categories \\ --
local Main1 = Main:Button("General Scripts", "http://www.roblox.com/asset/?id=8395747586")

-- // Sections \\ --
local MainSection = Main1:Section("Section", "Left")

MainSection:Button({
    Title = "Destroy GUI",
    ButtonName = "Destroy's DanHub GUI",
    Description = "kills danhub",
    },
    function(value)
        print(value)
    end)
MainSection:Toggle({
    Title = "Auto Farm Coins",
    Description = "Optional Description here",
    Default = false
    }, function(value)
    print(value)
end)
MainSection:Slider({
    Title = "Walkspeed",
    Description = "",
    Default = 16,
    Min = 0,
    Max = 120
    }, function(value)
    print(value)
end)
MainSection:ColorPicker({
    Title = "Colorpicker",
    Description = "",
    Default = Color3.new(255,0,0),
    }, function(value)
    print(value)
end)
MainSection:Textbox({
    Title = "Damage Multiplier",
    Description = "",
    Default = "",
    }, function(value)
    print(value)
end)
MainSection:Keybind({
    Title = "Kill All",
    Description = "",
    Default = Enum.KeyCode.Q,
    }, function(value)
    print(value)
end)