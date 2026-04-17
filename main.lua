-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Camera = Workspace.CurrentCamera

-- ATUALIZA QUANDO MORRE / RESPAWNA
Player.CharacterAdded:Connect(function(char)
    Character = char
end)

-- CRIAR GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MGCheats"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- BOTÃO MG VERMELHO NEON
local BtnMG = Instance.new("TextButton")
BtnMG.Name = "BtnMG"
BtnMG.Parent = ScreenGui
BtnMG.BackgroundColor3 = Color3.new(0, 0, 0)
BtnMG.BackgroundTransparency = 0.1
BtnMG.BorderSizePixel = 2
BtnMG.BorderColor3 = Color3.new(1, 0, 0)
BtnMG.Size = UDim2.new(0, 70, 0, 70)
BtnMG.Position = UDim2.new(0, 20, 0.5, 0)
BtnMG.Font = Enum.Font.GothamBlack
BtnMG.Text = "MG"
BtnMG.TextColor3 = Color3.new(1, 0, 0)
BtnMG.TextSize = 28

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(1, 0)
UICornerBtn.Parent = BtnMG

-- MENU PRINCIPAL
local Menu = Instance.new("Frame")
Menu.Name = "MenuPrincipal"
Menu.Parent = ScreenGui
Menu.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
Menu.BorderSizePixel = 2
Menu.BorderColor3 = Color3.new(1, 0, 0)
Menu.Size = UDim2.new(0, 300, 0, 400)
Menu.Position = UDim2.new(0, 100, 0.5, -200)
Menu.Visible = false

local UICornerMenu = Instance.new("UICorner")
UICornerMenu.CornerRadius = UDim.new(0, 12)
UICornerMenu.Parent = Menu

-- TITULO
local Titulo = Instance.new("TextLabel")
Titulo.Parent = Menu
Titulo.BackgroundTransparency = 1
Titulo.Size = UDim2.new(1, 0, 0, 40)
Titulo.Font = Enum.Font.GothamBlack
Titulo.Text = "✭ MG CHEATS ✭"
Titulo.TextColor3 = Color3.new(1, 0, 0)
Titulo.TextSize = 24

-- FUNÇÃO CRIAR BOTÃO
local Y = 50
local function AddButton(nome, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, Y)
    btn.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.new(1, 0, 0)
    btn.Text = nome
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = Menu
    
    local estado = false
    btn.MouseButton1Click:Connect(function()
        estado = not estado
        btn.BackgroundColor3 = estado and Color3.new(1, 0, 0) or Color3.new(0.1, 0.1, 0.1)
        func(estado)
    end)
    
    Y = Y + 50
    return btn
end

-- ESTADOS
local AIMBOT_ON = false
local FARM_ON = false
local PEGAR_ARMA_ON = false
local ESP_INOCENTE_ON = false
local ESP_MURDER_ON = false
local ESP_XERIFE_ON = false

-- DETECTAR FUNÇÃO
local function GetRole(plr)
    if not plr.Character then return "Inocente" end
    
    local items = {}
    
    if plr.Backpack then
        for _, v in pairs(plr.Backpack:GetChildren()) do
            table.insert(items, v)
        end
    end
    
    if plr.Character then
        for _, v in pairs(plr.Character:GetChildren()) do
            table.insert(items, v)
        end
    end

    for _, v in pairs(items) do
        if v.Name:lower():find("knife") or v.Name:lower():find("murder") then 
            return "Murder" 
        end
        if v.Name:lower():find("gun") or v.Name:lower():find("revolver") or v.Name:lower():find("sheriff") then 
            return "Sheriff" 
        end
    end

    return "Inocente"
end

-- ESP
local function ApplyESP(plr, cor)
    if plr == Player or not plr.Character then return end
    
    local hl = plr.Character:FindFirstChild("MG_ESP")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "MG_ESP"
        hl.Parent = plr.Character
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
    
    hl.FillColor = cor
    hl.OutlineColor = cor
    hl.Enabled = true
end

