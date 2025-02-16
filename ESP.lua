local function createESP(player)
    if player == game.Players.LocalPlayer then return end  -- Don't highlight yourself
    
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Highlight Effect
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillColor = Color3.new(1, 0, 0) -- Pure Red
    highlight.OutlineColor = Color3.new(1, 1, 1) -- White outline
    highlight.FillTransparency = 0.2
    highlight.OutlineTransparency = 0
    
    -- Create BillboardGui for Nametag
    local head = character:FindFirstChild("Head")
    if head then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "Nametag"
        billboard.Parent = head
        billboard.Size = UDim2.new(5, 0, 1, 0) -- Size of the nametag
        billboard.StudsOffset = Vector3.new(0, 2.5, 0) -- Offset above head
        billboard.AlwaysOnTop = true
        
        -- Create TextLabel
        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = player.Name
        textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red text
        textLabel.TextStrokeTransparency = 0
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- Black outline
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextScaled = true
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function()
        createESP(player)
    end)
end

-- Apply ESP to all current players
for _, player in pairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Apply ESP to future players
game.Players.PlayerAdded:Connect(onPlayerAdded
