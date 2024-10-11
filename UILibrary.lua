local UILibrary = {}
local UserInputService = game:GetService("UserInputService")

function UILibrary:MakeDraggable(gui)
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
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

    gui.InputChanged:Connect(function(input)
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

function UILibrary:CreateWindow(title)
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Main.BorderSizePixel = 0
    Main.Size = UDim2.new(0, 500, 0, 400)

    local UICorner = Instance.new("UICorner", Main)
    UICorner.CornerRadius = UDim.new(0, 4)

    local TopBar = Instance.new("Frame", Main)
    TopBar.BackgroundColor3 = Color3.fromRGB(189, 142, 255)
    TopBar.Size = UDim2.new(1, 0, 0, 25)

    local UICorner_2 = Instance.new("UICorner", TopBar)
    UICorner_2.CornerRadius = UDim.new(0, 4)

    local TextLabel = Instance.new("TextLabel", TopBar)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, -16, 1, 0)
    TextLabel.Position = UDim2.new(0.02, 0, 0, 0)
    TextLabel.Text = title
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextSize = 14

    local Tabs = Instance.new("ScrollingFrame", Main)
    Tabs.BackgroundTransparency = 1
    Tabs.Size = UDim2.new(0, 123, 1, -25)
    Tabs.Position = UDim2.new(0, 0, 0, 25)
    Tabs.CanvasSize = UDim2.new(0, 0, 5, 0)

    local UIListLayout = Instance.new("UIListLayout", Tabs)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local Elements = Instance.new("ScrollingFrame", Main)
    Elements.BackgroundTransparency = 1
    Elements.Size = UDim2.new(0.75, 0, 1, -25)
    Elements.Position = UDim2.new(0.25, 0, 0, 25)
    Elements.CanvasSize = UDim2.new(0, 0, 5, 0)

    local UIListLayout_2 = Instance.new("UIListLayout", Elements)
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

    local Objects = Instance.new("Folder", Main)

    self:MakeDraggable(Main)

    return {Main = Main, Tabs = Tabs, Elements = Elements, Objects = Objects}
end

function UILibrary:AddTab(window, tabName)
    local TabButton = Instance.new("TextButton", window.Tabs)
    TabButton.BackgroundTransparency = 1
    TabButton.Size = UDim2.new(1, -8, 0, 32)
    TabButton.Text = tabName
    TabButton.Font = Enum.Font.GothamBold
    TabButton.TextSize = 14
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    return TabButton
end

function UILibrary:AddToggle(tab, toggleName, callback)
    local ToggleOn = Instance.new("TextButton", tab)
    ToggleOn.BackgroundTransparency = 1
    ToggleOn.Size = UDim2.new(1, -8, 0, 50)
    ToggleOn.Text = ""
    ToggleOn.TextXAlignment = Enum.TextXAlignment.Left
    ToggleOn.Font = Enum.Font.GothamBold
    ToggleOn.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local Title = Instance.new("TextLabel", ToggleOn)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.8, 0, 1, 0)
    Title.Text = toggleName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleContainer = Instance.new("TextButton", ToggleOn)
    ToggleContainer.BackgroundTransparency = 1
    ToggleContainer.Size = UDim2.new(0, 40, 0, 40)
    ToggleContainer.Position = UDim2.new(0.8, 0, 0, 0)
    
    local Pinhead = Instance.new("ImageLabel", ToggleContainer)
    Pinhead.AnchorPoint = Vector2.new(0.5, 0.5)
    Pinhead.Position = UDim2.new(0.5, 0, 0.5, 0)
    Pinhead.Size = UDim2.new(0, 14, 0, 14)
    Pinhead.Image = "rbxassetid://3570695787"
    
    local isOn = false
    
    ToggleContainer.MouseButton1Click:Connect(function()
        isOn = not isOn
        Pinhead.ImageColor3 = isOn and Color3.fromRGB(70, 119, 255) or Color3.fromRGB(115, 115, 115)
        if callback then callback(isOn) end
    end)
    
    return ToggleOn
end

return UILibrary
