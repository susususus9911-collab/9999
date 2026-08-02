-- ================================================
-- โฃ๏ธ ALL MENU BY KRAN (RGB Dynamic Border & Carbon Fiber BG Edition)
-- ๐’ Key System + WindUI + Fast Bright RGB Gradient Loop
-- ================================================


local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera


local ParentGui = (CoreGui:FindFirstChild("RobloxGui") and CoreGui) or PlayerGui


-- ------------------------------------------------
-- ๐จ 1. เธ•เธฑเนเธเธเนเธฒเธฃเธฐเธเธเนเธ RGB (เน€เธฃเธดเนเธกเธ•เนเธเธงเธดเนเธเธงเธเน€เธฃเนเธงเธ—เธฑเธเธ—เธต + เธชเธตเธชเธ”เธชเธงเนเธฒเธ)
-- ------------------------------------------------
local RGB_Config = {
    Speed = 6,          -- เธเธงเธฒเธกเน€เธฃเนเธงเน€เธฃเธดเนเธกเธ•เนเธ (เธงเธดเนเธเน€เธฃเนเธงเธ•เธฑเนเธเนเธ•เนเธเธ”เธฃเธฑเธเนเธฃเธเน)
    Size = 3,           -- เธเธงเธฒเธกเธซเธเธฒเน€เธชเนเธเธเธญเธ
    Mode = "Rainbow"    -- เนเธซเธกเธ”เธชเธต: "Rainbow", "Orange", "Green", "Cyan", "Red", "Purple", "Gold", "Pink", "IceBlue", "White"
}


-- เธเธฑเธเธเนเธเธฑเนเธเธชเธฃเนเธฒเธ Gradient เธชเธงเนเธฒเธเธเธฑเธ”เน€เธเธเนเธเธเธงเธดเนเธเธงเธเธซเธกเธธเธเธฃเธญเธ
local function UpdateGradientColors(gradient, offset)
    local mode = RGB_Config.Mode
    
    if mode == "Rainbow" then
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHSV((offset) % 1, 1, 1)),
            ColorSequenceKeypoint.new(0.25, Color3.fromHSV((offset + 0.25) % 1, 1, 1)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV((offset + 0.5) % 1, 1, 1)),
            ColorSequenceKeypoint.new(0.75, Color3.fromHSV((offset + 0.75) % 1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV((offset + 1) % 1, 1, 1))
        })
    else
        local baseColor = Color3.fromRGB(255, 255, 255)
        if mode == "Orange" then baseColor = Color3.fromRGB(255, 130, 0)
        elseif mode == "Green" then baseColor = Color3.fromRGB(0, 255, 120)
        elseif mode == "Cyan" then baseColor = Color3.fromRGB(0, 220, 255)
        elseif mode == "Red" then baseColor = Color3.fromRGB(255, 40, 40)
        elseif mode == "Purple" then baseColor = Color3.fromRGB(180, 50, 255)
        elseif mode == "Gold" then baseColor = Color3.fromRGB(255, 215, 0)
        elseif mode == "Pink" then baseColor = Color3.fromRGB(255, 20, 147)
        elseif mode == "IceBlue" then baseColor = Color3.fromRGB(135, 206, 250)
        elseif mode == "White" then baseColor = Color3.fromRGB(240, 240, 255)
        end
        
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, baseColor),
            ColorSequenceKeypoint.new(0.3, Color3.fromRGB(20, 20, 28)),
            ColorSequenceKeypoint.new(0.7, Color3.fromRGB(20, 20, 28)),
            ColorSequenceKeypoint.new(1, baseColor)
        })
    end
end


-- ------------------------------------------------
-- ๐” 2. เธฃเธฐเธเธเน€เธชเธตเธขเธเธเธ”เธเธธเนเธกเธเธตเธขเนเธเธญเธฃเนเธ”
-- ------------------------------------------------
if SoundService:FindFirstChild("KranClickSound") then
    SoundService.KranClickSound:Destroy()
end