-- ADICIONAR OPÇÕES
AddButton("AIMBOT MURDER", function(v) AIMBOT_ON = v end)
AddButton("AUTO FARM", function(v) FARM_ON = v end)
AddButton("PEGAR ARMA", function(v) PEGAR_ARMA_ON = v end)
AddButton("ESP INOCENTE [VERDE]", function(v) ESP_INOCENTE_ON = v end)
AddButton("ESP MURDER [VERMELHO]", function(v) ESP_MURDER_ON = v end)
AddButton("ESP XERIFE [AZUL]", function(v) ESP_XERIFE_ON = v end)

-- RODAPÉ
local Rodape = Instance.new("TextLabel")
Rodape.Parent = Menu
Rodape.BackgroundTransparency = 1
Rodape.Size = UDim2.new(1, 0, 0, 30)
Rodape.Position = UDim2.new(0, 0, 1, -30)
Rodape.Font = Enum.Font.GothamBold
Rodape.Text = "TikTok: @Phzonn_mg9"
Rodape.TextColor3 = Color3.new(1, 0, 0)
Rodape.TextSize = 14

-- ARRASTAR
local function EnableDrag(obj)
    local dragging = false
    local startPos, startMouse = nil, nil

    obj.MouseButton1Down:Connect(function()
        dragging = true
        startMouse = UserInputService:GetMouseLocation()
        startPos = obj.Position
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = UserInputService:GetMouseLocation() - startMouse
            obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

EnableDrag(Menu)
EnableDrag(BtnMG)

BtnMG.MouseButton1Click:Connect(function()
    Menu.Visible = not Menu.Visible
end)

-- LOOPS
RunService.RenderStepped:Connect(function()
    -- ESP
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Character then
            local role = GetRole(plr)
            
            if role == "Murder" and ESP_MURDER_ON then
                ApplyESP(plr, Color3.new(1,0,0))
            elseif role == "Sheriff" and ESP_XERIFE_ON then
                ApplyESP(plr, Color3.new(0,0.5,1))
            elseif role == "Inocente" and ESP_INOCENTE_ON then
                ApplyESP(plr, Color3.new(0,1,0))
            elseif plr.Character:FindFirstChild("MG_ESP") then
                plr.Character.MG_ESP:Destroy()
            end
        end
    end
    
    -- AIMBOT
    if AIMBOT_ON then
        local target = nil
        local dist = math.huge
        
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character and plr.Character:FindFirstChild("Head") then
                if GetRole(plr) == "Murder" then
                    local mag = (Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                    if mag < dist then
                        dist = mag
                        target = plr
                    end
                end
            end
        end
        
        if target and target.Character.Head then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- AUTO FARM (OTIMIZADO)
RunService.Heartbeat:Connect(function()
    if FARM_ON and Character and Character:FindFirstChild("HumanoidRootPart") then
        local hrp = Character.HumanoidRootPart
        
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("BasePart") then
                if v.Name:lower():find("coin") or v.Name:lower():find("box") then
                    if (hrp.Position - v.Position).Magnitude < 15 then
                        local oldPos = hrp.CFrame
                        hrp.CFrame = CFrame.new(v.Position + Vector3.new(0,1,0))
                        task.wait(0.1)
                        hrp.CFrame = oldPos
                    end
                end
            end
        end
    end
end)

-- PEGAR ARMA
RunService.Heartbeat:Connect(function()
    if PEGAR_ARMA_ON and Character and Character:FindFirstChild("HumanoidRootPart") then
        local hrp = Character.HumanoidRootPart
        local posInicial = hrp.Position
        
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("Tool") and v.Parent == Workspace then
                if v.Name:lower():find("gun") then
                    if (hrp.Position - v.Position).Magnitude < 50 then
                        hrp.CFrame = CFrame.new(v.Position)
                        task.wait(0.2)
                        v.Parent = Player.Backpack
                        hrp.CFrame = CFrame.new(posInicial)
                    end
                end
            end
        end
    end
end)

print("✅ MG CHEATS - VERSÃO FINAL CORRIGIDA")
