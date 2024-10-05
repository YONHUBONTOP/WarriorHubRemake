local Warrior = {
    Tabs = {}
}

local UserInputService = game:GetService("UserInputService")

local WarriorGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Tab = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Elements = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Tabs = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")

WarriorGui.Name = "Warrior"
WarriorGui.Parent = gethui() or game:GetService("CoreGui")

Frame.Parent = WarriorGui
Frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.307, 0, 0.188, 0)
Frame.Size = UDim2.new(0, 500, 0, 400)

Tab.Parent = Frame
Tab.BackgroundColor3 = Color3.fromRGB(27, 255, 15)
Tab.Size = UDim2.new(0, 500, 0, 30)

TextLabel.Parent = Tab
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0, 71, 0, 30)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Warrior"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 20

Elements.Name = "Elements"
Elements.Parent = Frame
Elements.Active = true
Elements.BackgroundTransparency = 1
Elements.Position = UDim2.new(0.274, 0, 0.073, 0)
Elements.Size = UDim2.new(0, 362, 0, 370)

UIListLayout.Parent = Elements
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Tabs.Name = "Tabs"
Tabs.Parent = Frame
Tabs.Active = true
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 0, 0.073, 0)
Tabs.Size = UDim2.new(0, 139, 0, 370)

UIListLayout_2.Parent = Tabs
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

function Warrior:NewToggle(name, default, callback)
    local ToggleUI = Instance.new("Frame")
    ToggleUI.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    ToggleUI.Size = UDim2.new(0, 243, 0, 38)
    
    local TextLabel_Toggle = Instance.new("TextLabel")
    TextLabel_Toggle.Parent = ToggleUI
    TextLabel_Toggle.BackgroundTransparency = 1
    TextLabel_Toggle.Size = UDim2.new(0, 139, 0, 32)
    TextLabel_Toggle.Font = Enum.Font.Gotham
    TextLabel_Toggle.Text = name
    TextLabel_Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_Toggle.TextScaled = true
    
    local TextButton_Toggle = Instance.new("TextButton")
    TextButton_Toggle.Parent = ToggleUI
    TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    TextButton_Toggle.Position = UDim2.new(0.768, 0, 0.210, 0)
    TextButton_Toggle.Size = UDim2.new(0, 47, 0, 21)
    
    local Frame_Toggle = Instance.new("Frame")
    Frame_Toggle.Parent = TextButton_Toggle
    Frame_Toggle.BackgroundColor3 = default and Color3.fromRGB(85, 255, 127) or Color3.fromRGB(255, 6, 31)
    Frame_Toggle.Size = UDim2.new(0, 28, 0, 21)

    ToggleUI.Parent = Elements
    
    local currentValue = default
    callback(currentValue)

    TextButton_Toggle.MouseButton1Click:Connect(function()
        currentValue = not currentValue
        Frame_Toggle.BackgroundColor3 = currentValue and Color3.fromRGB(85, 255, 127) or Color3.fromRGB(255, 6, 31)
        callback(currentValue)
    end)
end

function Warrior:NewDropdown(name, options, default, callback)
    local DropdownUI = Instance.new("Frame")
    DropdownUI.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    DropdownUI.Size = UDim2.new(0, 324, 0, 47)

    local TextLabel_Dropdown = Instance.new("TextLabel")
    TextLabel_Dropdown.Parent = DropdownUI
    TextLabel_Dropdown.BackgroundTransparency = 1
    TextLabel_Dropdown.Size = UDim2.new(0, 139, 0, 38)
    TextLabel_Dropdown.Font = Enum.Font.Gotham
    TextLabel_Dropdown.Text = name
    TextLabel_Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_Dropdown.TextScaled = true

    local TextButton_Dropdown = Instance.new("TextButton")
    TextButton_Dropdown.Parent = DropdownUI
    TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    TextButton_Dropdown.Position = UDim2.new(0.549, 0, 0.157, 0)
    TextButton_Dropdown.Size = UDim2.new(0, 129, 0, 26)
    TextButton_Dropdown.Text = default

    DropdownUI.Parent = Elements

    local currentIndex = table.find(options, default) or 1
    callback(options[currentIndex])

    TextButton_Dropdown.MouseButton1Click:Connect(function()
        currentIndex = currentIndex % #options + 1
        TextButton_Dropdown.Text = options[currentIndex]
        callback(options[currentIndex])
    end)
end

function Warrior:NewSlider(name, min, max, default, callback)
    local SliderUI = Instance.new("Frame")
    SliderUI.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    SliderUI.Size = UDim2.new(0, 324, 0, 38)

    local TextLabel_Slider = Instance.new("TextLabel")
    TextLabel_Slider.Parent = SliderUI
    TextLabel_Slider.BackgroundTransparency = 1
    TextLabel_Slider.Size = UDim2.new(0, 153, 0, 38)
    TextLabel_Slider.Font = Enum.Font.Gotham
    TextLabel_Slider.Text = name
    TextLabel_Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_Slider.TextScaled = true

    local Frame_Slider = Instance.new("Frame")
    Frame_Slider.Parent = SliderUI
    Frame_Slider.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    Frame_Slider.Position = UDim2.new(0.515, 0, 0.210, 0)
    Frame_Slider.Size = UDim2.new(0, 138, 0, 21)

    local Frame_SliderIndicator = Instance.new("Frame")
    Frame_SliderIndicator.Parent = Frame_Slider
    Frame_SliderIndicator.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
    Frame_SliderIndicator.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)

    SliderUI.Parent = Elements

    callback(default)

    local dragging = false

    Frame_Slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percentage = math.clamp((input.Position.X - Frame_Slider.AbsolutePosition.X) / Frame_Slider.AbsoluteSize.X, 0, 1)
            local value = math.floor(min + (max - min) * percentage)
            Frame_SliderIndicator.Size = UDim2.new(percentage, 0, 1, 0)
            callback(value)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

function Warrior:NewTab(name)
    local tab = {}

    tab.Button = Instance.new("TextButton")
    tab.Button.Parent = Tabs
    tab.Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tab.Button.BackgroundTransparency = 1
    tab.Button.Size = UDim2.new(0, 108, 0, 32)
    tab.Button.Font = Enum.Font.Gotham
    tab.Button.Text = name
    tab.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Button.TextScaled = true

    tab.Elements = {}

    tab.Button.MouseButton1Click:Connect(function()
        for index, value in Elements:GetChildren() do
            if value:IsA("UIListLayout") then continue end
            value.Parent = nil
        end
        
        for index, value in tab.Elements do
            value.Parent = Elements
        end
    end)

    Warrior.Tabs[name] = tab
    return tab
end

do
	local gui = WarriorGui.Frame

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

return Warrior
