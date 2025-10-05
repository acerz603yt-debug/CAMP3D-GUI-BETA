-- Made By AcerZ

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CAMP3D_GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 8
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

local function playSound(soundId)
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundId
	sound.Parent = SoundService
	sound:Play()
	sound.Ended:Connect(function() sound:Destroy() end)
end

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "[CAMP3D GUI BETA]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.Font = Enum.Font.Fondamento
Title.TextSize = 22
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.Fondamento
MinimizeButton.TextSize = 18
MinimizeButton.Parent = MainFrame

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -20)
Watermark.Text = "[CAMP3D GUI BY 3Y3Y3Y3]"
Watermark.TextColor3 = Color3.fromRGB(180, 180, 180)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Fondamento
Watermark.TextSize = 14
Watermark.Parent = MainFrame

local buttonHeight = 35
local padding = 10
local startY = 50
local minimized = false
local elements = {}

local function createCategory(name)
	local header = Instance.new("TextLabel")
	header.Size = UDim2.new(0.9, 0, 0, 25)
	header.Position = UDim2.new(0.05, 0, 0, startY)
	header.Text = name
	header.TextColor3 = Color3.fromRGB(255, 255, 255)
	header.Font = Enum.Font.Fondamento
	header.TextSize = 18
	header.BackgroundTransparency = 1
	header.Parent = MainFrame
	table.insert(elements, header)
	startY = startY + 25 + padding
end

local function createButton(name, scriptURL)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.9, 0, 0, buttonHeight)
	btn.Position = UDim2.new(0.05, 0, 0, startY)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.Fondamento
	btn.TextSize = 16
	btn.Text = name
	btn.Parent = MainFrame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = btn

	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local glowTween = TweenService:Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(90, 90, 90)})
	local normalTween = TweenService:Create(btn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

	btn.MouseEnter:Connect(function() glowTween:Play() end)
	btn.MouseLeave:Connect(function() normalTween:Play() end)

	if scriptURL ~= "" then
		btn.MouseButton1Click:Connect(function()
			loadstring(game:HttpGet(scriptURL, true))()
		end)
	end

	table.insert(elements, btn)
	startY = startY + buttonHeight + padding
	MainFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, startY + 20)
	return btn
end

createCategory("Trolling")
createButton("C00l GUI", "https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua")
createButton("Brookhaven Script", "https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua")
createButton("System Broken", "https://rawscripts.net/raw/Universal-Script-System-broken-script-32501")
createButton("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
createButton("Click Fling", "https://rawscripts.net/raw/Universal-Script-better-click-fling-universal-52247")
createButton("Fling GUI", "https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua")

createCategory("Animations")
createButton("FE Gun R15", "https://rawscripts.net/raw/Universal-Script-FE-Gun-28741")
createButton("R6 Animations", "https://rawscripts.net/raw/Universal-Script-R6-Anim-Hub-30261")
createButton("Forsaken Animations", "https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/ForsakationHub")

createCategory("Animation")
createButton("R6 Anim Hub", "https://rawscripts.net/raw/Universal-Script-R6-animation-GUI-FE-46615")
createButton("Killer R6 Anim FE", "https://pastefy.app/riYch0rX/raw")

createCategory("Fun")
createButton("Doors Hardcore Mode", "https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/HardcoreFixed.lua")

createCategory("Advantages")
createButton("Dandy's World Script", "https://pastebin.com/raw/Y7uh3UZf")
createButton("Forsaken Script", "https://rawscripts.net/raw/NOLI-Forsaken-Op-script-Auto-Farm-and-more-49047")
createButton("Server Hop", "https://raw.githubusercontent.com/lumpiasallad/Roblox_ServerHop/refs/heads/main/ServerHopScript.lua")

createCategory("Keyed")
createButton("Forge Hub", "https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua")

MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		for _, el in pairs(elements) do el.Visible = false end
		Watermark.Visible = false
		MainFrame:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quad", 0.3, true)
		MinimizeButton.Text = "+"
	else
		for _, el in pairs(elements) do el.Visible = true end
		Watermark.Visible = true
		MainFrame:TweenSize(UDim2.new(0, 300, 0, startY + 20), "Out", "Quad", 0.3, true)
		MinimizeButton.Text = "-"
	end
	playSound("12221967")
end)

local dragging, dragInput, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

MainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

MainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then update(input) end
end)
