local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/rsley/DanLib/main/file.lua")()
local Window = Library.CreateLib("DanHub", "Sentinel")
local GlobalTab = Window:NewTab("Global")

local darkDex = false

local GlobalMain = GlobalTab:NewSection("Made by IDEalistic")
GlobalMain:NewButton("Destroy Gui", "Destroys the gui", function()
    for i,v in pairs(game.CoreGui:GetDescendants()) do
        if v.Name == "pages" then
            v.Parent:Destroy()
        end
    end
end)
GlobalMain:NewKeybind("Toggle Gui", "Toggles the gui", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)
GlobalMain:NewToggle("Dark Dex", "Makes Dex Explorer dark (before running it)", function(state)
    if state then
        darkDex = true
    else
        darkDex = false
    end
end)
GlobalMain:NewButton("Dex Explorer", "Opens Dex Explorer", function()
    if(darkDex) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/rsley/DanHub/main/dexdark.lua"))()
    else
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()   
    end
end)
GlobalMain:NewButton("RemoteSpy", "Spy for remote events", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)
