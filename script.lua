--[[
    ✦✦✦ DUMMY FINDER DIAMOND 2026 ✦✦✦
    Le script PARFAIT - Tout-en-un
    Jujutsu Shenanigans
]]

-- Attendre le chargement
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Détection mobile
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

-- Variables
local espEnabled = false
local minimized = false
local espFolder = Instance.new("Folder")
espFolder.Name = "DiamondESP_" .. tostring(math.random(1000, 9999))
espFolder.Parent = CoreGui

--------------------------------------------------------------------
-- 1. SÉLECTEUR DE LANGUE MAGNIFIQUE
--------------------------------------------------------------------

local langGui = Instance.new("ScreenGui")
langGui.Name = "LangSelector"
langGui.ResetOnSpawn = false
langGui.Parent = CoreGui

local langBg = Instance.new("Frame")
langBg.Size = UDim2.new(1, 0, 1, 0)
langBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
langBg.BackgroundTransparency = 0.2
langBg.BorderSizePixel = 0
langBg.Parent = langGui

-- Container
local langContainer = Instance.new("Frame")
langContainer.Size = UDim2.new(0, 500, 0, 350)
langContainer.Position = UDim2.new(0.5, -250, 0.5, -175)
langContainer.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
langContainer.BackgroundTransparency = 0.1
langContainer.BorderSizePixel = 0
langContainer.Parent = langBg

local langCorner = Instance.new("UICorner")
langCorner.CornerRadius = UDim.new(0, 30)
langCorner.Parent = langContainer

-- Bordure diamant
local langBorder = Instance.new("Frame")
langBorder.Size = UDim2.new(1, 10, 1, 10)
langBorder.Position = UDim2.new(-0.02, -5, -0.02, -5)
langBorder.BackgroundTransparency = 1
langBorder.Parent = langContainer

local langBorderGradient = Instance.new("UIGradient")
langBorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
langBorderGradient.Rotation = 0
langBorderGradient.Parent = langBorder

-- Animation bordure
task.spawn(function()
    while langContainer do
        langBorderGradient.Rotation = (langBorderGradient.Rotation + 1) % 360
        task.wait(0.02)
    end
end)

-- Titre
local langTitle = Instance.new("TextLabel")
langTitle.Size = UDim2.new(1, 0, 0, 60)
langTitle.Position = UDim2.new(0, 0, 0, 80)
langTitle.BackgroundTransparency = 1
langTitle.Text = "CHOISIS TA LANGUE"
langTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
langTitle.Font = Enum.Font.GothamBold
langTitle.TextSize = 32
langTitle.Parent = langContainer

local langSub = Instance.new("TextLabel")
langSub.Size = UDim2.new(1, 0, 0, 30)
langSub.Position = UDim2.new(0, 0, 0, 140)
langSub.BackgroundTransparency = 1
langSub.Text = "CHOOSE YOUR LANGUAGE"
langSub.TextColor3 = Color3.fromRGB(180, 180, 220)
langSub.Font = Enum.Font.Gotham
langSub.TextSize = 16
langSub.Parent = langContainer

-- BOUTON FRANÇAIS
local frBtn = Instance.new("TextButton")
frBtn.Size = UDim2.new(0, 200, 0, 70)
frBtn.Position = UDim2.new(0.5, -220, 0.5, -25)
frBtn.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
frBtn.BorderSizePixel = 0
frBtn.Text = ""
frBtn.Parent = langContainer

local frCorner = Instance.new("UICorner")
frCorner.CornerRadius = UDim.new(0, 15)
frCorner.Parent = frBtn

local frFlag = Instance.new("TextLabel")
frFlag.Size = UDim2.new(0, 50, 1, 0)
frFlag.Position = UDim2.new(0, 15, 0, 0)
frFlag.BackgroundTransparency = 1
frFlag.Text = "🇫🇷"
frFlag.TextColor3 = Color3.fromRGB(255, 255, 255)
frFlag.Font = Enum.Font.GothamBold
frFlag.TextSize = 30
frFlag.Parent = frBtn

local frText = Instance.new("TextLabel")
frText.Size = UDim2.new(0, 120, 1, 0)
frText.Position = UDim2.new(0, 70, 0, 0)
frText.BackgroundTransparency = 1
frText.Text = "FRANÇAIS"
frText.TextColor3 = Color3.fromRGB(255, 255, 255)
frText.Font = Enum.Font.GothamBold
frText.TextSize = 16
frText.TextXAlignment = Enum.TextXAlignment.Left
frText.Parent = frBtn

