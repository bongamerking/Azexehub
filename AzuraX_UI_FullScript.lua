-- AzuraX Hub Lite (Delta X Compatible) - Simple UI No Tabs

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Giao diện chính
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AzuraX_Hub_Lite"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 320)
frame.Position = UDim2.new(0.5, -120, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "AzuraX Hub Lite"
title.Font = Enum.Font.Fantasy
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1

-- Tạo nút
local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.85, 0, 0, 36)
    btn.Position = UDim2.new(0.075, 0, 0, posY)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    if callback then btn.MouseButton1Click:Connect(callback) end
end

-- 🔥 Auto Farm Dummy
local farming = false
createButton("Auto Farm Dummy", 50, function()
    farming = not farming
    while farming do
        local nearest = nil
        local dist = math.huge
        for _, npc in pairs(workspace:GetDescendants()) do
            if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc.Name:lower():find("dummy") then
                local d = (character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = npc
                end
            end
        end
        if nearest then
            character.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
            local tool = character:FindFirstChildOfClass("Tool")
            if tool then tool:Activate() end
        end
        wait(1)
    end
end)

-- 🌀 Dịch đến Dummy gần nhất
createButton("Teleport to Dummy", 95, function()
    for _, npc in pairs(workspace:GetDescendants()) do
        if npc:IsA("Model") and npc:FindFirstChild("Humanoid") and npc.Name:lower():find("dummy") then
            character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
            break
        end
    end
end)

-- 🌊 Tìm đảo Leviathan
createButton("Find Leviathan Island", 140, function()
    for _, island in pairs(workspace:GetDescendants()) do
        if island:IsA("Model") and island.Name:lower():find("leviathan") then
            character.HumanoidRootPart.CFrame = island:GetModelCFrame()
            break
        end
    end
end)

-- 🐉 Dịch đến bàn thờ Race V4
createButton("Teleport to Race Altar", 185, function()
    for _, altar in pairs(workspace:GetDescendants()) do
        if altar:IsA("Model") and altar.Name:lower():find("altar") then
            character.HumanoidRootPart.CFrame = altar:GetModelCFrame()
            break
        end
    end
end)
