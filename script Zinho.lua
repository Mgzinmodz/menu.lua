-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- // GUI PRINCIPAL
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MGCHEATS"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999

-- ==============================================
-- // BOTÃO FLUTUANTE MG VERDE NEON
-- ==============================================
local ButtonMG = Instance.new("TextButton")
ButtonMG.Name = "ButtonMG"
ButtonMG.Parent = ScreenGui
ButtonMG.BackgroundColor3 = Color3.new(0, 0, 0)
ButtonMG.BorderColor3 = Color3.new(0, 1, 0)
ButtonMG.BorderSizePixel = 2
ButtonMG.Size = UDim2.new(0, 70, 0, 70)
ButtonMG.Position = UDim2.new(0.02, 0, 0.45, 0)
ButtonMG.Font = Enum.Font.GothamBold
ButtonMG.Text = "MG"
ButtonMG.TextColor3 = Color3.new(0, 1, 0)
ButtonMG.TextSize = 28
ButtonMG.Active = true
ButtonMG.Draggable = true

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(1, 0)
UICornerBtn.Parent = ButtonMG

local UIStrokeBtn = Instance.new("UIStroke")
UIStrokeBtn.Thickness = 3
UIStrokeBtn.Color = Color3.new(0, 1, 0)
UIStrokeBtn.Parent = ButtonMG

-- ==============================================
-- // MENU PRINCIPAL
-- ==============================================
local MainMenu = Instance.new("Frame")
MainMenu.Name = "MainMenu"
MainMenu.Parent = ScreenGui
MainMenu.BackgroundColor3 = Color3.new(0.05, 0.05, 0.08)
MainMenu.BackgroundTransparency = 0.1
MainMenu.BorderColor3 = Color3.new(0, 1, 0)
MainMenu.BorderSizePixel = 2
MainMenu.Size = UDim2.new(0, 350, 0, 500)
MainMenu.Position = UDim2.new(0.05, 0, 0.1, 0)
MainMenu.Active = true
MainMenu.Draggable = true
MainMenu.Visible = false -- COMEÇA ESCONDIDO

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 12)
UICornerMenu.Parent = MainMenu

-- // TOPO
local TopBar = Instance.new("Frame")
TopBar.Parent = MainMenu
TopBar.BackgroundColor3 = Color3.new(0,0,0)
TopBar.BorderColor3 = Color3.new(0,1,0)
TopBar.BorderSizePixel = 1
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.Position = UDim2.new(0,0,0,0)

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0,10,0,0)
Title.Font = Enum.Font.GothamBold
Title.Text = "★ MGCHEATS ★"
Title.TextColor3 = Color3.new(0, 1, 0)
Title.TextSize = 20

local BtnMin = Instance.new("TextButton")
BtnMin.Parent = TopBar
BtnMin.Size = UDim2.new(0, 40, 0, 30)
BtnMin.Position = UDim2.new(1, -80, 0, 5)
BtnMin.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
BtnMin.BorderColor3 = Color3.new(0,1,0)
BtnMin.Text = "-"
BtnMin.TextColor3 = Color3.new(1,1,1)
BtnMin.Font = Enum.Font.GothamBold
BtnMin.TextSize = 20

local BtnClose = Instance.new("TextButton")
BtnClose.Parent = TopBar
BtnClose.Size = UDim2.new(0, 40, 0, 30)
BtnClose.Position = UDim2.new(1, -35, 0, 5)
BtnClose.BackgroundColor3 = Color3.new(0.5, 0, 0)
BtnClose.BorderColor3 = Color3.new(1,0,0)
BtnClose.Text = "X"
BtnClose.TextColor3 = Color3.new(1,1,1)
BtnClose.Font = Enum.Font.GothamBold
BtnClose.TextSize = 20

-- ==============================================
-- // VARIAVEIS GLOBAIS
-- ==============================================
_G.Aimbot = false
_G.ESP_Line = false
_G.ESP_Box = false
_G.ESP_Skeleton = false
_G.ShowFOV = false
_G.FOV_Value = 0

local Y = 50
local FOVCircle = nil