-- BOUTON ANGLAIS
local enBtn = Instance.new("TextButton")
enBtn.Size = UDim2.new(0, 200, 0, 70)
enBtn.Position = UDim2.new(0.5, 20, 0.5, -25)
enBtn.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
enBtn.BorderSizePixel = 0
enBtn.Text = ""
enBtn.Parent = langContainer

local enCorner = Instance.new("UICorner")
enCorner.CornerRadius = UDim.new(0, 15)
enCorner.Parent = enBtn

local enFlag = Instance.new("TextLabel")
enFlag.Size = UDim2.new(0, 50, 1, 0)
enFlag.Position = UDim2.new(0, 15, 0, 0)
enFlag.BackgroundTransparency = 1
enFlag.Text = "🇬🇧"
enFlag.TextColor3 = Color3.fromRGB(255, 255, 255)
enFlag.Font = Enum.Font.GothamBold
enFlag.TextSize = 30
enFlag.Parent = enBtn

local enText = Instance.new("TextLabel")
enText.Size = UDim2.new(0, 120, 1, 0)
enText.Position = UDim2.new(0, 70, 0, 0)
enText.BackgroundTransparency = 1
enText.Text = "ENGLISH"
enText.TextColor3 = Color3.fromRGB(255, 255, 255)
enText.Font = Enum.Font.GothamBold
enText.TextSize = 16
enText.TextXAlignment = Enum.TextXAlignment.Left
enText.Parent = enBtn

-- Variable langue
local language = "fr"
local langChosen = false

frBtn.MouseButton1Click:Connect(function()
    language = "fr"
    langChosen = true
    TweenService:Create(frBtn, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 220, 0, 80),
        BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    }):Play()
    frText.TextColor3 = Color3.fromRGB(0, 0, 0)
    wait(0.5)
end)

enBtn.MouseButton1Click:Connect(function()
    language = "en"
    langChosen = true
    TweenService:Create(enBtn, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 220, 0, 80),
        BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    }):Play()
    enText.TextColor3 = Color3.fromRGB(0, 0, 0)
    wait(0.5)
end)

repeat wait() until langChosen == true

-- Disparition du sélecteur
TweenService:Create(langContainer, TweenInfo.new(0.5), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 1
}):Play()
TweenService:Create(langBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
wait(0.5)
langGui:Destroy()

-- Textes selon langue
local texts = {
    fr = {
        title = "DUMMY FINDER",
        on = "ACTIF",
        off = "INACTIF",
        activate = "ACTIVER",
        deactivate = "DÉSACTIVER",
        status = "STATUT",
        count = "DUM"
    },
    en = {
        title = "DUMMY FINDER",
        on = "ON",
        off = "OFF",
        activate = "ACTIVATE",
        deactivate = "DEACTIVATE",
        status = "STATUS",
        count = "DUM"
    }
}

local t = texts[language]

--------------------------------------------------------------------
-- 2. INTERFACE PRINCIPALE ULTRA LUXE
--------------------------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "DiamondFinder_" .. tostring(math.random(1000, 9999))
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.8, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Animation d'apparition
mainFrame.Size = UDim2.new(0, 320, 0, 220)
TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 300, 0, 200)
}):Play()

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 20)
mainCorner.Parent = mainFrame

-- Bordure diamant animée
local mainBorder = Instance.new("Frame")
mainBorder.Size = UDim2.new(1, 10, 1, 10)
mainBorder.Position = UDim2.new(-0.02, -5, -0.02, -5)
mainBorder.BackgroundTransparency = 1
mainBorder.Parent = mainFrame

local mainBorderGradient = Instance.new("UIGradient")
mainBorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
mainBorderGradient.Rotation = 0
mainBorderGradient.Parent = mainBorder

task.spawn(function()
    while mainFrame do
        mainBorderGradient.Rotation = (mainBorderGradient.Rotation + 1) % 360
        task.wait(0.02)
    end
end)

-- Glass effect
local mainGlass = Instance.new("Frame")
mainGlass.Size = UDim2.new(1, -4, 1, -4)
mainGlass.Position = UDim2.new(0, 2, 0, 2)
mainGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainGlass.BackgroundTransparency = 0.96
mainGlass.BorderSizePixel = 0
mainGlass.Parent = mainFrame

local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 18)
glassCorner.Parent = mainGlass

-- Ombre
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(-0.05, -15, -0.05, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- HEADER
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 20)
headerCorner.Parent = header

