repeat task.wait() until game:IsLoaded()
if getgenv().AbyssHubLoaded then return end
getgenv().AbyssHubLoaded = true

local StarterGui = game:GetService("StarterGui")

local Games = {
    [9280810829] = "c2f1471564a22761fe4a7718d490839b90dc6fa2f2eaced737ee0143ff9f3ae6",
}

local BaseURL = "https://api.jnkie.com/api/v1/luascripts/public/%s/download"
local ScriptHash = Games[game.GameId]

if ScriptHash then
    StarterGui:SetCore("SendNotification", {
        Title = "Abyss Hub",
        Text = "Script loading...",
        Icon = "rbxassetid://78408734580845",
        Duration = 5,
    })

    local ScriptURL = string.format(BaseURL, ScriptHash)
    loadstring(game:HttpGet(ScriptURL))()
else
    getgenv().AbyssHubLoaded = nil

    StarterGui:SetCore("SendNotification", {
        Title = "Abyss Hub",
        Text = "Game not supported",
        Icon = "rbxassetid://125920361880643"
        Duration = 5,
    })

    warn("Game not supported:", game.GameId)
end
