    for _, part in ipairs(game:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 0.5
        end
    end
end

local function showNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Script",
        Text = message,
        Icon = "",
        Duration = 3
    })
end

showNotification("You can now view through walls.")
wait(5)
local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Highlight = Instance.new("SelectionBox")
Highlight.Color3 = Color3.fromRGB(128, 0, 128)
Highlight.LineThickness = 3
Highlight.SurfaceColor3 = Color3.fromRGB(0, 0, 0)
Highlight.SurfaceTransparency = 0.8
Highlight.Parent = game.Workspace

local function applyHighlight(player)
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart and not humanoidRootPart:FindFirstChild("Highlight") then
            local highlightClone = Highlight:Clone()
            highlightClone.Adornee = humanoidRootPart
            highlightClone.Parent = humanoidRootPart
            highlightClone.DepthMode = Enum.DepthMode.Always
            highlightClone.Name = "Highlight"
        end
    end
end

local function removeHighlight(player)
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local highlight = humanoidRootPart:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        applyHighlight(player)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    removeHighlight(player)
end)

for _, player in ipairs(Players:GetPlayers()) do
    applyHighlight(player)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        applyHighlight(player)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    removeHighlight(player)
end)

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        applyHighlight(player)
    end
end)

showNotification("An added bonus: have a cool asf esp.")
end