-- Icône diamant
local diamondIcon = Instance.new("TextLabel")
diamondIcon.Size = UDim2.new(0, 30, 0, 30)
diamondIcon.Position = UDim2.new(0, 15, 0.5, -15)
diamondIcon.BackgroundTransparency = 1
diamondIcon.Text = "💎"
diamondIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
diamondIcon.Font = Enum.Font.GothamBold
diamondIcon.TextSize = 22
diamondIcon.Parent = header

local headerTitle = Instance.new("TextLabel")
headerTitle.Size = UDim2.new(0, 150, 1, 0)
headerTitle.Position = UDim2.new(0, 50, 0, 0)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = t.title
headerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 18
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.Parent = header

-- Bouton minimiser
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -40, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 70)
minBtn.BackgroundTransparency = 0.3
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 20
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minBtn

-- STATUS CARD
local statusCard = Instance.new("Frame")
statusCard.Size = UDim2.new(1, -30, 0, 70)
statusCard.Position = UDim2.new(0, 15, 0, 65)
statusCard.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
statusCard.BackgroundTransparency = 0.2
statusCard.BorderSizePixel = 0
statusCard.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 12)
statusCorner.Parent = statusCard

-- Point de statut avec glow
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 14, 0, 14)
statusDot.Position = UDim2.new(0, 15, 0.5, -7)
statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
statusDot.BorderSizePixel = 0
statusDot.Parent = statusCard

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

local dotGlow = Instance.new("Frame")
dotGlow.Size = UDim2.new(1, 6, 1, 6)
dotGlow.Position = UDim2.new(-0.2, -3, -0.2, -3)
dotGlow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dotGlow.BackgroundTransparency = 0.6
dotGlow.BorderSizePixel = 0
dotGlow.Parent = statusDot

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = dotGlow

-- Texte statut
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 100, 0, 20)
statusLabel.Position = UDim2.new(0, 40, 0, 10)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = t.status
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusCard

local statusValue = Instance.new("TextLabel")
statusValue.Size = UDim2.new(0, 100, 0, 25)
statusValue.Position = UDim2.new(0, 40, 0, 30)
statusValue.BackgroundTransparency = 1
statusValue.Text = t.off
statusValue.TextColor3 = Color3.fromRGB(255, 100, 100)
statusValue.Font = Enum.Font.GothamBold
statusValue.TextSize = 18
statusValue.TextXAlignment = Enum.TextXAlignment.Left
statusValue.Parent = statusCard

-- COMPTEUR DIAMANT
local counterCard = Instance.new("Frame")
counterCard.Size = UDim2.new(0, 70, 0, 50)
counterCard.Position = UDim2.new(1, -85, 0.5, -25)
counterCard.BackgroundColor3 = Color3.fromRGB(45, 30, 60)
counterCard.BackgroundTransparency = 0.2
counterCard.BorderSizePixel = 0
counterCard.Parent = statusCard

local counterCorner = Instance.new("UICorner")
counterCorner.CornerRadius = UDim.new(0, 10)
counterCorner.Parent = counterCard

local counterNumber = Instance.new("TextLabel")
counterNumber.Size = UDim2.new(1, 0, 0, 25)
counterNumber.Position = UDim2.new(0, 0, 0, 5)
counterNumber.BackgroundTransparency = 1
counterNumber.Text = "0"
counterNumber.TextColor3 = Color3.fromRGB(255, 215, 0)
counterNumber.Font = Enum.Font.GothamBold
counterNumber.TextSize = 20
counterNumber.Parent = counterCard

local counterLabel = Instance.new("TextLabel")
counterLabel.Size = UDim2.new(1, 0, 0, 12)
counterLabel.Position = UDim2.new(0, 0, 0, 30)
counterLabel.BackgroundTransparency = 1
counterLabel.Text = t.count
counterLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
counterLabel.Font = Enum.Font.Gotham
counterLabel.TextSize = 9
counterLabel.Parent = counterCard

-- BOUTON PRINCIPAL
local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0.8, 0, 0, 40)
mainBtn.Position = UDim2.new(0.1, 0, 0, 150)
mainBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = ""
mainBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 20)
btnCorner.Parent = mainBtn

-- Effet brillant
local btnShine = Instance.new("Frame")
btnShine.Size = UDim2.new(1, 0, 0.3, 0)
btnShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnShine.BackgroundTransparency = 0.7
btnShine.BorderSizePixel = 0
btnShine.Parent = mainBtn

local shineCorner = Instance.new("UICorner")
shineCorner.CornerRadius = UDim.new(0, 20)
shineCorner.Parent = btnShine

