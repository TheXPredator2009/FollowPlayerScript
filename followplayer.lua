-- Core functionality for following a player
local function findTargetPlayer()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name == targetPlayerName then
            return player
        end
    end
    return nil
end

local function moveCloserToPlayer()
    while followScriptRunning do
        local targetPlayer = findTargetPlayer()
        if targetPlayer then
            local follower = game.Players.LocalPlayer.Character
            if follower then
                local humanoid = follower:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local targetPosition = targetPlayer.Character and targetPlayer.Character.PrimaryPart and targetPlayer.Character.PrimaryPart.Position
                    if targetPosition then
                        local direction = (targetPosition - humanoid.RootPart.Position).unit
                        local closerPosition = targetPosition - direction * 5

                        humanoid.RootPart.CFrame = CFrame.new(closerPosition)
                        wait(0.1)
                    end
                end
            end
        end
        wait()
    end
end
