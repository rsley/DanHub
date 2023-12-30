local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/rsley/DanLib/main/file.lua")()
local Window = Library.CreateLib("DanHub", "Sentinel")
local Tab = Window:NewTab("Global")

local Section = Tab:NewSection("Main")
Section:NewLabel("Made by Dan")
Section:NewButton("Destroy Gui", "Destroys the gui", function()
    game:GetService("CoreGui").DanHub:Destroy()
end)
