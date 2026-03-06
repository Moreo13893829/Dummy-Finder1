--[[
    ✦✦✦ DUMMY FINDER DIAMOND 2026 ✦✦✦
    Édition ULTRA LUXE – Spéciale Battlegrounds
    Compatible : The Strongest Battlegrounds, Jujutsu Shenanigans, et tous les jeux de combat Roblox
    Avec correction du bug de réactivation intempestive
]]

-- Attendre le chargement
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")

-- Détection mobile
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

-- Variables
local espEnabled = false
local minimized = false
local espFolder = Instance.new("Folder")
espFolder.Name = "DiamondESP_" .. tostring(math.random(1000, 9999))
espFolder.Parent = CoreGui

--------------------------------------------------------------------
-- 1. SÉLECTEUR DE LANGUE MAGNIFIQUE (amélioré)
--------------------------------------------------------------------

local langGui = Instance.new("ScreenGui")
langGui.Name = "LangSelector"
langGui.ResetOnSpawn = false
langGui.Parent = CoreGui
langGui.DisplayOrder = 999

-- Flou d'arrière-plan
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 20}):Play()

local langBg = Instance.new("Frame")
langBg.Size = UDim2.new(1, 0, 1, 0)
langBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
langBg.BackgroundTransparency = 0.3
langBg.BorderSizePixel = 0
langBg.Parent = langGui

-- Container
local langContainer = Instance.new("Frame")
langContainer.Size = UDim2.new(0, 550, 0, 400)
langContainer.Position = UDim2.new(0.5, -275, 0.5, -200)
langContainer.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
langContainer.BackgroundTransparency = 0.1
langContainer.BorderSizePixel = 0
langContainer.ClipsDescendants = true
langContainer.Parent = langBg

local langCorner = Instance.new("UICorner")
langCorner.CornerRadius = UDim.new(0, 30)
langCorner.Parent = langContainer

-- Bordure diamant animée (plus épaisse)
local langBorder = Instance.new("Frame")
langBorder.Size = UDim2.new(1, 12, 1, 12)
langBorder.Position = UDim2.new(-0.02, -6, -0.02, -6)
langBorder.BackgroundTransparency = 1
langBorder.ZIndex = -1
langBorder.Parent = langContainer

local langBorderGradient = Instance.new("UIGradient")
langBorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
langBorderGradient.Rotation = 0
langBorderGradient.Parent = langBorder

-- Animation plus rapide
task.spawn(function()
    while langContainer do
        langBorderGradient.Rotation = (langBorderGradient.Rotation + 2) % 360
        task.wait(0.01)
    end
end)

-- Effet verre
local langGlass = Instance.new("Frame")
langGlass.Size = UDim2.new(1, -4, 1, -4)
langGlass.Position = UDim2.new(0, 2, 0, 2)
langGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
langGlass.BackgroundTransparency = 0.96
langGlass.BorderSizePixel = 0
langGlass.Parent = langContainer

local langGlassCorner = Instance.new("UICorner")
langGlassCorner.CornerRadius = UDim.new(0, 28)
langGlassCorner.Parent = langGlass

-- Titre
local langTitle = Instance.new("TextLabel")
langTitle.Size = UDim2.new(1, 0, 0, 80)
langTitle.Position = UDim2.new(0, 0, 0, 80)
langTitle.BackgroundTransparency = 1
langTitle.Text = "CHOISIS TA LANGUE"
langTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
langTitle.Font = Enum.Font.GothamBold
langTitle.TextSize = 36
langTitle.TextStrokeTransparency = 0.5
langTitle.TextStrokeColor3 = Color3.fromRGB(255, 215, 0)
langTitle.Parent = langContainer

local langSub = Instance.new("TextLabel")
langSub.Size = UDim2.new(1, 0, 0, 40)
langSub.Position = UDim2.new(0, 0, 0, 150)
langSub.BackgroundTransparency = 1
langSub.Text = "CHOOSE YOUR LANGUAGE"
langSub.TextColor3 = Color3.fromRGB(200, 200, 255)
langSub.Font = Enum.Font.Gotham
langSub.TextSize = 18
langSub.TextStrokeTransparency = 0.8
langSub.Parent = langContainer