local ClickSound = Instance.new("Sound")
ClickSound.Name = "KranClickSound"
ClickSound.SoundId = "rbxassetid://6895079853"
ClickSound.Volume = 1
ClickSound.Parent = SoundService


local function PlayClickSound()
    task.spawn(function()
        ClickSound:Play()
    end)
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if gameProcessed then
            PlayClickSound()
        end
    end
end)


local function PlaySoundOnButton(btn)
    if (btn:IsA("TextButton") or btn:IsA("ImageButton")) and not btn:GetAttribute("SoundHooked") then
        btn:SetAttribute("SoundHooked", true)
        btn.MouseButton1Click:Connect(PlayClickSound)
    end
end


local function HookContainerSound(container)
    if not container then return end
    for _, desc in pairs(container:GetDescendants()) do
        PlaySoundOnButton(desc)
    end
    container.DescendantAdded:Connect(PlaySoundOnButton)
end


HookContainerSound(ParentGui)


-- ------------------------------------------------
-- ๐–ผ๏ธ เธฃเธฐเธเธเธ”เธฑเธเธเธฑเธเธเธฃเธญเธ UI เธซเธฅเธฑเธ + เนเธชเนเนเธเธเธญเธ RGB & เธฅเธฒเธข Carbon
-- ------------------------------------------------
local function ApplyCarbonAndStrokeToUI()
    for _, gui in pairs(ParentGui:GetChildren()) do
        if gui:IsA("ScreenGui") and (gui.Name:find("WindUI") or gui.Name:find("Wind") or gui:FindFirstChild("Main") or gui:FindFirstChild("Canvas")) then
            for _, frame in pairs(gui:GetDescendants()) do
                if frame:IsA("Frame") and frame.AbsoluteSize.X > 250 and frame.AbsoluteSize.Y > 200 then
                    frame.ClipsDescendants = true
                    
                    -- เธเธทเนเธเธซเธฅเธฑเธ Carbon Fiber
                    if not frame:FindFirstChild("KranCarbonBG") then
                        local carbonBG = Instance.new("ImageLabel")
                        carbonBG.Name = "KranCarbonBG"
                        carbonBG.Size = UDim2.new(1, 0, 1, 0)
                        carbonBG.Position = UDim2.new(0, 0, 0, 0)
                        carbonBG.BackgroundTransparency = 1
                        carbonBG.Image = "rbxassetid://13110363236" 
                        carbonBG.ScaleType = Enum.ScaleType.Crop
                        carbonBG.ImageTransparency = 0.45
                        carbonBG.ZIndex = 0
                        carbonBG.Parent = frame
                    end


                    -- เธเธฃเธญเธเนเธ RGB
                    local mainStroke = frame:FindFirstChild("KranMainStroke")
                    if not mainStroke then
                        mainStroke = Instance.new("UIStroke")
                        mainStroke.Name = "KranMainStroke"
                        mainStroke.Thickness = RGB_Config.Size
                        mainStroke.Color = Color3.fromRGB(255, 255, 255)
                        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        mainStroke.Parent = frame
                        
                        local mainGrad = Instance.new("UIGradient")
                        mainGrad.Name = "KranMainGradient"
                        mainGrad.Parent = mainStroke
                    end
                end
            end
        end
    end
end


-- ------------------------------------------------
-- โฃ๏ธ 3. เธเธธเนเธกเธฅเธญเธขเธ—เธฃเธเธเธฅเธก (เธเธธเนเธก โฃ๏ธ) + RGB Gradient Border
-- ------------------------------------------------
if ParentGui:FindFirstChild("KranToggleGui") then
    ParentGui.KranToggleGui:Destroy()
end


local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "KranToggleGui"
ToggleGui.Parent = ParentGui