-- ==============================================
-- // FUNÇÃO CRIAR BOTÃO TOGGLE
-- ==============================================
local function CreateToggle(Name, Variable)
    local Frame = Instance.new("Frame")
    Frame.Parent = MainMenu
    Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.15)
    Frame.BorderColor3 = Color3.new(0, 1, 0)
    Frame.BorderSizePixel = 1
    Frame.Size = UDim2.new(0.95, 0, 0, 50)
    Frame.Position = UDim2.new(0.025, 0, 0, Y)
    Y = Y + 60

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0.05, 0, 0, 0)
    Label.Font = Enum.Font.GothamBold
    Label.Text = Name
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 18
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Toggle = Instance.new("TextButton")
    Toggle.Parent = Frame
    Toggle.Size = UDim2.new(0, 50, 0, 25)
    Toggle.Position = UDim2.new(0.85, 0, 0.5, -12)
    Toggle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    Toggle.BorderColor3 = Color3.new(1,1,1)
    Toggle.Text = ""

    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.CornerRadius = UDim.new(0, 10)
    UICornerToggle.Parent = Toggle

    Toggle.MouseButton1Click:Connect(function()
        _G[Variable] = not _G[Variable]
        if _G[Variable] then
            Toggle.BackgroundColor3 = Color3.new(0, 1, 0)
        else
            Toggle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        end
    end)
end

-- ==============================================
-- // FUNÇÃO CRIAR SLIDER FOV
-- ==============================================
local function CreateSlider()
    local Frame = Instance.new("Frame")
    Frame.Parent = MainMenu
    Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.15)
    Frame.BorderColor3 = Color3.new(0, 1, 0)
    Frame.BorderSizePixel = 1
    Frame.Size = UDim2.new(0.95, 0, 0, 70)
    Frame.Position = UDim2.new(0.025, 0, 0, Y)

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(0.7, 0, 0, 30)
    Label.Position = UDim2.new(0.05, 0, 0.05, 0)
    Label.Font = Enum.Font.GothamBold
    Label.Text = "REGULAR FOV"
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 18
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local ValueText = Instance.new("TextLabel")
    ValueText.Parent = Frame
    ValueText.BackgroundTransparency = 1
    ValueText.Size = UDim2.new(0.2, 0, 0, 30)
    ValueText.Position = UDim2.new(0.75, 0, 0.05, 0)
    ValueText.Font = Enum.Font.GothamBold
    ValueText.Text = "0"
    ValueText.TextColor3 = Color3.new(0, 1, 0)
    ValueText.TextSize = 18

    -- BARRA
    local BarBackground = Instance.new("Frame")
    BarBackground.Parent = Frame
    BarBackground.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    BarBackground.Size = UDim2.new(0.9, 0, 0, 10)
    BarBackground.Position = UDim2.new(0.05, 0, 0.6, 0)

    local BarFill = Instance.new("Frame")
    BarFill.Parent = BarBackground
    BarFill.BackgroundColor3 = Color3.new(0, 1, 0)
    BarFill.Size = UDim2.new(0, 0, 1, 0)

    local Thumb = Instance.new("TextButton")
    Thumb.Parent = BarBackground
    Thumb.BackgroundColor3 = Color3.new(1,1,1)
    Thumb.BorderColor3 = Color3.new(0,1,0)
    Thumb.Size = UDim2.new(0, 20, 0, 20)
    Thumb.Position = UDim2.new(0, -10, 0.5, -10)
    Thumb.Text = ""

    local UICornerBar = Instance.new("UICorner")
    UICornerBar.CornerRadius = UDim.new(1, 0)
    UICornerBar.Parent = BarBackground
    UICornerBar.Parent = BarFill
    UICornerBar.Parent = Thumb

    -- LOGICA DO SLIDER
    local Dragging = false

    Thumb.MouseButton1Down:Connect(function() Dragging = true end)
    UserInputService.MouseButton1Up:Connect(function() Dragging = false end)

    UserInputService.InputChanged:Connect(function(Input)
        if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
            local Pos = Input.Position.X - BarBackground.AbsolutePosition.X
            local Percent = math.clamp(Pos / BarBackground.AbsoluteSize.X, 0, 1)
            
            _G.FOV_Value = math.floor(Percent * 360)
            ValueText.Text = _G.FOV_Value
            BarFill.Size = UDim2.new(Percent, 0, 1, 0)
            Thumb.Position = UDim2.new(Percent, -10, 0.5, -10)
        end
    end)