-- BOUTON FRANÇAIS (plus stylisé)
local frBtn = Instance.new("TextButton")
frBtn.Size = UDim2.new(0, 220, 0, 80)
frBtn.Position = UDim2.new(0.5, -240, 0.6, -40)
frBtn.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
frBtn.BorderSizePixel = 0
frBtn.Text = ""
frBtn.Parent = langContainer

local frCorner = Instance.new("UICorner")
frCorner.CornerRadius = UDim.new(0, 20)
frCorner.Parent = frBtn

local frGlow = Instance.new("Frame")
frGlow.Size = UDim2.new(1, 6, 1, 6)
frGlow.Position = UDim2.new(-0.02, -3, -0.02, -3)
frGlow.BackgroundTransparency = 1
frGlow.ZIndex = -1
frGlow.Parent = frBtn

local frGlowGradient = Instance.new("UIGradient")
frGlowGradient.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(255, 100, 0))
frGlowGradient.Rotation = 45
frGlowGradient.Parent = frGlow

local frFlag = Instance.new("TextLabel")
frFlag.Size = UDim2.new(0, 60, 1, 0)
frFlag.Position = UDim2.new(0, 15, 0, 0)
frFlag.BackgroundTransparency = 1
frFlag.Text = "🇫🇷"
frFlag.TextColor3 = Color3.fromRGB(255, 255, 255)
frFlag.Font = Enum.Font.GothamBold
frFlag.TextSize = 40
frFlag.Parent = frBtn

local frText = Instance.new("TextLabel")
frText.Size = UDim2.new(0, 130, 1, 0)
frText.Position = UDim2.new(0, 80, 0, 0)
frText.BackgroundTransparency = 1
frText.Text = "FRANÇAIS"
frText.TextColor3 = Color3.fromRGB(255, 255, 255)
frText.Font = Enum.Font.GothamBold
frText.TextSize = 18
frText.TextXAlignment = Enum.TextXAlignment.Left
frText.Parent = frBtn

-- BOUTON ANGLAIS
local enBtn = Instance.new("TextButton")
enBtn.Size = UDim2.new(0, 220, 0, 80)
enBtn.Position = UDim2.new(0.5, 20, 0.6, -40)
enBtn.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
enBtn.BorderSizePixel = 0
enBtn.Text = ""
enBtn.Parent = langContainer

local enCorner = Instance.new("UICorner")
enCorner.CornerRadius = UDim.new(0, 20)
enCorner.Parent = enBtn

local enGlow = Instance.new("Frame")
enGlow.Size = UDim2.new(1, 6, 1, 6)
enGlow.Position = UDim2.new(-0.02, -3, -0.02, -3)
enGlow.BackgroundTransparency = 1
enGlow.ZIndex = -1
enGlow.Parent = enBtn

local enGlowGradient = Instance.new("UIGradient")
enGlowGradient.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0), Color3.fromRGB(100, 200, 255))
enGlowGradient.Rotation = 45
enGlowGradient.Parent = enGlow

local enFlag = Instance.new("TextLabel")
enFlag.Size = UDim2.new(0, 60, 1, 0)
enFlag.Position = UDim2.new(0, 15, 0, 0)
enFlag.BackgroundTransparency = 1
enFlag.Text = "🇬🇧"
enFlag.TextColor3 = Color3.fromRGB(255, 255, 255)
enFlag.Font = Enum.Font.GothamBold
enFlag.TextSize = 40
enFlag.Parent = enBtn

local enText = Instance.new("TextLabel")
enText.Size = UDim2.new(0, 130, 1, 0)
enText.Position = UDim2.new(0, 80, 0, 0)
enText.BackgroundTransparency = 1
enText.Text = "ENGLISH"
enText.TextColor3 = Color3.fromRGB(255, 255, 255)
enText.Font = Enum.Font.GothamBold
enText.TextSize = 18
enText.TextXAlignment = Enum.TextXAlignment.Left
enText.Parent = enBtn

-- Variable langue
local language = "fr"
local langChosen = false

-- Fonction de sélection avec animation
local function selectLang(btn, lang)
    language = lang
    langChosen = true
    TweenService:Create(btn, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 240, 0, 90),
        Position = btn.Position + UDim2.new(0, -10, 0, -5),
        BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    }):Play()
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    wait(0.6)
end

