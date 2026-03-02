--[[
    ✦✦✦ DUMMY FINDER HUMAIN ✦✦✦
    Version Naturelle - Aucune détection
    Jujutsu Shenanigans
]]

-- Attendre que tout soit prêt naturellement
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

-- Détection mobile (pour adaptation naturelle)
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

-- Variables
local espEnabled = false
local espFolder = Instance.new("Folder")
espFolder.Name = "DummyFinder_" .. tostring(math.random(1000, 9999)) -- Nom aléatoire
espFolder.Parent = CoreGui

-- Interface naturelle
local gui = Instance.new("ScreenGui")
gui.Name = "DummyFinder_" .. tostring(math.random(1000, 9999))
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Frame principal (design discret)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 60)
mainFrame.Position = UDim2.new(0.5, -100, 0.85, -30)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Coins arrondis
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 100, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Dummy Finder"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.Gotham
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- Bouton
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 25)
button.Position = UDim2.new(1, -60, 0.5, -12)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
button.Text = "OFF"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.Gotham
button.TextSize = 11
button.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 5)
btnCorner.Parent = button

-- Compteur discret
local counter = Instance.new("TextLabel")
counter.Size = UDim2.new(0, 30, 0, 20)
counter.Position = UDim2.new(1, -100, 0.5, -10)
counter.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
counter.Text = "0"
counter.TextColor3 = Color3.fromRGB(200, 200, 200)
counter.Font = Enum.Font.Gotham
counter.TextSize = 11
counter.Visible = false
counter.Parent = mainFrame

local counterCorner = Instance.new("UICorner")
counterCorner.CornerRadius = UDim.new(0, 5)
counterCorner.Parent = counter

-- Rendre le GUI naturel
mainFrame.BackgroundTransparency = 0.3
button.BackgroundTransparency = 0.2
counter.BackgroundTransparency = 0.2

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

-- Création d'ESP naturelle
local function createESP(dummy)
    if not dummy or not dummy:FindFirstChild("HumanoidRootPart") then return end
    
    -- Vérification naturelle
    if Players:GetPlayerFromCharacter(dummy) then return end
    
    local humanoid = dummy:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    
    -- Highlight discret
    local highlight = Instance.new("Highlight")
    highlight.Adornee = dummy
    highlight.FillColor = Color3.fromRGB(100, 200, 100)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.6
    highlight.OutlineTransparency = 0.5
    highlight.Parent = espFolder
    
    -- Nom aléatoire pour le highlight
    highlight.Name = "H_" .. tostring(math.random(1000, 9999))
    
    -- Petit texte simple
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = dummy.HumanoidRootPart
    billboard.Size = UDim2.new(0, 80, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = highlight
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 0.7
    text.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    text.Text = "❤️ " .. math.floor(humanoid.Health)
    text.TextColor3 = Color3.fromRGB(200, 255, 200)
    text.Font = Enum.Font.Gotham
    text.TextSize = 10
    text.Parent = billboard
    
    return highlight
end

-- Activation naturelle
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        -- Nettoyage discret
        for _, v in pairs(espFolder:GetChildren()) do
            v:Destroy()
        end
        
        -- Création ESP
        local dummies = findDummies()
        for _, dummy in pairs(dummies) do
            createESP(dummy)
        end
        
        -- Interface
        button.Text = "ON"
        button.BackgroundColor3 = Color3.fromRGB(70, 120, 70)
        counter.Visible = true
    else
        -- Nettoyage
        for _, v in pairs(espFolder:GetChildren()) do
            v:Destroy()
        end
        
        button.Text = "OFF"
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        counter.Visible = false
    end
end

-- Mise à jour naturelle (pas de boucle agressive)
local function updateESP()
    if not espEnabled then return end
    
    local dummies = findDummies()
    local currentESP = {}
    
    -- Créer un index des ESP actuels
    for _, esp in pairs(espFolder:GetChildren()) do
        if esp:IsA("Highlight") and esp.Adornee then
            currentESP[esp.Adornee] = esp
        end
    end
    
    -- Ajouter les nouveaux dummies
    for _, dummy in pairs(dummies) do
        if not currentESP[dummy] then
            createESP(dummy)
        end
    end
    
    -- Supprimer les ESP des dummies disparus
    for _, esp in pairs(espFolder:GetChildren()) do
        if esp:IsA("Highlight") and esp.Adornee then
            local dummy = esp.Adornee
            if not dummy.Parent or not dummy:FindFirstChildOfClass("Humanoid") or dummy:FindFirstChildOfClass("Humanoid").Health <= 0 then
                esp:Destroy()
            end
        end
    end
    
    -- Mise à jour du compteur
    local count = 0
    for _ in pairs(espFolder:GetChildren()) do
        count = count + 1
    end
    counter.Text = tostring(count)
end

-- Mise à jour périodique naturelle (pas trop rapide)
RunService.Heartbeat:Connect(function()
    if espEnabled then
        updateESP()
    end
end)

-- Interaction naturelle
button.MouseButton1Click:Connect(toggleESP)

-- Raccourci clavier discret (F)
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        toggleESP()
    end
end)

-- Message discret
print("Dummy Finder chargé - Appuie sur F")
