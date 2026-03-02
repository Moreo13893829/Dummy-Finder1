--[[
    ✦✦✦ DUMMY FINDER ÉLÉGANT ✦✦✦
    Design Premium - Comportement Naturel
    Jujutsu Shenanigans
]]

-- Attendre que tout soit prêt naturellement
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

-- Détection mobile
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

-- Variables
local espEnabled = false
local espFolder = Instance.new("Folder")
espFolder.Name = "DummyFinder_" .. tostring(math.random(1000, 9999))
espFolder.Parent = CoreGui

-- Interface élégante
local gui = Instance.new("ScreenGui")
gui.Name = "DummyFinder_" .. tostring(math.random(1000, 9999))
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Frame principal (design moderne)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 80)
mainFrame.Position = UDim2.new(0.5, -120, 0.85, -40)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Coins arrondis élégants
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Bordure subtile
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(60, 60, 75)
stroke.Thickness = 1.2
stroke.Transparency = 0.3
stroke.Parent = mainFrame

-- Ombre portée
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(-0.04, -10, -0.04, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- Icône décorative (petit cercle)
local decorCircle = Instance.new("Frame")
decorCircle.Size = UDim2.new(0, 40, 0, 40)
decorCircle.Position = UDim2.new(0, -10, 0, -10)
decorCircle.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
decorCircle.BackgroundTransparency = 0.9
decorCircle.BorderSizePixel = 0
decorCircle.Parent = mainFrame

local decorCorner = Instance.new("UICorner")
decorCorner.CornerRadius = UDim.new(1, 0)
decorCorner.Parent = decorCircle

-- Titre avec icône
local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 24, 0, 24)
icon.Position = UDim2.new(0, 12, 0.5, -12)
icon.BackgroundTransparency = 1
icon.Text = "🎯"
icon.TextColor3 = Color3.fromRGB(255, 215, 100)
icon.Font = Enum.Font.GothamBold
icon.TextSize = 18
icon.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 120, 0, 24)
title.Position = UDim2.new(0, 40, 0.2, 0)
title.BackgroundTransparency = 1
title.Text = "Dummy Finder"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 120, 0, 16)
subtitle.Position = UDim2.new(0, 40, 0.6, -2)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Jujutsu Shenanigans"
subtitle.TextColor3 = Color3.fromRGB(160, 160, 180)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = mainFrame

-- Bouton moderne
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 60, 0, 30)
button.Position = UDim2.new(1, -70, 0.5, -15)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
button.Text = "OFF"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 12
button.AutoButtonColor = false
button.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = button

-- Effet de brillance sur le bouton
local btnShine = Instance.new("Frame")
btnShine.Size = UDim2.new(1, 0, 0.3, 0)
btnShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnShine.BackgroundTransparency = 0.8
btnShine.BorderSizePixel = 0
btnShine.Parent = button

local shineCorner = Instance.new("UICorner")
shineCorner.CornerRadius = UDim.new(0, 8)
shineCorner.Parent = btnShine

-- Compteur élégant
local counterBg = Instance.new("Frame")
counterBg.Size = UDim2.new(0, 40, 0, 24)
counterBg.Position = UDim2.new(1, -120, 0.5, -12)
counterBg.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
counterBg.BackgroundTransparency = 0.2
counterBg.BorderSizePixel = 0
counterBg.Parent = mainFrame

local counterCorner = Instance.new("UICorner")
counterCorner.CornerRadius = UDim.new(0, 6)
counterCorner.Parent = counterBg

local counter = Instance.new("TextLabel")
counter.Size = UDim2.new(1, 0, 1, 0)
counter.BackgroundTransparency = 1
counter.Text = "0"
counter.TextColor3 = Color3.fromRGB(200, 200, 220)
counter.Font = Enum.Font.GothamBold
counter.TextSize = 14
counter.Visible = false
counter.Parent = counterBg

-- Animation naturelle d'apparition
mainFrame.Size = UDim2.new(0, 250, 0, 90)
mainFrame.BackgroundTransparency = 0.2
TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 240, 0, 80),
    BackgroundTransparency = 0.1
}):Play()

-- Fonction naturelle pour trouver les dummies
local function findDummies()
    local dummies = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            local name = obj.Name:lower()
            if name:find("dummy") or name:find("entra") or name:find("train") then
                table.insert(dummies, obj)
            end
        end
    end
    return dummies
end

-- Création d'ESP élégante
local function createESP(dummy)
    if not dummy or not dummy:FindFirstChild("HumanoidRootPart") then return end
    if Players:GetPlayerFromCharacter(dummy) then return end

    local humanoid = dummy:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end

    -- Highlight élégant (plus visible mais discret)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = dummy
    highlight.FillColor = Color3.fromRGB(255, 215, 100)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.3
    highlight.Parent = espFolder
    highlight.Name = "H_" .. tostring(math.random(1000, 9999))

    -- Petit texte élégant
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = dummy.HumanoidRootPart
    billboard.Size = UDim2.new(0, 100, 0, 26)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = highlight

    -- Fond semi-transparent
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    bg.BackgroundTransparency = 0.2
    bg.BorderSizePixel = 0
    bg.Parent = billboard

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 6)
    bgCorner.Parent = bg

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "❤️ " .. math.floor(humanoid.Health)
    text.TextColor3 = Color3.fromRGB(255, 255, 220)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 12
    text.Parent = bg

    return highlight
end

-- Activation naturelle
local function toggleESP()
    espEnabled = not espEnabled

    if espEnabled then
        for _, v in pairs(espFolder:GetChildren()) do v:Destroy() end

        local dummies = findDummies()
        for _, dummy in pairs(dummies) do
            createESP(dummy)
        end

        -- Animation du bouton
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        }):Play()
        button.Text = "ON"
        counter.Visible = true
        counterBg.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    else
        for _, v in pairs(espFolder:GetChildren()) do v:Destroy() end

        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(60, 60, 75)
        }):Play()
        button.Text = "OFF"
        counter.Visible = false
        counterBg.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    end
end

-- Mise à jour naturelle
local function updateESP()
    if not espEnabled then return end

    local dummies = findDummies()
    local currentESP = {}

    for _, esp in pairs(espFolder:GetChildren()) do
        if esp:IsA("Highlight") and esp.Adornee then
            currentESP[esp.Adornee] = esp
        end
    end

    for _, dummy in pairs(dummies) do
        if not currentESP[dummy] then
            createESP(dummy)
        end
    end

    for _, esp in pairs(espFolder:GetChildren()) do
        if esp:IsA("Highlight") and esp.Adornee then
            local dummy = esp.Adornee
            if not dummy.Parent or not dummy:FindFirstChildOfClass("Humanoid") or dummy:FindFirstChildOfClass("Humanoid").Health <= 0 then
                esp:Destroy()
            end
        end
    end

    local count = 0
    for _ in pairs(espFolder:GetChildren()) do
        count = count + 1
    end
    counter.Text = tostring(count)
end

-- Mise à jour périodique
RunService.Heartbeat:Connect(function()
    if espEnabled then
        updateESP()
    end
end)

-- Interaction
button.MouseButton1Click:Connect(toggleESP)

-- Raccourci F
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        toggleESP()
    end
end)

-- Effet de survol naturel
button.MouseEnter:Connect(function()
    if not espEnabled then
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(70, 70, 85)
        }):Play()
    end
end)

button.MouseLeave:Connect(function()
    if not espEnabled then
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(60, 60, 75)
        }):Play()
    end
end)

print("✨ Dummy Finder Élégant chargé - Appuie sur F")