frBtn.MouseButton1Click:Connect(function()
    selectLang(frBtn, "fr")
    frText.TextColor3 = Color3.fromRGB(0, 0, 0)
    enBtn.Visible = false
end)

enBtn.MouseButton1Click:Connect(function()
    selectLang(enBtn, "en")
    enText.TextColor3 = Color3.fromRGB(0, 0, 0)
    frBtn.Visible = false
end)

repeat wait() until langChosen == true

-- Disparition du sélecteur
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
TweenService:Create(langContainer, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 1
}):Play()
TweenService:Create(langBg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
wait(0.5)
langGui:Destroy()
Debris:AddItem(blur, 0)

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
-- 2. INTERFACE PRINCIPALE ULTRA LUXE V2
--------------------------------------------------------------------

local gui = Instance.new("ScreenGui")
gui.Name = "DiamondFinder_" .. tostring(math.random(1000, 9999))
gui.ResetOnSpawn = false
gui.Parent = CoreGui
gui.DisplayOrder = 100

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 220)
mainFrame.Position = UDim2.new(0.5, -160, 0.8, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Animation d'apparition
mainFrame.Size = UDim2.new(0, 340, 0, 240)
TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 220)
}):Play()

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 25)
mainCorner.Parent = mainFrame

-- Bordure diamant épaisse et animée
local mainBorder = Instance.new("Frame")
mainBorder.Size = UDim2.new(1, 14, 1, 14)
mainBorder.Position = UDim2.new(-0.02, -7, -0.02, -7)
mainBorder.BackgroundTransparency = 1
mainBorder.ZIndex = -1
mainBorder.Parent = mainFrame

local mainBorderGradient = Instance.new("UIGradient")
mainBorderGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
})
mainBorderGradient.Rotation = 0
mainBorderGradient.Parent = mainBorder

-- Particules de diamant autour du cadre
local particles = Instance.new("ParticleEmitter")
particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
particles.Lifetime = NumberRange.new(1, 2)
particles.Rate = 10
particles.SpreadAngle = Vector2.new(360, 360)
particles.Speed = NumberRange.new(2, 4)
particles.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 215, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
particles.LightEmission = 0.5
particles.Parent = mainBorder

task.spawn(function()
    while mainFrame do
        mainBorderGradient.Rotation = (mainBorderGradient.Rotation + 1.5) % 360
        task.wait(0.01)
    end
end)

-- Glass effect amélioré
local mainGlass = Instance.new("Frame")
mainGlass.Size = UDim2.new(1, -4, 1, -4)
mainGlass.Position = UDim2.new(0, 2, 0, 2)
mainGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainGlass.BackgroundTransparency = 0.94
mainGlass.BorderSizePixel = 0
mainGlass.Parent = mainFrame

local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 23)
glassCorner.Parent = mainGlass

-- Ombre portée plus douce
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Position = UDim2.new(-0.06, -20, -0.06, -20)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- HEADER
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(20, 10, 35)
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 25)
headerCorner.Parent = header

-- Icône diamant (image)
local diamondIcon = Instance.new("ImageLabel")
diamondIcon.Size = UDim2.new(0, 32, 0, 32)
diamondIcon.Position = UDim2.new(0, 15, 0.5, -16)
diamondIcon.BackgroundTransparency = 1
diamondIcon.Image = "rbxassetid://12834443286" -- Icône diamant (à remplacer si besoin)
diamondIcon.ImageColor3 = Color3.fromRGB(255, 215, 0)
diamondIcon.Parent = header

local headerTitle = Instance.new("TextLabel")
headerTitle.Size = UDim2.new(0, 160, 1, 0)
headerTitle.Position = UDim2.new(0, 55, 0, 0)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = t.title
headerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 20
headerTitle.TextXAlignment = Enum.TextXAlignment.Left
headerTitle.TextStrokeTransparency = 0.3
headerTitle.TextStrokeColor3 = Color3.fromRGB(255, 215, 0)
headerTitle.Parent = header

-- Bouton minimiser (plus beau)
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 32, 0, 32)
minBtn.Position = UDim2.new(1, -42, 0.5, -16)
minBtn.BackgroundColor3 = Color3.fromRGB(70, 50, 90)
minBtn.BackgroundTransparency = 0.2
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.TextSize = 24
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = header

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 10)
minCorner.Parent = minBtn