local btnText = Instance.new("TextLabel")
btnText.Size = UDim2.new(1, 0, 1, 0)
btnText.BackgroundTransparency = 1
btnText.Text = t.activate
btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
btnText.Font = Enum.Font.GothamBold
btnText.TextSize = 14
btnText.Parent = mainBtn

-- BOUTON FERMER ÉLÉGANT
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 70)
closeBtn.BackgroundTransparency = 0.3
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- FRAME MINIMISÉ
local minFrame = Instance.new("Frame")
minFrame.Size = UDim2.new(0, 140, 0, 45)
minFrame.Position = mainFrame.Position
minFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
minFrame.BackgroundTransparency = 0.1
minFrame.BorderSizePixel = 0
minFrame.Visible = false
minFrame.Active = true
minFrame.Draggable = true
minFrame.Parent = gui

local minFrameCorner = Instance.new("UICorner")
minFrameCorner.CornerRadius = UDim.new(0, 15)
minFrameCorner.Parent = minFrame

local minFrameBorder = Instance.new("Frame")
minFrameBorder.Size = UDim2.new(1, 6, 1, 6)
minFrameBorder.Position = UDim2.new(-0.02, -3, -0.02, -3)
minFrameBorder.BackgroundTransparency = 1
minFrameBorder.Parent = minFrame

local minBorderGradient = Instance.new("UIGradient")
minBorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
minBorderGradient.Rotation = 0
minBorderGradient.Parent = minFrameBorder

task.spawn(function()
    while minFrame do
        minBorderGradient.Rotation = (minBorderGradient.Rotation + 1) % 360
        task.wait(0.02)
    end
end)

local minIcon = Instance.new("TextLabel")
minIcon.Size = UDim2.new(0, 30, 1, 0)
minIcon.Position = UDim2.new(0, 8, 0, 0)
minIcon.BackgroundTransparency = 1
minIcon.Text = "💎"
minIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
minIcon.Font = Enum.Font.GothamBold
minIcon.TextSize = 20
minIcon.Parent = minFrame

local minText = Instance.new("TextLabel")
minText.Size = UDim2.new(0, 60, 1, 0)
minText.Position = UDim2.new(0, 40, 0, 0)
minText.BackgroundTransparency = 1
minText.Text = "DUMMY"
minText.TextColor3 = Color3.fromRGB(255, 255, 255)
minText.Font = Enum.Font.GothamBold
minText.TextSize = 12
minText.TextXAlignment = Enum.TextXAlignment.Left
minText.Parent = minFrame

local minCounter = Instance.new("TextLabel")
minCounter.Size = UDim2.new(0, 30, 1, 0)
minCounter.Position = UDim2.new(1, -30, 0, 0)
minCounter.BackgroundTransparency = 1
minCounter.Text = "0"
minCounter.TextColor3 = Color3.fromRGB(255, 215, 0)
minCounter.Font = Enum.Font.GothamBold
minCounter.TextSize = 14
minCounter.Parent = minFrame

local minDot = Instance.new("Frame")
minDot.Size = UDim2.new(0, 8, 0, 8)
minDot.Position = UDim2.new(1, -12, 0.5, -4)
minDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minDot.BorderSizePixel = 0
minDot.Parent = minFrame

local minDotCorner = Instance.new("UICorner")
minDotCorner.CornerRadius = UDim.new(1, 0)
minDotCorner.Parent = minDot

local restoreBtn = Instance.new("TextButton")
restoreBtn.Size = UDim2.new(1, 0, 1, 0)
restoreBtn.BackgroundTransparency = 1
restoreBtn.Text = ""
restoreBtn.Parent = minFrame

-- Rendre draggable
local function makeDraggable(frame)
    local dragging = false
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    frame.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

makeDraggable(mainFrame)
makeDraggable(minFrame)

--------------------------------------------------------------------
-- 3. FONCTIONS ESP ULTRA PRÉCISES
--------------------------------------------------------------------

-- Table des ESP actifs
local activeESP = {}

-- Fonction pour trouver les dummies
local function findDummies()
    local dummies = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            local name = obj.Name:lower()
            if name:find("dummy") or name:find("entra") or name:find("train") or name:find("mannequin") then
                table.insert(dummies, obj)
            end
        end
    end
    return dummies
end