local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = ToggleGui
ToggleBtn.Size = UDim2.fromOffset(50, 50)
ToggleBtn.Position = UDim2.new(0, 15, 0.4, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
ToggleBtn.Text = "โฃ๏ธ"
ToggleBtn.TextSize = 24
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Active = true
ToggleBtn.Draggable = true


local UICornerToggle = Instance.new("UICorner")
UICornerToggle.CornerRadius = UDim.new(1, 0)
UICornerToggle.Parent = ToggleBtn


local UIStrokeToggle = Instance.new("UIStroke")
UIStrokeToggle.Name = "UIStrokeToggle"
UIStrokeToggle.Thickness = RGB_Config.Size
UIStrokeToggle.Color = Color3.fromRGB(255, 255, 255)
UIStrokeToggle.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStrokeToggle.Parent = ToggleBtn


local ToggleGradient = Instance.new("UIGradient")
ToggleGradient.Name = "ToggleGradient"
ToggleGradient.Parent = UIStrokeToggle


HookContainerSound(ToggleGui)


-- ------------------------------------------------
-- ๐“ฆ 4. เธซเธเนเธฒเธ•เนเธฒเธเน€เธกเธเธน ESP เธเนเธฒเธเธเธญ + RGB Gradient Border
-- ------------------------------------------------
if ParentGui:FindFirstChild("KranEspMenuFrame") then
    ParentGui.KranEspMenuFrame:Destroy()
end


local EspScreenGui = Instance.new("ScreenGui")
EspScreenGui.Name = "KranEspMenuFrame"
EspScreenGui.Parent = ParentGui
EspScreenGui.Enabled = false


local EspMainFrame = Instance.new("Frame")
EspMainFrame.Name = "EspMainFrame"
EspMainFrame.Parent = EspScreenGui
EspMainFrame.Size = UDim2.fromOffset(230, 310)
EspMainFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
EspMainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
EspMainFrame.Active = true
EspMainFrame.Draggable = true


local EspCorner = Instance.new("UICorner")
EspCorner.CornerRadius = UDim.new(0, 22)
EspCorner.Parent = EspMainFrame


local EspUIStroke = Instance.new("UIStroke")
EspUIStroke.Name = "EspUIStroke"
EspUIStroke.Thickness = RGB_Config.Size
EspUIStroke.Color = Color3.fromRGB(255, 255, 255)
EspUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
EspUIStroke.Parent = EspMainFrame


local EspGradient = Instance.new("UIGradient")
EspGradient.Name = "EspGradient"
EspGradient.Parent = EspUIStroke


local EspTitle = Instance.new("TextLabel")
EspTitle.Parent = EspMainFrame
EspTitle.Size = UDim2.new(1, 0, 0, 38)
EspTitle.Text = "โจ RGB ESP MENU โจ"
EspTitle.TextColor3 = Color3.fromRGB(242, 242, 245)
EspTitle.TextSize = 12
EspTitle.Font = Enum.Font.GothamBold
EspTitle.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
EspTitle.BorderSizePixel = 0


local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 22)
TitleCorner.Parent = EspTitle


local Box_Enabled = false
local Highlight_Enabled = false
local Tracers_Enabled = false
local Hitbox_Enabled = false
local ESP_Objects = {}


