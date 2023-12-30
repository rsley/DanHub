local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/rsley/DanLib/main/file.lua")()
local Window = Library.CreateLib("DanHub", "Ocean")

local GlobalTab = Window:NewTab("Global")
local LocalTab = Window:NewTab("Local")

local darkDex = false
local textToSpam = "DanHub is the best hub"
local waitTime = 1

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
GlobalMain:NewButton("Infinite Yield", "Admin commands, just without actual admin.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
GlobalMain:NewButton("RemoteSpy", "Spy for remote events", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)
GlobalMain:NewButton("Unnamed ESP", "ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end)
GlobalMain:NewButton("Vape V4", "Vape V4 for Roblox, by 7GrandDadPGN", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

local GlobalCredits = GlobalTab:NewSection("Credits")
GlobalCredits:NewButton("IDEalistic", "Creator of this gui, click for the discord", function()
    setclipboard("idealistical")
end)

local LocalMain = LocalTab:NewSection("Local Modifications")

LocalMain:NewSclider("Walkspeed", "Changes your walking speed", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
LocalMain:NewSlider("Jump Power", "Changes your jump power", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
LocalMain:NewSlider("Hip Height", "Changes your hip height", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = s
end)
LocalMain:NewSlider("FOV", "Changes your FOV", 120, 70, function(s) -- 120 (MaxValue) | 70 (MinValue)
    game.Workspace.CurrentCamera.FieldOfView = s
end)
LocalMain:NewToggle("Noclip", "Allows you to noclip through walls", function(state)
    if state then
        game:GetService('RunService').Stepped:connect(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    else
        game:GetService('RunService').Stepped:connect(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    end
end)

local LocalChat = LocalTab:NewSection("Chat Utils")

LocalChat:NewTextBox("Chat Message", "Chat message to spam", function(txt)
    textToSpam = txt
end)
LocalChat:NewSlider("Delay", "Delay between messages", 10, 1, function(s) -- 10 (MaxValue) | 1 (MinValue)
    waitTime = s
end
LocalChat:NewToggle("Chat Spammer", "Spams the chat", function(state)
    if state then
        while wait(waitTime) do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(textToSpam, "All")
        end
    end
end)