-- Création ESP
local function createESP(dummy)
    if not dummy or not dummy:FindFirstChild("HumanoidRootPart") then return end
    if Players:GetPlayerFromCharacter(dummy) then return end

    local espId = dummy.Name .. "_" .. dummy:GetDebugId()
    if activeESP[espId] then return end

    local humanoid = dummy:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end

    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.Adornee = dummy
    highlight.FillColor = Color3.fromRGB(255, 215, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.4
    highlight.OutlineTransparency = 0.2
    highlight.Parent = espFolder
    highlight.Name = "ESP_" .. tostring(math.random(1000, 9999))

    -- Billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = dummy.HumanoidRootPart
    billboard.Size = UDim2.new(0, 120, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = highlight

    -- Fond
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = billboard

    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 5)
    bgCorner.Parent = bg

    -- Texte
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = dummy.Name .. " ❤️ " .. math.floor(humanoid.Health)
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 11
    text.Parent = bg

    -- Stocker
    activeESP[espId] = {
        dummy = dummy,
        highlight = highlight,
        text = text,
        humanoid = humanoid
    }

    -- Mise à jour
    task.spawn(function()
        while activeESP[espId] do
            if dummy and dummy.Parent and humanoid and humanoid.Health > 0 then
                text.Text = dummy.Name .. " ❤️ " .. math.floor(humanoid.Health)
                if humanoid.Health < 30 then
                    text.TextColor3 = Color3.fromRGB(255, 100, 100)
                elseif humanoid.Health < 70 then
                    text.TextColor3 = Color3.fromRGB(255, 255, 100)
                else
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                end
            else
                if highlight then highlight:Destroy() end
                activeESP[espId] = nil
                break
            end
            task.wait(0.1)
        end
    end)
end

-- Scan
local function scanAll()
    local dummies = findDummies()
    for _, dummy in pairs(dummies) do
        createESP(dummy)
    end
end

-- Nouveaux dummies
workspace.DescendantAdded:Connect(function(obj)
    if espEnabled and obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
        task.wait(0.2)
        createESP(obj)
    end
end)

--------------------------------------------------------------------
-- 4. FONCTIONS PRINCIPALES
--------------------------------------------------------------------

-- Toggle ESP
local function toggleESP()
    espEnabled = not espEnabled

    if espEnabled then
        for _, esp in pairs(activeESP) do
            if esp.highlight then esp.highlight:Destroy() end
        end
        activeESP = {}
        scanAll()

        -- UI
        statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        dotGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        statusValue.Text = t.on
        statusValue.TextColor3 = Color3.fromRGB(0, 255, 0)
        minDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        btnText.Text = t.deactivate
        mainBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    else
        for _, esp in pairs(activeESP) do
            if esp.highlight then esp.highlight:Destroy() end
        end
        activeESP = {}

        -- UI
        statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        dotGlow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        statusValue.Text = t.off
        statusValue.TextColor3 = Color3.fromRGB(255, 100, 100)
        minDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        btnText.Text = t.activate
        mainBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

-- Mise à jour compteur
task.spawn(function()
    while true do
        if espEnabled then
            local count = 0
            for _ in pairs(activeESP) do
                count = count + 1
            end
            counterNumber.Text = tostring(count)
            minCounter.Text = tostring(count)
        end
        task.wait(0.1)
    end
end)

-- Minimiser/Restaurer
local function toggleMinimize()
    minimized = not minimized
    if minimized then
        minFrame.Position = mainFrame.Position
        mainFrame.Visible = false
        minFrame.Visible = true
        minBtn.Text = "□"
    else
        mainFrame.Position = minFrame.Position
        minFrame.Visible = false
        mainFrame.Visible = true
        minBtn.Text = "−"
    end
end

minBtn.MouseButton1Click:Connect(toggleMinimize)
restoreBtn.MouseButton1Click:Connect(function()
    minimized = false
    mainFrame.Position = minFrame.Position
    minFrame.Visible = false
    mainFrame.Visible = true
    minBtn.Text = "−"
end)

mainBtn.MouseButton1Click:Connect(toggleESP)
closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.8, 0),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(minFrame, TweenInfo.new(0.3), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.8, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.3)
    gui:Destroy()
end)

-- Raccourci V
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.V then
        toggleESP()
    end
end)

-- Effets de survol
minBtn.MouseEnter:Connect(function()
    TweenService:Create(minBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 60, 100)}):Play()
end)
minBtn.MouseLeave:Connect(function()
    TweenService:Create(minBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 40, 70)}):Play()
end)

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 50, 80)}):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 40, 70)}):Play()
end)

print("✨ DUMMY FINDER DIAMOND 2026 chargé !")
print("🌍 Langue: " .. (language == "fr" and "Français" or "English"))
print("🎯 Appuie sur V pour activer")
print("📱 Mobile: bouton − pour minimiser")