-- STATUS CARD (plus élégante)
local statusCard = Instance.new("Frame")
statusCard.Size = UDim2.new(1, -30, 0, 75)
statusCard.Position = UDim2.new(0, 15, 0, 70)
statusCard.BackgroundColor3 = Color3.fromRGB(25, 15, 40)
statusCard.BackgroundTransparency = 0.2
statusCard.BorderSizePixel = 0
statusCard.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 15)
statusCorner.Parent = statusCard

-- Point de statut avec pulsation
local statusDot = Instance.new("Frame")
statusDot.Size = UDim2.new(0, 16, 0, 16)
statusDot.Position = UDim2.new(0, 15, 0.5, -8)
statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
statusDot.BorderSizePixel = 0
statusDot.Parent = statusCard

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

local dotGlow = Instance.new("Frame")
dotGlow.Size = UDim2.new(1, 8, 1, 8)
dotGlow.Position = UDim2.new(-0.25, -4, -0.25, -4)
dotGlow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dotGlow.BackgroundTransparency = 0.5
dotGlow.BorderSizePixel = 0
dotGlow.Parent = statusDot

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = dotGlow

-- Animation de pulsation
task.spawn(function()
    while statusDot do
        if espEnabled then
            TweenService:Create(dotGlow, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
                Size = UDim2.new(1, 12, 1, 12),
                Position = UDim2.new(-0.4, -6, -0.4, -6),
                BackgroundTransparency = 0.7
            }):Play()
        else
            TweenService:Create(dotGlow, TweenInfo.new(0.8), {Size = UDim2.new(1, 8, 1, 8), Position = UDim2.new(-0.25, -4, -0.25, -4), BackgroundTransparency = 0.5}):Play()
        end
        wait(0.9)
    end
end)

-- Texte statut
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 120, 0, 22)
statusLabel.Position = UDim2.new(0, 45, 0, 8)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = t.status
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = statusCard

local statusValue = Instance.new("TextLabel")
statusValue.Size = UDim2.new(0, 120, 0, 28)
statusValue.Position = UDim2.new(0, 45, 0, 30)
statusValue.BackgroundTransparency = 1
statusValue.Text = t.off
statusValue.TextColor3 = Color3.fromRGB(255, 100, 100)
statusValue.Font = Enum.Font.GothamBold
statusValue.TextSize = 20
statusValue.TextXAlignment = Enum.TextXAlignment.Left
statusValue.Parent = statusCard

-- COMPTEUR DIAMANT
local counterCard = Instance.new("Frame")
counterCard.Size = UDim2.new(0, 80, 0, 55)
counterCard.Position = UDim2.new(1, -95, 0.5, -27.5)
counterCard.BackgroundColor3 = Color3.fromRGB(50, 30, 70)
counterCard.BackgroundTransparency = 0.2
counterCard.BorderSizePixel = 0
counterCard.Parent = statusCard

local counterCorner = Instance.new("UICorner")
counterCorner.CornerRadius = UDim.new(0, 12)
counterCorner.Parent = counterCard

local counterNumber = Instance.new("TextLabel")
counterNumber.Size = UDim2.new(1, 0, 0, 28)
counterNumber.Position = UDim2.new(0, 0, 0, 5)
counterNumber.BackgroundTransparency = 1
counterNumber.Text = "0"
counterNumber.TextColor3 = Color3.fromRGB(255, 215, 0)
counterNumber.Font = Enum.Font.GothamBold
counterNumber.TextSize = 22
counterNumber.Parent = counterCard

local counterLabel = Instance.new("TextLabel")
counterLabel.Size = UDim2.new(1, 0, 0, 14)
counterLabel.Position = UDim2.new(0, 0, 0, 33)
counterLabel.BackgroundTransparency = 1
counterLabel.Text = t.count
counterLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
counterLabel.Font = Enum.Font.Gotham
counterLabel.TextSize = 10
counterLabel.Parent = counterCard

-- BOUTON PRINCIPAL (plus gros)
local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(0.8, 0, 0, 45)
mainBtn.Position = UDim2.new(0.1, 0, 0, 165)
mainBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mainBtn.BorderSizePixel = 0
mainBtn.Text = ""
mainBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 25)
btnCorner.Parent = mainBtn

