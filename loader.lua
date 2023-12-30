-- Do NOT run this
-- This was just a sample code I made to demonstrate a key system
-- and its utilization.
-- DanHub is KEYLESS.
-- getgenv().Hy_Key = "key1"
getgenv().Hy_Whitelisted = false

local url = "http://rsluxury.xyz/DanHub/whitelist.php?user_id=" .. game.Players.LocalPlayer.UserId
local response = game:HttpGet(url)
if response == true then
  getgenv().Hy_Whitelisted = true
  print("Authorized by user_id " .. game.Players.LocalPlayer.UserId)
else
  url = "http://rsluxury.xyz/DanHub/whitelist.php?key=" .. getgenv().Hy_Key
  local response1 = game:HttpGet(url)
  if response1 == false then
    getgenv().Hy_Whitelisted = false
    print("Not Authorized")
  else
    getgenv().Hy_Whitelisted = true
    print("Authorized by key \"" .. getgenv().Hy_Key .. "\"")
  end
end