local function CreateEspButton(text, pos, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = EspMainFrame
    Btn.Size = UDim2.new(0.9, 0, 0, 32)
    Btn.Position = pos
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 11
    Btn.Font = Enum.Font.GothamMedium


    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = Btn


    Btn.MouseButton1Click:Connect(function() callback(Btn) end)
    return Btn
end


CreateEspButton("๐“ฆ เธเธฃเธญเธ 2D Box: OFF ๐”ด", UDim2.new(0.05, 0, 0.16, 0), function(btn)
    Box_Enabled = not Box_Enabled
    btn.Text = Box_Enabled and "๐“ฆ เธเธฃเธญเธ 2D Box: ON ๐ข" or "๐“ฆ เธเธฃเธญเธ 2D Box: OFF ๐”ด"
end)


CreateEspButton("โจ Highlight เน€เธฃเธทเธญเธเนเธชเธ: OFF ๐”ด", UDim2.new(0.05, 0, 0.29, 0), function(btn)
    Highlight_Enabled = not Highlight_Enabled
    btn.Text = Highlight_Enabled and "โจ Highlight เน€เธฃเธทเธญเธเนเธชเธ: ON ๐ข" or "โจ Highlight เน€เธฃเธทเธญเธเนเธชเธ: OFF ๐”ด"
end)


CreateEspButton("๐ เน€เธชเนเธเธชเธตเธฃเธธเนเธ Tracers: OFF ๐”ด", UDim2.new(0.05, 0, 0.42, 0), function(btn)
    Tracers_Enabled = not Tracers_Enabled
    btn.Text = Tracers_Enabled and "๐ เน€เธชเนเธเธชเธตเธฃเธธเนเธ Tracers: ON ๐ข" or "๐ เน€เธชเนเธเธชเธตเธฃเธธเนเธ Tracers: OFF ๐”ด"
end)


CreateEspButton("๐ฏ Hitbox เนเธซเธเนเธเธถเนเธ: OFF ๐”ด", UDim2.new(0.05, 0, 0.55, 0), function(btn)
    Hitbox_Enabled = not Hitbox_Enabled
    btn.Text = Hitbox_Enabled and "๐ฏ Hitbox เนเธซเธเนเธเธถเนเธ: ON ๐ข" or "๐ฏ Hitbox เนเธซเธเนเธเธถเนเธ: OFF ๐”ด"
end)


CreateEspButton("โ เธเนเธญเธเน€เธกเธเธน ESP เธเธตเน", UDim2.new(0.05, 0, 0.82, 0), function()
    EspScreenGui.Enabled = false
end)


HookContainerSound(EspScreenGui)


-- ------------------------------------------------
-- ๐€ 5. เนเธซเธฅเธ” WindUI + เธฃเธฐเธเธ Key (เนเธเนเธฅเธดเธเธเน Linkvertise เธเธญเธเธเนเธญเธ)
-- ------------------------------------------------
local WindUI = nil


local success, _ = pcall(function()
    WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)


if not success or not WindUI then
    pcall(function()
        WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    end)
end


if not WindUI then
    warn("โ เนเธกเนเธชเธฒเธกเธฒเธฃเธ–เนเธซเธฅเธ” WindUI เนเธ”เน!")
    return
end


-- ๐”‘ เธฅเธดเธเธเน Linkvertise เธเธญเธเธเนเธญเธ (เนเธกเนเน€เธเธฅเธขเธฃเธซเธฑเธชเธเนเธฒเธเนเธ Note เนเธฅเนเธง)
local KEY_LINK = "https://direct-link.net/8028530/zKIyozURubdX" 


local Window = WindUI:CreateWindow({
    Title = "all menu By Kran",
    Icon = "crown",
    Author = "By Kran",
    Folder = "KranMenuConfig",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "", 
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked profile")
        end
    },
    KeySystem = {
        Key = { "006700", "๐คก" },
        Note = "๐”‘ เธเธฃเธธเธ“เธฒเธเธ”เธเธธเนเธก Get Key เธ”เนเธฒเธเธฅเนเธฒเธเน€เธเธทเนเธญเธฃเธฑเธเธฃเธซเธฑเธชเธเนเธฒเธเธเนเธฒเธเธฅเธดเธเธเนเนเธกเนเธเนเธ–เธฒเธกเธเธนเนเธชเธฃเนเธฒเธ", -- เนเธกเนเธเธฃเนเธเธเธเธดเธ”เนเธกเนเนเธซเนเน€เธซเนเธเธฃเธซเธฑเธชเธ•เธฃเธเธเธตเนเนเธฅเนเธง
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Key System By Kran",
        },
        URL = KEY_LINK,
        SaveKey = false,
    }
})


task.spawn(function()
    task.wait(0.5)
    ApplyCarbonAndStrokeToUI()
end)


pcall(function()
    local userAvatarUrl = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
    if Window.User then
        Window:User({
            Name = LocalPlayer.DisplayName,
            Title = "@" .. LocalPlayer.Name,
            Icon = userAvatarUrl
        })
    end
end)


ToggleBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if Window.Toggle then
            Window:Toggle()
        else
            Window:Minimize()
        end
    end)
end)


ParentGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") then
        HookContainerSound(child)
        task.wait(0.2)
        ApplyCarbonAndStrokeToUI()
    end
