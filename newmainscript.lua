local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanLib/main/hydra.lua"))()

local Window = Lib.new("Global", game.Players.LocalPlayer.UserId, "Premium")

local Main = Window:Category("Main", "http://www.roblox.com/asset/?id=8395621517")

local Main1 = Main:Button("Combat", "http://www.roblox.com/asset/?id=8395747586")

local MainSection = Main1:Section("Section", "Left")

MainSection:Button({
    Title = "Kill All",
    ButtonName = "KILL!!",
    Description = "kills everyone",
    }, function(value)
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