end

-- ==============================================
-- // CRIAR OPÇÕES
-- ==============================================
CreateToggle("AIMBOT", "Aimbot")
CreateToggle("ESP LINE", "ESP_Line")
CreateToggle("ESP CAIXA", "ESP_Box")
CreateToggle("ESP ESQUELETO", "ESP_Skeleton")
CreateToggle("EXIBIR FOV", "ShowFOV")
CreateSlider()

-- ==============================================
-- // ABRIR E FECHAR MENU
-- ==============================================
ButtonMG.MouseButton1Click:Connect(function()
    MainMenu.Visible = not MainMenu.Visible
end)

BtnMin.MouseButton1Click:Connect(function()
    MainMenu.Visible = false
end)

BtnClose.MouseButton1Click:Connect(function()
    MainMenu.Visible = false
end)

-- ==============================================
-- // CIRCULO FOV NA TELA
-- ==============================================
FOVCircle = Instance.new("Frame")
FOVCircle.Name = "FOVCircle"
FOVCircle.Parent = ScreenGui
FOVCircle.BackgroundTransparency = 1
FOVCircle.Position = UDim2.new(0.5, -180, 0.5, -180)
FOVCircle.Size = UDim2.new(0, 360, 0, 360)
FOVCircle.Visible = false

local CircleOutline = Instance.new("ImageLabel")
CircleOutline.Parent = FOVCircle
CircleOutline.BackgroundTransparency = 1
CircleOutline.Size = UDim2.new(1, 0, 1, 0)
CircleOutline.Image = "rbxassetid://266543007"
CircleOutline.ImageColor3 = Color3.new(0, 1, 0)
CircleOutline.ScaleType = Enum.ScaleType.Fit

-- ==============================================
-- // LOGICA PRINCIPAL
-- ==============================================
RunService.RenderStepped:Connect(function()
    -- ATUALIZAR CIRCULO FOV
    if _G.ShowFOV and _G.FOV_Value > 0 then
        FOVCircle.Visible = true
        local Size = _G.FOV_Value * 1.5
        FOVCircle.Size = UDim2.new(0, Size, 0, Size)
        FOVCircle.Position = UDim2.new(0.5, -Size/2, 0.5, -Size/2)
    else
        FOVCircle.Visible = false
    end

    -- AIMBOT
    if _G.Aimbot then
        local Closest = nil
        local Dist = math.huge
        local MyPos = Player.Character and Player.Character.HumanoidRootPart and Player.Character.HumanoidRootPart.Position or Vector3.new()

        for _, v in pairs(Players:GetPlayers()) do
            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health > 0 then
                local HeadPos = v.Character.Head.Position
                local ScreenPos, OnScreen = Camera:WorldToViewportPoint(HeadPos)
                
                if OnScreen then
                    local Distancia = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Vector2.new(0.5, 0.5)).Magnitude
                    local MaxDist = (_G.FOV_Value / 360) * 0.5 

                    if Distancia < MaxDist then
                        local RealDist = (HeadPos - MyPos).Magnitude
                        if RealDist < Dist then
                            Dist = RealDist
                            Closest = v
                        end
                    end
                end
            end
        end

        if Closest then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, Closest.Character.Head.Position), 0.15)
        end
    end
end)

-- // ESP
RunService.Heartbeat:Connect(function()
    -- Limpar antigos
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj.Name == "MG_ESP" then obj:Destroy() end
    end

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local HRP = v.Character.HumanoidRootPart

            -- LINHA
            if _G.ESP_Line then
                local Line = Instance.new("Part")
                Line.Name = "MG_ESP"
                Line.Anchored = true
                Line.CanCollide = false
                Line.Transparency = 0.7
                Line.Color = Color3.new(0,1,0)
                Line.Material = Enum.Material.Neon
                Line.Size = Vector3.new(0.1, 0.1, (HRP.Position - Camera.CFrame.Position).Magnitude)
                Line.CFrame = CFrame.new(Camera.CFrame
            