-- Effet brillant amélioré
local btnShine = Instance.new("Frame")
btnShine.Size = UDim2.new(1, 0, 0.4, 0)
btnShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnShine.BackgroundTransparency = 0.7
btnShine.BorderSizePixel = 0
btnShine.Parent = mainBtn

local shineCorner = Instance.new("UICorner")
shineCorner.CornerRadius = UDim.new(0, 25)
shineCorner.Parent = btnShine

local btnText = Instance.new("TextLabel")
btnText.Size = UDim2.new(1, 0, 1, 0)
btnText.BackgroundTransparency = 1
btnText.Text = t.activate
btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
btnText.Font = Enum.Font.GothamBold
btnText.TextSize = 16
btnText.TextStrokeTransparency = 0.3
btnText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
btnText.Parent = mainBtn

-- BOUTON FERMER
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -42, 0, 12)
closeBtn.BackgroundColor3 = Color3.fromRGB(70, 50, 90)
closeBtn.BackgroundTransparency = 0.2
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

-- FRAME MINIMISÉ (amélioré)
local minFrame = Instance.new("Frame")
minFrame.Size = UDim2.new(0, 150, 0, 50)
minFrame.Position = mainFrame.Position
minFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
minFrame.BackgroundTransparency = 0.1
minFrame.BorderSizePixel = 0
minFrame.Visible = false
minFrame.Active = true
minFrame.Draggable = true
minFrame.Parent = gui

local minFrameCorner = Instance.new("UICorner")
minFrameCorner.CornerRadius = UDim.new(0, 20)
minFrameCorner.Parent = minFrame

local minFrameBorder = Instance.new("Frame")
minFrameBorder.Size = UDim2.new(1, 8, 1, 8)
minFrameBorder.Position = UDim2.new(-0.02, -4, -0.02, -4)
minFrameBorder.BackgroundTransparency = 1
minFrameBorder.ZIndex = -1
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
        minBorderGradient.Rotation = (minBorderGradient.Rotation + 1.5) % 360
        task.wait(0.01)
    end
end)

local minIcon = Instance.new("ImageLabel")
minIcon.Size = UDim2.new(0, 32, 1, 0)
minIcon.Position = UDim2.new(0, 8, 0, 0)
minIcon.BackgroundTransparency = 1
minIcon.Image = "rbxassetid://12834443286"
minIcon.ImageColor3 = Color3.fromRGB(255, 215, 0)
minIcon.Parent = minFrame

local minText = Instance.new("TextLabel")
minText.Size = UDim2.new(0, 70, 1, 0)
minText.Position = UDim2.new(0, 45, 0, 0)
minText.BackgroundTransparency = 1
minText.Text = "DUMMY"
minText.TextColor3 = Color3.fromRGB(255, 255, 255)
minText.Font = Enum.Font.GothamBold
minText.TextSize = 14
minText.TextXAlignment = Enum.TextXAlignment.Left
minText.Parent = minFrame

local minCounter = Instance.new("TextLabel")
minCounter.Size = UDim2.new(0, 30, 1, 0)
minCounter.Position = UDim2.new(1, -32, 0, 0)
minCounter.BackgroundTransparency = 1
minCounter.Text = "0"
minCounter.TextColor3 = Color3.fromRGB(255, 215, 0)
minCounter.Font = Enum.Font.GothamBold
minCounter.TextSize = 16
minCounter.Parent = minFrame

local minDot = Instance.new("Frame")
minDot.Size = UDim2.new(0, 10, 0, 10)
minDot.Position = UDim2.new(1, -14, 0.5, -5)
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

-- Rendre draggable (inchangé)
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
-- 3. FONCTIONS ESP ULTRA PRÉCISES (avec correction du bug)
--------------------------------------------------------------------

-- Table des ESP actifs
local activeESP = {}
local scanning = false

-- Fonction pour trouver les dummies (tous les NPCs)
local function findDummies()
    local dummies = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            -- Exclure les joueurs réels
            if not Players:GetPlayerFromCharacter(obj) then
                table.insert(dummies, obj)
            end
        end
    end
    return dummies
end