end)


-- ------------------------------------------------
-- ๐“‘ 6. เธชเธฃเนเธฒเธเนเธ—เนเธเน€เธกเธเธน (WindUI Tabs)
-- ------------------------------------------------
local Tabs = {
    Profile      = Window:Tab({ Title = "เนเธเธฃเนเธเธฅเน VIP", Icon = "contact" }),
    Main         = Window:Tab({ Title = "เธเธตเน€เธเธญเธฃเนเธซเธฅเธฑเธ", Icon = "code" }),
    Player       = Window:Tab({ Title = "เธ•เธฑเธงเธฅเธฐเธเธฃ & เน€เธเธฅเธทเนเธญเธเธ—เธตเน", Icon = "user" }),
    AllUniversal = Window:Tab({ Title = "เธฅเนเธญเธเน€เธเนเธฒ & ESP", Icon = "layers" }),
    Visuals      = Window:Tab({ Title = "เธงเธดเธเธงเธฅเธเธฒเธฃเน€เธฅเนเธ", Icon = "eye" }),
    AllGames     = Window:Tab({ Title = "เธฃเธงเธกเนเธกเธเธฎเธดเธ•", Icon = "gamepad-2" }),
    Settings     = Window:Tab({ Title = "เธ•เธฑเนเธเธเนเธฒเธฃเธฐเธเธ", Icon = "settings" })
}


-- ๐“ เนเธ—เนเธ 1: เนเธเธฃเนเธเธฅเน VIP
Tabs.Profile:Section({ Title = "๐‘‘ เธเนเธญเธกเธนเธฅเธเธนเนเนเธเนเธเธฒเธ" })
Tabs.Profile:Paragraph({
    Title = "๐”ฅ เธเธนเนเนเธเน: " .. LocalPlayer.DisplayName,
    Desc = "๐“ Username: @" .. LocalPlayer.Name ..
           "\n๐” User ID: " .. LocalPlayer.UserId .. 
           "\n๐“… เธญเธฒเธขเธธเธเธฑเธเธเธต: " .. LocalPlayer.AccountAge .. " เธงเธฑเธ"
})


Tabs.Profile:Button({
    Title = "๐“ เธเธฑเธ”เธฅเธญเธ User ID",
    Callback = function() setclipboard(tostring(LocalPlayer.UserId)) end
})


-- ๐“ เนเธ—เนเธ 2: เธเธตเน€เธเธญเธฃเนเธซเธฅเธฑเธ
Tabs.Main:Section({ Title = "๐‘‘ เธชเธเธฃเธดเธเธ•เนเธซเธฅเธฑเธ" })


Tabs.Main:Button({
    Title = "๐”ฅ Tora Isme Hub [BETA]",
    Desc = "เธฃเธฑเธเธชเธเธฃเธดเธเธ•เน Tora Isme Hub (เธชเธเธฃเธดเธเธ•เนเนเธซเธกเนเธฅเนเธฒเธชเธธเธ”)",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/boplsme/Scripts-/refs/heads/main/%5BBETA%5D%20Tora%20Isme%20Hub.txt"))() end
})


Tabs.Main:Button({
    Title = "๐‘‘ Main GUI 2 (Wack Shop)",
    Desc = "เธฃเธฑเธเธชเธเธฃเธดเธเธ•เน Main GUI 2",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wackshopr-tech/script-roblox-all/refs/heads/main/Main-GUI-2.lua", true))() end
})


Tabs.Main:Button({
    Title = "๐‘‘ เธฃเธฑเธเธชเธเธฃเธดเธเธ•เน VIP (RVX V2)",
    Desc = "เน€เธเธดเธ”เนเธเนเธเธฒเธเธชเธเธฃเธดเธเธ•เนเธซเธฅเธฑเธ RVX V2",
    Callback = function() loadstring(game:HttpGet("https://rvxv2-production-c788.up.railway.app/vip", true))() end
})


