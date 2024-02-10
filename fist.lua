local function rejoin()
    queueonteleport('loadstring(game:HttpGet("https://fourdevils.dev/fist.lua"))()')
    local TP = game:GetService("TeleportService")
    TP:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end


local Dir = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
    Dir.DescendantAdded:Connect(function(Err)
        if Err.Name == "ErrorTitle" then
            Err:GetPropertyChangedSignal("Text"):Connect(function()
                if Err.Text:sub(0, 12) == "Disconnected" then
                        rejoin()
                end
            end)
        end
    end)


game:GetService("RunService"):Set3dRenderingEnabled(false)
while task.wait() do
    if not game.Players.LocalPlayer.PrivateStats.CanTrainFS.Value then
        local args = {
            [1] = {
                [1] = "Respawn"
            }
        }
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    else
        local args = {
            [1] = {
                [1] = "+FS17"
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end