-- Création ESP (avec vérification stricte de espEnabled)
local function createESP(dummy)
    -- Vérification que l'ESP est bien activé
    if not espEnabled then return end
    if not dummy or not dummy:FindFirstChild("HumanoidRootPart") then return end
    if Players:GetPlayerFromCharacter(dummy) then return end

    local humanoid = dummy:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end

    local espId = dummy.Name .. "_" .. dummy:GetDebugId()
    if activeESP[espId] then return end

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
    billboard.Size = UDim2.new(0, 140, 0, 35)
    billboard.StudsOffset = Vector3.new(0, 3.5, 0)
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
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg

    -- Texte
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = dummy.Name .. " ❤️ " .. math.floor(humanoid.Health)
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 12
    text.Parent = bg

    -- Stocker
    activeESP[espId] = {
        dummy = dummy,
        highlight = highlight,
        text = text,
        humanoid = humanoid
    }

    -- Mise à jour et auto-nettoyage (avec vérification espEnabled en continu)
    task.spawn(function()
        while activeESP[espId] and espEnabled do
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
        -- Si espEnabled devient false, on détruit aussi
        if highlight then highlight:Destroy() end
        activeESP[espId] = nil
    end)
end

-- Scan complet (ne fait rien si espEnabled est false)
local function scanAll()
    if not espEnabled then return end
    local dummies = findDummies()
    for _, dummy in pairs(dummies) do
        createESP(dummy)
    end
end

-- Détection des nouveaux dummies (avec vérification espEnabled)
workspace.DescendantAdded:Connect(function(obj)
    if espEnabled and obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
        task.wait(0.2)
        createESP(obj)
    end
end)

-- Boucle de scan périodique (uniquement si espEnabled)
local function startPeriodicScan()
    task.spawn(function()
        while espEnabled do
            task.wait(2)
            scanAll()
        end
    end)
end

--------------------------------------------------------------------
-- 4. FONCTIONS PRINCIPALES (avec toggle robuste)
--------------------------------------------------------------------

-- Toggle ESP
local function toggleESP()
    espEnabled = not espEnabled

    if espEnabled then
        -- Nettoyer les anciens ESP avant de démarrer
        for _, esp in pairs(activeESP) do
            if esp.highlight then esp.highlight:Destroy() end
        end
        activeESP = {}
        scanAll()
        startPeriodicScan()

        -- UI
        statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        dotGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        statusValue.Text = t.on
        statusValue.TextColor3 = Color3.fromRGB(0, 255, 0)
        minDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        btnText.Text = t.deactivate
        mainBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        
        -- Effet de flash
        TweenService:Create(mainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
        wait(0.1)
        TweenService:Create(mainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
    else
        -- Détruire tous les ESP
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
        
        TweenService:Create(mainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
        wait(0.1)
        TweenService:Create(mainBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
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
    wait(0.3)
    gui:Destroy()
    espFolder:Destroy()
end)

-- Raccourci V (avec anti-répétition)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.V then
        toggleESP()
    end
end)

-- Effets de survol améliorés
local function hoverEffect(btn, color)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color, BackgroundTransparency = 0}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = btn.Size + UDim2.new(0, 2, 0, 2)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 50, 90), BackgroundTransparency = 0.2}):Play()
        TweenService:Create(btn, TweenInfo.new(0.2), {Size = btn.Size - UDim2.new(0, 2, 0, 2)}):Play()
    end)
end

hoverEffect(minBtn, Color3.fromRGB(120, 80, 150))
hoverEffect(closeBtn, Color3.fromRGB(150, 70, 100))

mainBtn.MouseEnter:Connect(function()
    TweenService:Create(mainBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.82, 0, 0, 47), Position = UDim2.new(0.09, 0, 0, 164)}):Play()
end)
mainBtn.MouseLeave:Connect(function()
    TweenService:Create(mainBtn, TweenInfo.new(0.2), {Size = UDim2.new(0.8, 0, 0, 45), Position = UDim2.new(0.1, 0, 0, 165)}):Play()
end)

print("✨ DUMMY FINDER DIAMOND 2026 - Édition ULTRA LUXE chargée !")
print("🌍 Langue: " .. (language == "fr" and "Français" or "English"))
print("🎯 Appuie sur V pour activer (scan automatique des respawns toutes les 2s)")
print("📱 Mobile: bouton − pour minimiser")
print("✅ Bug de réactivation intempestive corrigé !")
