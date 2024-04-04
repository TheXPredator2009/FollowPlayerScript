-- Follow Player TAB
local FollowTab = Window:NewTab("Follow Player")

local playerButtons = {}

-- Function to create a list of players in the Follow tab
local function createPlayerList(tab)
    local players = game.Players:GetPlayers()
    local FollowSection = tab:NewSection("Players")

    for , player in ipairs(players) do
        local button = FollowSection:NewButton(player.Name, "Follow " .. player.Name, function()
            if not playerButtons[player.Name] then
                playerButtons[player.Name] = true
                button:SetText("Stop Following " .. player.Name)
                -- Start following the player
                FollowPlayerScript(player.Name)
            else
                playerButtons[player.Name] = false
                button:SetText("Follow " .. player.Name)
                -- Logic to stop following the player (if needed)
            end
        end)
    end
end

createPlayerList(FollowTab)

game.Players.PlayerAdded:Connect(function(player)
    FollowTab:Clear()
    createPlayerList(FollowTab)
end)

game.Players.PlayerRemoving:Connect(function(player)
    FollowTab:Clear()
    createPlayerList(FollowTab)
end)