Tabs.Main:Button({
    Title = "๐ ๏ธ เธชเธเธฃเธดเธเธ•เนเนเธเนเนเธเธฃเธฐเธเธ (Correct)",
    Desc = "เธฃเธฑเธเธชเธเธฃเธดเธเธ•เนเนเธเนเนเธเธเธฒเธ Wack Shop",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wackshopr-tech/script-roblox-all/refs/heads/main/SCRIPT-ALL-BY-WACK-SHOP/correct/correct.lua", true))() end
})


Tabs.Main:Button({
    Title = "๐–ฑ๏ธ OP Auto Clicker (เธญเธญเนเธ•เนเธเธฅเธดเธ)",
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-OP-autoclicker-21838"))() end
})


-- ๐“ เนเธ—เนเธ 3: เธ•เธฑเธงเธฅเธฐเธเธฃ & เน€เธเธฅเธทเนเธญเธเธ—เธตเน
Tabs.Player:Section({ Title = "๐ก๏ธ เนเธซเธกเธ”เธญเธกเธ•เธฐ & เธเนเธญเธเธเธฑเธเธ•เธฑเธง" })


local GodModeEnabled = false


Tabs.Player:Toggle({
    Title = "๐ก๏ธ เน€เธเธดเธ”เนเธเนเธเธฒเธ God Mode (เนเธซเธกเธ”เธญเธกเธ•เธฐ)",
    Desc = "เธขเธดเธเนเธกเนเธ•เธฒเธข / เธฅเนเธญเธเน€เธฅเธทเธญเธ”เน€เธ•เนเธกเธ•เธฅเธญเธ”เน€เธงเธฅเธฒ / เธเนเธญเธเธเธฑเธเธเธฒเธฃเธ•เธฒเธข",
    Value = false,
    Callback = function(Value)
        GodModeEnabled = Value
        if GodModeEnabled then
            task.spawn(function()
                while GodModeEnabled do
                    task.wait()
                    pcall(function()
                        local char = LocalPlayer.Character
                        if char then
                            local hum = char:FindFirstChildOfClass("Humanoid")
                            if hum then
                                hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                                if hum.Health < hum.MaxHealth and hum.Health > 0 then
                                    hum.Health = hum.MaxHealth
                                end
                            end
                        end
                    end)
                end
            end)
        else
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
                    end
                end
            end)
        end
    end
})


Tabs.Player:Button({
    Title = "โก God Mode Bypass (เธชเธนเธ•เธฃเธญเธกเธ•เธฐเธ–เธฒเธงเธฃ)",
    Desc = "เธชเธฅเธฑเธ Humanoid เน€เธเธทเนเธญเธชเธฃเนเธฒเธเธฃเนเธฒเธเธญเธกเธ•เธฐ (เธเธ” 1 เธเธฃเธฑเนเธ)",
    Callback = function()
        pcall(function()
            local char = LocalPlayer.Character
                            objs.Box.Visible = false
                objs.BoxOutline.Visible = false
            end


            if Tracers_Enabled then
                objs.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                objs.Tracer.To = Vector2.new(headScreen.X, legScreen.Y)
                objs.Tracer.Color = Color3.fromHSV((tick() * 0.5) % 1, 0.9, 1)
                objs.Tracer.Visible = true
            else
                objs.Tracer.Visible = false
            end
            return
        end
    end


    objs.Box.Visible = false
    objs.BoxOutline.Visible = false
    objs.Tracer.Visible = false
end


Players.PlayerRemoving:Connect(RemoveESPForPlayer)


RunService.RenderStepped:Connect(function()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            UpdateESP(v)
        end
    end
end)


pcall(function()
    WindUI:Notify({
        Title = "โฃ๏ธ ALL MENU BY KRAN",
        Content = "เนเธซเธฅเธ”เธชเธเธฃเธดเธเธ•เนเนเธ RGB เธงเธดเนเธเน€เธฃเนเธงเธเธญเธเน€เธฃเธทเธญเธเนเธชเธเน€เธฃเธตเธขเธเธฃเนเธญเธขเนเธฅเนเธง! ๐”ฅโจ",
        Duration = 3
    })
end)
