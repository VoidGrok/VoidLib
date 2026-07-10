local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("VOIDLIB") then
    CoreGui.VOIDLIB:Destroy()
end

if _G.Theme == "Red" then
    _G.Primary = Color3.fromRGB(255, 30, 50)
    _G.Dark = Color3.fromRGB(90, 10, 20)
elseif _G.Theme == "Cyan" then
    _G.Primary = Color3.fromRGB(40, 230, 255)
    _G.Dark = Color3.fromRGB(10, 80, 115)
elseif _G.Theme == "Blue" then
    _G.Primary = Color3.fromRGB(40, 155, 255)
    _G.Dark = Color3.fromRGB(10, 80, 115)
elseif _G.Theme == "DarkBlue" then
    _G.Primary = Color3.fromRGB(50, 30, 255)
    _G.Dark = Color3.fromRGB(20, 10, 90)
elseif _G.Theme == "Green" then
    _G.Primary = Color3.fromRGB(70, 255, 205)
    _G.Dark = Color3.fromRGB(20, 90, 90)
elseif _G.Theme == "LightGreen" then
    _G.Primary = Color3.fromRGB(205, 255, 205)
    _G.Dark = Color3.fromRGB(70, 90, 70)
elseif _G.Theme == "Purple" then
    _G.Primary = Color3.fromRGB(205, 125, 255)
    _G.Dark = Color3.fromRGB(60, 20, 95)
elseif _G.Theme == "Zinc" then
    _G.Primary = Color3.fromRGB(30, 30, 30)
    _G.Dark = Color3.fromRGB(10, 10, 10)
else
    _G.Primary = Color3.fromRGB(110, 110, 120)
    _G.Dark = Color3.fromRGB(20, 20, 30)
end

local config = {}
local imageButton = Instance.new("ImageButton")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
imageButton.Parent = screenGui
imageButton.Position = UDim2.new(0, 10, 0, 10)
imageButton.Size = UDim2.new(0, 50, 0, 50)
imageButton.Draggable = true
imageButton.BackgroundColor3 = _G.Dark
imageButton.ImageColor3 = _G.Primary
imageButton.ImageTransparency = 0.1
imageButton.BackgroundTransparency = 0.1
imageButton.Image = "rbxassetid://13940080072"
local btnStroke = Instance.new("UIStroke")
btnStroke.Color = _G.Primary
btnStroke.Thickness = 1
btnStroke.Transparency = 0
btnStroke.Parent = imageButton
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 5)
btnCorner.Parent = imageButton
imageButton.MouseButton1Click:connect(function()
    local gui = CoreGui:FindFirstChild("VOIDLIB")
    if gui then gui.Enabled = not gui.Enabled end
end)

repeat wait(1) until game:IsLoaded()

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

config.Window = function(title)
    local config = {}
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AlertFrame"
    screenGui.Parent = CoreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "VOIDLIB"
    mainGui.Parent = CoreGui
    mainGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local frame = Instance.new("Frame")
    frame.Name = "Main"
    frame.Parent = mainGui
    frame.ClipsDescendants = true
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = _G.Dark
    frame.BackgroundTransparency = 0.1
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.Size = UDim2.new(0, 0, 0, 0)
    frame:TweenSize(UDim2.new(0, 524, 0, 332), "Out", "Quad", 0.4, true)

    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = _G.Primary
    mainStroke.Thickness = 1
    mainStroke.Transparency = 0
    mainStroke.Parent = frame

    local mainCorner = Instance.new("UICorner")
    mainCorner.Name = "CircleMain"
    mainCorner.Parent = frame
    mainCorner.CornerRadius = UDim.new(0, 5)

    -- Drag button
    local dragBtn = Instance.new("Frame")
    dragBtn.Name = "DragButton"
    dragBtn.Parent = frame
    dragBtn.Position = UDim2.new(1, 5, 1, 5)
    dragBtn.AnchorPoint = Vector2.new(1, 1)
    dragBtn.Size = UDim2.new(0, 15, 0, 15)
    dragBtn.BackgroundColor3 = _G.Primary
    dragBtn.BackgroundTransparency = 0.1
    dragBtn.ZIndex = 10
    local dragCorner = Instance.new("UICorner")
    dragCorner.Name = "CircleDragButton"
    dragCorner.Parent = dragBtn
    dragCorner.CornerRadius = UDim.new(0, 99)

    -- Top bar
    local topBar = Instance.new("Frame")
    topBar.Name = "Top"
    topBar.Parent = frame
    topBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundTransparency = 1
    local topCorner = Instance.new("UICorner")
    topCorner.Name = "TCNR"
    topCorner.Parent = topBar
    topCorner.CornerRadius = UDim.new(0, 5)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "ttittles"
    titleLabel.Parent = topBar
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 15, 0.5, 0)
    titleLabel.AnchorPoint = Vector2.new(0, 0.5)
    titleLabel.Size = UDim2.new(0, 1, 0, 25)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = "VOID LIB |"
    titleLabel.TextSize = 15
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    local TextService = game:GetService("TextService")
    titleLabel.Size = UDim2.new(0, TextService:GetTextSize(titleLabel.Text, titleLabel.TextSize, titleLabel.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)

    local patchLabel = Instance.new("TextLabel")
    patchLabel.Name = "patch"
    patchLabel.Parent = titleLabel
    patchLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    patchLabel.BackgroundTransparency = 1
    patchLabel.Position = UDim2.new(1, 5, 0.5, 0)
    patchLabel.Size = UDim2.new(0, 1, 0, 25)
    patchLabel.Font = Enum.Font.Gotham
    patchLabel.AnchorPoint = Vector2.new(0, 0.5)
    patchLabel.Text = title
    patchLabel.TextSize = 15
    patchLabel.TextColor3 = _G.Primary
    patchLabel.Size = UDim2.new(0, TextService:GetTextSize(patchLabel.Text, patchLabel.TextSize, patchLabel.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)

    local hideBtn = Instance.new("ImageButton")
    hideBtn.Name = "Hide"
    hideBtn.Parent = topBar
    hideBtn.BackgroundColor3 = _G.Primary
    hideBtn.BackgroundTransparency = 1
    hideBtn.AnchorPoint = Vector2.new(1, 0.5)
    hideBtn.Position = UDim2.new(1, -10, 0.5, 0)
    hideBtn.Size = UDim2.new(0, 25, 0, 25)
    hideBtn.Image = "rbxassetid://7743878857"
    hideBtn.ImageTransparency = 0
    hideBtn.ImageColor3 = Color3.fromRGB(245, 245, 245)
    local hideCorner = Instance.new("UICorner")
    hideCorner.Name = "MCNR"
    hideCorner.Parent = hideBtn
    hideCorner.CornerRadius = UDim.new(0, 3)
    hideBtn.MouseButton1Click:connect(function()
        mainGui.Enabled = false
    end)

    local sepBot = Instance.new("Frame")
    sepBot.Name = "SepBot"
    sepBot.Parent = topBar
    sepBot.BackgroundColor3 = _G.Primary
    sepBot.BackgroundTransparency = 0
    sepBot.BorderSizePixel = 0
    sepBot.AnchorPoint = Vector2.new(0.5, 1)
    sepBot.Position = UDim2.new(0.5, 0, 1, 0)
    sepBot.Size = UDim2.new(1, 0, 0, 1)

    -- Tabs
    local tabFrame = Instance.new("Frame")
    tabFrame.Name = "Tab"
    tabFrame.Parent = frame
    tabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    tabFrame.Position = UDim2.new(0, 8, 0, 45)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Size = UDim2.new(0, 148, 0, 275)

    local tabScroll = Instance.new("ScrollingFrame")
    tabScroll.Name = "ScrollTab"
    tabScroll.Parent = tabFrame
    tabScroll.Active = true
    tabScroll.BackgroundColor3 = Color3.fromRGB(0, 10, 250)
    tabScroll.Position = UDim2.new(0, 0, 0, 0)
    tabScroll.BackgroundTransparency = 1
    tabScroll.Size = UDim2.new(1, 0, 1, 0)
    tabScroll.ScrollBarThickness = 0
    tabScroll.ScrollingDirection = Enum.ScrollingDirection.Y

    local tabCorner = Instance.new("UICorner")
    tabCorner.Parent = tabFrame
    tabCorner.CornerRadius = UDim.new(0, 5)

    local tabList = Instance.new("UIListLayout")
    tabList.Name = "PLL"
    tabList.Parent = tabScroll
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Padding = UDim.new(0, 2)

    local tabPadding = Instance.new("UIPadding")
    tabPadding.Name = "PPD"
    tabPadding.Parent = tabScroll

    local pageFrame = Instance.new("Frame")
    pageFrame.Name = "Page"
    pageFrame.Parent = frame
    pageFrame.BackgroundColor3 = _G.Dark
    pageFrame.Position = UDim2.new(0, 166, 0, 45)
    pageFrame.Size = UDim2.new(0, 350, 0, 275)
    pageFrame.BackgroundTransparency = 1

    local pageCorner = Instance.new("UICorner")
    pageCorner.Parent = pageFrame
    pageCorner.CornerRadius = UDim.new(0, 3)

    local mainPage = Instance.new("Frame")
    mainPage.Name = "MainPage"
    mainPage.Parent = pageFrame
    mainPage.ClipsDescendants = true
    mainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainPage.BackgroundTransparency = 1
    mainPage.Size = UDim2.new(1, 0, 1, 0)

    local pageFolder = Instance.new("Folder")
    pageFolder.Name = "PageList"
    pageFolder.Parent = mainPage

    local pageLayout = Instance.new("UIPageLayout")
    pageLayout.Parent = pageFolder
    pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    pageLayout.EasingDirection = Enum.EasingDirection.InOut
    pageLayout.EasingStyle = Enum.EasingStyle.Quad
    pageLayout.FillDirection = Enum.FillDirection.Vertical
    pageLayout.Padding = UDim.new(0, 10)
    pageLayout.TweenTime = 0
    pageLayout.GamepadInputEnabled = false
    pageLayout.ScrollWheelInputEnabled = false
    pageLayout.TouchInputEnabled = false

    -- Drag functionality
    local dragging = false
    local dragInput = nil
    local mousePos = nil
    local framePos = nil

    dragBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragBtn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Insert then
            mainGui.Enabled = not mainGui.Enabled
        end
    end)

    -- Alerts
    config.Alert = function(msg)
        if CoreGui:FindFirstChild("AlertFrame") then
            local alert = CoreGui.AlertFrame
            if alert:FindFirstChild("Frame") then
                alert.Frame:Destroy()
            end
        end
        local frame = Instance.new("Frame")
        local icon = Instance.new("ImageLabel")
        local title = Instance.new("TextLabel")
        local desc = Instance.new("TextLabel")
        local corner = Instance.new("UICorner")
        frame.Name = "Frame"
        frame.Parent = CoreGui.AlertFrame
        frame.BackgroundColor3 = _G.Dark
        frame.BackgroundTransparency = 0.1
        frame.Position = UDim2.new(1, 0, 0, 0)
        frame.Size = UDim2.new(0, 200, 0, 60)
        local stroke = Instance.new("UIStroke")
        stroke.Color = _G.Primary
        stroke.Thickness = 1
        stroke.Transparency = 0
        stroke.Parent = frame
        icon.Name = "Icon"
        icon.Parent = frame
        icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0, 8, 0, 8)
        icon.Size = UDim2.new(0, 45, 0, 45)
        icon.Image = "rbxassetid://13940080072"
        title.Parent = frame
        title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        title.BackgroundTransparency = 1
        title.Position = UDim2.new(0, 55, 0, 14)
        title.Size = UDim2.new(0, 10, 0, 20)
        title.Font = Enum.Font.GothamBold
        title.Text = "Void Lib"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 16
        title.TextXAlignment = Enum.TextXAlignment.Left
        desc.Parent = frame
        desc.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        desc.BackgroundTransparency = 1
        desc.Position = UDim2.new(0, 55, 0, 33)
        desc.Size = UDim2.new(0, 10, 0, 10)
        desc.Font = Enum.Font.GothamSemibold
        desc.TextTransparency = 0.3
        desc.Text = msg
        desc.TextColor3 = Color3.fromRGB(200, 200, 200)
        desc.TextSize = 12
        desc.TextXAlignment = Enum.TextXAlignment.Left
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = frame
        frame:TweenPosition(UDim2.new(1, -195, 0, 0), "Out", "Quad", 0.4, true)
        wait(2)
        frame:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
        wait(0.6)
        frame:Destroy()
    end

    -- Create Tab function
    local function CreateTab(name, icon)
        local btn = Instance.new("TextButton")
        btn.Name = name .. "Server"
        btn.Parent = tabScroll
        btn.Text = ""
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.BackgroundColor3 = _G.Primary
        btn.BackgroundTransparency = 1
        btn.Font = Enum.Font.GothamSemibold
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12

        local sel = Instance.new("Frame")
        sel.Name = "SelectedTab"
        sel.Parent = btn
        sel.Size = UDim2.new(0, 3, 0, 0)
        sel.Position = UDim2.new(0, 0, 0.5, 0)
        sel.AnchorPoint = Vector2.new(0, 0.5)
        sel.BackgroundColor3 = _G.Primary
        sel.BackgroundTransparency = 0
        sel.ZIndex = 4
        local selCorner = Instance.new("UICorner")
        selCorner.CornerRadius = UDim.new(0, 100)
        selCorner.Parent = sel

        local iconLabel = Instance.new("ImageLabel")
        iconLabel.Name = "IDK"
        iconLabel.Parent = btn
        iconLabel.Size = UDim2.new(0, 15, 0, 15)
        iconLabel.Position = UDim2.new(0, 7, 0.5, 0)
        iconLabel.AnchorPoint = Vector2.new(0, 0.5)
        iconLabel.BackgroundTransparency = 1
        iconLabel.ImageTransparency = 0.3
        iconLabel.Image = icon or ""

        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Parent = btn
        title.Size = UDim2.new(0, 100, 0, 30)
        title.Position = UDim2.new(0, 30, 0.5, 0)
        title.AnchorPoint = Vector2.new(0, 0.5)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamSemibold
        title.Text = name
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 13
        title.TextTransparency = 0.4
        title.TextXAlignment = Enum.TextXAlignment.Left

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 5)
        corner.Parent = btn

        local page = Instance.new("ScrollingFrame")
        page.Name = name .. "_Page"
        page.Parent = pageFolder
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 0
        page.ScrollingDirection = Enum.ScrollingDirection.Y
        page.CanvasSize = UDim2.new(0, 0, 0, 0)

        local pageList = Instance.new("UIListLayout")
        pageList.Parent = page
        pageList.SortOrder = Enum.SortOrder.LayoutOrder
        pageList.Padding = UDim.new(0, 3)

        local pagePadding = Instance.new("UIPadding")
        pagePadding.Parent = page
        pagePadding.PaddingTop = UDim.new(0, 5)
        pagePadding.PaddingBottom = UDim.new(0, 5)
        pagePadding.PaddingLeft = UDim.new(0, 5)
        pagePadding.PaddingRight = UDim.new(0, 5)

        pageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            page.CanvasSize = UDim2.new(0, 0, 0, pageList.AbsoluteContentSize.Y + 10)
        end)

        -- Click to switch tab
        btn.MouseButton1Click:Connect(function()
            for _, b in pairs(tabScroll:GetChildren()) do
                if b:IsA("TextButton") then
                    TweenService:Create(b, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    local s = b:FindFirstChild("SelectedTab")
                    if s then
                        TweenService:Create(s, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 0)}):Play()
                    end
                    local ic = b:FindFirstChild("IDK")
                    if ic then
                        TweenService:Create(ic, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.4}):Play()
                    end
                    local t = b:FindFirstChild("Title")
                    if t then
                        TweenService:Create(t, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.4}):Play()
                    end
                end
            end
            TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            TweenService:Create(sel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 15)}):Play()
            TweenService:Create(iconLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
            TweenService:Create(title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
            for _, p in pairs(pageFolder:GetChildren()) do
                if p.Name == name .. "_Page" then
                    pageLayout:JumpTo(p)
                end
            end
        end)

        -- Select first tab automatically
        if not pageFolder:FindFirstChild("_firstLoaded") then
            pageFolder._firstLoaded = true
            TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            TweenService:Create(sel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 15)}):Play()
            TweenService:Create(iconLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
            TweenService:Create(title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
            pageLayout:JumpToIndex(1)
        end

        -- Element functions
        local ElementFunc = {}

        function ElementFunc:Button(text, callback)
            local frame = Instance.new("Frame")
            frame.Name = "Button"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 0.8
            frame.Size = UDim2.new(1, 0, 0, 36)

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Parent = frame

            local label = Instance.new("TextLabel")
            label.Name = "TextLabel"
            label.Parent = frame
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 15, 0.5, 0)
            label.AnchorPoint = Vector2.new(0, 0.5)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Font = Enum.Font.GothamSemibold
            label.Text = text
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 13
            label.TextXAlignment = Enum.TextXAlignment.Left

            local click = Instance.new("TextButton")
            click.Name = "TextButton"
            click.Parent = frame
            click.BackgroundColor3 = _G.Primary
            click.BackgroundTransparency = 0
            click.AnchorPoint = Vector2.new(1, 0.5)
            click.Position = UDim2.new(1, -10, 0.5, 0)
            click.Size = UDim2.new(0, 22, 0, 22)
            click.Font = Enum.Font.GothamSemibold
            click.Text = ""
            click.TextXAlignment = Enum.TextXAlignment.Left
            click.TextColor3 = Color3.fromRGB(255, 255, 255)
            click.TextSize = 13

            local icon = Instance.new("ImageLabel")
            icon.Name = "ImageLabel"
            icon.Parent = click
            icon.BackgroundTransparency = 1
            icon.AnchorPoint = Vector2.new(0.5, 0.5)
            icon.Position = UDim2.new(0.5, 0, 0.5, 0)
            icon.Size = UDim2.new(0, 15, 0, 15)
            icon.Image = "rbxassetid://10723375250"
            icon.ImageTransparency = 0.2
            icon.ImageColor3 = Color3.fromRGB(245, 245, 245)

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 4)
            btnCorner.Parent = click

            click.MouseButton1Click:Connect(callback)
        end

        function ElementFunc:Toggle(name, desc, default, callback)
            local val = default or false
            local frame = Instance.new("Frame")
            frame.Name = "Toggle"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 0.8
            frame.Size = UDim2.new(1, 0, 0, 46)
            frame.AutoButtonColor = false

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Parent = frame

            local title = Instance.new("TextLabel")
            title.Name = "Title"
            title.Parent = frame
            title.BackgroundTransparency = 1
            title.Size = UDim2.new(1, -60, 0, 35)
            title.Font = Enum.Font.GothamSemibold
            title.Text = name
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.TextSize = 13
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.AnchorPoint = Vector2.new(0, 0.5)

            local descLabel
            if desc then
                descLabel = Instance.new("TextLabel")
                descLabel.Parent = frame
                descLabel.BackgroundTransparency = 1
                descLabel.Position = UDim2.new(0, 15, 0, 22)
                descLabel.Size = UDim2.new(1, -60, 0, 16)
                descLabel.Font = Enum.Font.Gotham
                descLabel.Text = desc
                descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                descLabel.TextSize = 10
                descLabel.TextXAlignment = Enum.TextXAlignment.Left
                title.Position = UDim2.new(0, 15, 0.5, -5)
            else
                title.Position = UDim2.new(0, 15, 0.5, 0)
            end

            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = "ToggleFrame"
            toggleFrame.Parent = frame
            toggleFrame.BackgroundColor3 = _G.Dark
            toggleFrame.BackgroundTransparency = 1
            toggleFrame.Position = UDim2.new(1, -10, 0.5, 0)
            toggleFrame.Size = UDim2.new(0, 35, 0, 20)
            toggleFrame.AnchorPoint = Vector2.new(1, 0.5)

            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0, 10)
            toggleCorner.Parent = toggleFrame

            local toggleBtn = Instance.new("TextButton")
            toggleBtn.Name = "ToggleImage"
            toggleBtn.Parent = toggleFrame
            toggleBtn.BackgroundColor3 = _G.Dark
            toggleBtn.BackgroundTransparency = 0
            toggleBtn.Position = UDim2.new(0, 0, 0, 0)
            toggleBtn.AnchorPoint = Vector2.new(0, 0)
            toggleBtn.Size = UDim2.new(1, 0, 1, 0)
            toggleBtn.Text = ""
            toggleBtn.AutoButtonColor = false

            local toggleStroke = Instance.new("UIStroke")
            toggleStroke.Color = _G.Primary
            toggleStroke.Thickness = 1
            toggleStroke.Transparency = 0
            toggleStroke.Parent = toggleFrame

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 10)
            btnCorner.Parent = toggleBtn

            local circle = Instance.new("Frame")
            circle.Name = "Circle"
            circle.Parent = toggleBtn
            circle.BackgroundColor3 = _G.Primary
            circle.BackgroundTransparency = 0
            circle.Position = UDim2.new(0, 3, 0.5, 0)
            circle.Size = UDim2.new(0, 14, 0, 14)
            circle.AnchorPoint = Vector2.new(0, 0.5)

            local circleCorner = Instance.new("UICorner")
            circleCorner.CornerRadius = UDim.new(0, 10)
            circleCorner.Parent = circle

            local click = Instance.new("TextButton")
            click.Name = "Click"
            click.Parent = frame
            click.Size = UDim2.new(1, 0, 1, 0)
            click.BackgroundTransparency = 1
            click.Text = ""

            function updateToggle(value)
                val = value
                if val then
                    toggleStroke.Thickness = 0
                    circle:TweenPosition(UDim2.new(0, 18, 0.5, 0), "Out", "Sine", 0.2, true)
                    TweenService:Create(circle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Dark}):Play()
                    TweenService:Create(toggleBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Primary}):Play()
                else
                    toggleStroke.Thickness = 1
                    circle:TweenPosition(UDim2.new(0, 3, 0.5, 0), "Out", "Sine", 0.2, true)
                    TweenService:Create(circle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Primary}):Play()
                    TweenService:Create(toggleBtn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Dark}):Play()
                end
                pcall(callback, value)
            end

            click.MouseButton1Click:Connect(function()
                updateToggle(not val)
            end)

            if default then
                updateToggle(true)
            end
        end

        function ElementFunc:Slider(name, min, max, default, callback)
            local frame = Instance.new("Frame")
            frame.Name = "Slider"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 1
            frame.Size = UDim2.new(1, 0, 0, 45)

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Name = "slidercorner"
            corner.Parent = frame

            local bg = Instance.new("Frame")
            bg.Name = "sliderr"
            bg.Parent = frame
            bg.BackgroundColor3 = _G.Primary
            bg.BackgroundTransparency = 0.8
            bg.Position = UDim2.new(0, 0, 0, 0)
            bg.Size = UDim2.new(1, 0, 0, 45)

            local bgCorner = Instance.new("UICorner")
            bgCorner.CornerRadius = UDim.new(0, 5)
            bgCorner.Name = "sliderrcorner"
            bgCorner.Parent = bg

            local label = Instance.new("TextLabel")
            label.Parent = bg
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 15, 0.5, 0)
            label.Size = UDim2.new(1, 0, 0, 30)
            label.Font = Enum.Font.GothamSemibold
            label.Text = name
            label.AnchorPoint = Vector2.new(0, 0.5)
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 13
            label.TextXAlignment = Enum.TextXAlignment.Left

            local bar = Instance.new("Frame")
            bar.Name = "bar"
            bar.Parent = bg
            bar.BackgroundColor3 = _G.Primary
            bar.Size = UDim2.new(0, 100, 0, 4)
            bar.Position = UDim2.new(1, -10, 0.5, 10)
            bar.BackgroundTransparency = 0.8
            bar.AnchorPoint = Vector2.new(1, 0.5)

            local barFill = Instance.new("Frame")
            barFill.Name = "bar1"
            barFill.Parent = bar
            barFill.BackgroundColor3 = _G.Dark
            barFill.BackgroundTransparency = 0
            barFill.Size = UDim2.new(0, 0, 0, 4)

            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(0, 5)
            fillCorner.Name = "bar1corner"
            fillCorner.Parent = barFill

            local barCorner = Instance.new("UICorner")
            barCorner.CornerRadius = UDim.new(0, 5)
            barCorner.Name = "barcorner"
            barCorner.Parent = bar

            local circle = Instance.new("Frame")
            circle.Name = "circlebar"
            circle.Parent = barFill
            circle.BackgroundColor3 = _G.Dark
            circle.Position = UDim2.new(0, 0, 0, -5)
            circle.AnchorPoint = Vector2.new(0.5, 0)
            circle.Size = UDim2.new(0, 13, 0, 13)

            local circleCorner = Instance.new("UICorner")
            circleCorner.CornerRadius = UDim.new(0, 100)
            circleCorner.Parent = circle

            local valueBox = Instance.new("TextBox")
            valueBox.Parent = bg
            valueBox.BackgroundColor3 = _G.Dark
            valueBox.BackgroundTransparency = 0.1
            valueBox.Font = Enum.Font.Code
            valueBox.Size = UDim2.new(0, 35, 0, 15)
            valueBox.AnchorPoint = Vector2.new(1, 0.5)
            valueBox.Position = UDim2.new(1, -10, 0.5, -10)
            valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            valueBox.TextSize = 9
            valueBox.Text = tostring(default or 0)
            valueBox.TextTransparency = 0.1
            valueBox.ClearTextOnFocus = false
            valueBox.TextXAlignment = Enum.TextXAlignment.Center

            local vbCorner = Instance.new("UICorner")
            vbCorner.CornerRadius = UDim.new(0, 3)
            vbCorner.Parent = valueBox

            local dragging = false

            local function updateSlider(value)
                local v = math.clamp(value, min, max)
                local scale = (v - min) / (max - min)
                barFill.Size = UDim2.new(scale, 0, 0, 4)
                circle.Position = UDim2.new(scale, 0, 0, -5)
                valueBox.Text = tostring(v)
                pcall(callback, v)
            end

            bar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    local scale = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                    updateSlider(min + (scale * (max - min)))
                end
            end)

            circle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)

            circle.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local scale = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                    updateSlider(min + (scale * (max - min)))
                end
            end)

            valueBox.FocusLost:Connect(function()
                local num = tonumber(valueBox.Text)
                if num then
                    updateSlider(num)
                else
                    valueBox.Text = tostring(default or 0)
                end
            end)

            updateSlider(default or 0)
        end

        function ElementFunc:Dropdown(name, options, default, callback)
            local expanded = false
            local frame = Instance.new("Frame")
            frame.Name = "Dropdown"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 0.8
            frame.ClipsDescendants = false
            frame.Size = UDim2.new(1, 0, 0, 40)

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Parent = frame

            local label = Instance.new("TextLabel")
            label.Name = "DropTitle"
            label.Parent = frame
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 30)
            label.Font = Enum.Font.GothamSemibold
            label.Text = name
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 13
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Position = UDim2.new(0, 15, 0, 5)
            label.AnchorPoint = Vector2.new(0, 0)

            local selectBtn = Instance.new("TextButton")
            selectBtn.Name = "SelectItems"
            selectBtn.Parent = frame
            selectBtn.BackgroundColor3 = _G.Dark
            selectBtn.BackgroundTransparency = 0.1
            selectBtn.Position = UDim2.new(1, -5, 0, 5)
            selectBtn.Size = UDim2.new(0, 100, 0, 30)
            selectBtn.AnchorPoint = Vector2.new(1, 0)
            selectBtn.Font = Enum.Font.GothamMedium
            selectBtn.TextSize = 9
            selectBtn.ZIndex = 1
            selectBtn.Text = " " .. (default or "Select Items")
            selectBtn.ClipsDescendants = true
            selectBtn.TextXAlignment = Enum.TextXAlignment.Left
            local selCorner = Instance.new("UICorner")
            selCorner.CornerRadius = UDim.new(0, 5)
            selCorner.Parent = selectBtn

            local dropContainer = Instance.new("Frame")
            dropContainer.Name = "DropdownFrameScroll"
            dropContainer.Parent = frame
            dropContainer.BackgroundColor3 = _G.Dark
            dropContainer.BackgroundTransparency = 0
            dropContainer.ClipsDescendants = true
            dropContainer.Size = UDim2.new(1, -10, 0, 0)
            dropContainer.Position = UDim2.new(0, 5, 0, 40)
            dropContainer.Visible = false
            dropContainer.AnchorPoint = Vector2.new(0, 0)
            local dcCorner = Instance.new("UICorner")
            dcCorner.CornerRadius = UDim.new(0, 5)
            dcCorner.Parent = dropContainer

            local dropScroll = Instance.new("ScrollingFrame")
            dropScroll.Name = "DropScroll"
            dropScroll.Parent = dropContainer
            dropScroll.ScrollingDirection = Enum.ScrollingDirection.Y
            dropScroll.Active = true
            dropScroll.BackgroundTransparency = 1
            dropScroll.BorderSizePixel = 0
            dropScroll.Position = UDim2.new(0, 0, 0, 10)
            dropScroll.Size = UDim2.new(1, 0, 0, 80)
            dropScroll.AnchorPoint = Vector2.new(0, 0)
            dropScroll.ClipsDescendants = true
            dropScroll.ScrollBarThickness = 3
            dropScroll.ZIndex = 3
            dropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

            local list = Instance.new("UIListLayout")
            list.Parent = dropScroll
            list.SortOrder = Enum.SortOrder.LayoutOrder
            list.Padding = UDim.new(0, 1)

            local pad = Instance.new("UIPadding")
            pad.PaddingLeft = UDim.new(0, 10)
            pad.PaddingRight = UDim.new(0, 10)
            pad.Parent = dropScroll
            pad.Name = "PaddingDrop"

            local function addOptions(opts)
                for _, opt in pairs(opts) do
                    local btn = Instance.new("TextButton")
                    btn.Name = "Item"
                    btn.Parent = dropScroll
                    btn.BackgroundColor3 = _G.Primary
                    btn.BackgroundTransparency = 1
                    btn.Size = UDim2.new(1, 0, 0, 30)
                    btn.Font = Enum.Font.GothamSemibold
                    btn.Text = tostring(opt)
                    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btn.TextSize = 11
                    btn.TextTransparency = 0.5
                    btn.TextXAlignment = Enum.TextXAlignment.Left
                    btn.ZIndex = 4
                    local ipad = Instance.new("UIPadding")
                    ipad.PaddingLeft = UDim.new(0, 8)
                    ipad.Parent = btn
                    local icorner = Instance.new("UICorner")
                    icorner.CornerRadius = UDim.new(0, 5)
                    icorner.Parent = btn
                    local sel = Instance.new("Frame")
                    sel.Name = "SelectedItems"
                    sel.Parent = btn
                    sel.BackgroundColor3 = _G.Primary
                    sel.BackgroundTransparency = 1
                    sel.Size = UDim2.new(0, 3, 0.4, 0)
                    sel.Position = UDim2.new(0, -8, 0.5, 0)
                    sel.AnchorPoint = Vector2.new(0, 0.5)
                    sel.ZIndex = 4
                    local sc = Instance.new("UICorner")
                    sc.CornerRadius = UDim.new(0, 999)
                    sc.Parent = sel

                    btn.MouseEnter:Connect(function()
                        TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0, BackgroundTransparency = 0.8}):Play()
                        TweenService:Create(sel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    end)
                    btn.MouseLeave:Connect(function()
                        TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.5, BackgroundTransparency = 1}):Play()
                        TweenService:Create(sel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end)
                    btn.MouseButton1Click:Connect(function()
                        expanded = false
                        selectBtn.Text = " " .. btn.Text
                        dropContainer.Visible = false
                        dropContainer.Size = UDim2.new(1, -10, 0, 0)
                        frame.Size = UDim2.new(1, 0, 0, 40)
                        pcall(callback, btn.Text)
                    end)
                end
                dropScroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y)
            end

            addOptions(options or {})

            selectBtn.MouseButton1Click:Connect(function()
                expanded = not expanded
                if expanded then
                    dropContainer.Visible = true
                    dropContainer.Size = UDim2.new(1, -10, 0, 100)
                    frame.Size = UDim2.new(1, 0, 0, 145)
                else
                    dropContainer.Visible = false
                    dropContainer.Size = UDim2.new(1, -10, 0, 0)
                    frame.Size = UDim2.new(1, 0, 0, 40)
                end
            end)

            return {
                Add = function(opt)
                    addOptions({opt})
                end,
                Clear = function()
                    for _, child in pairs(dropScroll:GetChildren()) do
                        if child:IsA("TextButton") then child:Destroy() end
                    end
                    selectBtn.Text = " Select Items"
                    expanded = false
                    dropContainer.Visible = false
                    dropContainer.Size = UDim2.new(1, -10, 0, 0)
                    frame.Size = UDim2.new(1, 0, 0, 40)
                    dropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                end
            }
        end

        function ElementFunc:Textbox(name, placeholder, callback)
            local frame = Instance.new("Frame")
            frame.Name = "Textbox"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 0.8
            frame.Size = UDim2.new(1, 0, 0, 35)

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 5)
            corner.Name = "TextboxCorner"
            corner.Parent = frame

            local label = Instance.new("TextLabel")
            label.Name = "TextboxLabel"
            label.Parent = frame
            label.BackgroundTransparency = 1
            label.Position = UDim2.new(0, 15, 0.5, 0)
            label.Text = name
            label.Size = UDim2.new(1, 0, 0, 35)
            label.Font = Enum.Font.GothamSemibold
            label.AnchorPoint = Vector2.new(0, 0.5)
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 13
            label.TextTransparency = 0
            label.TextXAlignment = Enum.TextXAlignment.Left

            local box = Instance.new("TextBox")
            box.Name = "RealTextbox"
            box.Parent = frame
            box.BackgroundColor3 = _G.Dark
            box.BackgroundTransparency = 0.1
            box.Position = UDim2.new(1, -5, 0.5, 0)
            box.AnchorPoint = Vector2.new(1, 0.5)
            box.Size = UDim2.new(0, 80, 0, 25)
            box.Font = Enum.Font.GothamSemibold
            box.Text = placeholder or ""
            box.TextColor3 = Color3.fromRGB(225, 225, 225)
            box.TextSize = 11
            box.TextTransparency = 0
            box.ClipsDescendants = true
            box.FocusLost:Connect(function()
                pcall(callback, box.Text)
            end)

            local bxCorner = Instance.new("UICorner")
            bxCorner.CornerRadius = UDim.new(0, 5)
            bxCorner.Parent = box
        end

        function ElementFunc:Label(text)
            local label = Instance.new("TextLabel")
            label.Name = "Label"
            label.Parent = page
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 0, 20)
            label.Font = Enum.Font.GothamSemibold
            label.TextColor3 = Color3.fromRGB(225, 225, 225)
            label.TextSize = 13
            label.Text = text
            label.TextXAlignment = Enum.TextXAlignment.Left

            local pad = Instance.new("UIPadding")
            pad.PaddingLeft = UDim.new(0, 2)
            pad.Parent = label
            pad.Name = "PaddingLabel"

            return { Set = function(_, newText) label.Text = newText end }
        end

        function ElementFunc:Seperator(text)
            local frame = Instance.new("Frame")
            frame.Name = "Seperator"
            frame.Parent = page
            frame.BackgroundColor3 = _G.Primary
            frame.BackgroundTransparency = 1
            frame.Size = UDim2.new(1, 0, 0, 36)

            local label = Instance.new("TextLabel")
            label.Name = "Sep2"
            label.Parent = frame
            label.BackgroundTransparency = 1
            label.AnchorPoint = Vector2.new(0.5, 1)
            label.Position = UDim2.new(0.5, 0, 0, 30)
            label.Size = UDim2.new(1, 0, 0, 36)
            label.Font = Enum.Font.GothamBold
            label.Text = text or ""
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Center

            local line = Instance.new("Frame")
            line.Name = "Sep3"
            line.Parent = frame
            line.BackgroundColor3 = _G.Primary
            line.BackgroundTransparency = 0
            line.BorderSizePixel = 0
            line.AnchorPoint = Vector2.new(0.5, 0.5)
            line.Position = UDim2.new(0.5, 0, 0, 25)
            line.Size = UDim2.new(0, 39, 0, 3)
            local ts = game:GetService("TextService")
            local txt = label.Text
            local w = ts:GetTextSize(txt, label.TextSize, label.Font, Vector2.new(math.huge, math.huge)).X * 0.7
            line.Size = UDim2.new(0, w, 0, 3)
            local lc = Instance.new("UICorner")
            lc.CornerRadius = UDim.new(0, math.huge)
            lc.Parent = line
        end

        function ElementFunc:Line()
            local frame = Instance.new("Frame")
            frame.Name = "Linee"
            frame.Parent = page
            frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            frame.BackgroundTransparency = 1
            frame.Position = UDim2.new(0, 0, 0.119999997, 0)
            frame.Size = UDim2.new(1, 0, 0, 20)

            local line = Instance.new("Frame")
            line.Name = "Line"
            line.Parent = frame
            line.BackgroundColor3 = Color3.new(125, 125, 125)
            line.BorderSizePixel = 0
            line.Position = UDim2.new(0, 0, 0, 10)
            line.Size = UDim2.new(1, 0, 0, 1)

            local grad = Instance.new("UIGradient")
            grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, _G.Dark),
                ColorSequenceKeypoint.new(0.4, _G.Primary),
                ColorSequenceKeypoint.new(0.5, _G.Primary),
                ColorSequenceKeypoint.new(0.6, _G.Primary)
            })
            grad.Parent = line
        end

        return ElementFunc
    end

    -- Return the Tab creator
    config.Tab = function(name, icon)
        return CreateTab(name, icon)
    end

    return config
end

return config
