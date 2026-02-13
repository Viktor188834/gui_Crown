--[[
ПРИМЕР / TEMPLATE
local w = gui.Window({
	Text,
	Key = "15925",
	Https = "where are the code"
})

local page1 = w.AddPage({
	Text: string;
	OnMouseText: string;
})

local clickbutton = page1.ClickButton({
	Text: string;
	Callback: ()
})
local Slide = page1.Slide({
	Text: string;
	Callback: ()
})
local textbox = page1.TextBox({
	Tex: string;
	StarterValue: string;
	Callback: ()
})
local Keybind = page1.Keybind({
	Text: string;
	Keybind: Enum.Keycode;
	ChangedEnabled: Boolean;
	Callback: ();
})
local PlrSelect = page1.PlrSelect({
	Callback: (selected_player: Player),
	Text: string,
	PlayerIcon: boolean,
})
]]
local function create(name, prop)
	local a = Instance.new(name);
	for i,v in pairs(prop) do
		a[i] = v
	end
	return a
end

local Gui_to_return = {}
local Actived_Functions = {}
local here = {}

here.slider = function(parent: Instance, Position: UDim2, Size: UDim2, Callback)
	
	local mouse = game.Players.LocalPlayer:GetMouse()
	
	local Slider = Instance.new("Frame")
	Slider.Name = "Slider"
	Slider.Position = Position
	Slider.Size = Size
	Slider.BackgroundColor3 = Color3.new(1, 1, 1)
	Slider.BackgroundTransparency = 0.5
	Slider.BorderSizePixel = 0
	Slider.BorderColor3 = Color3.new(0, 0, 0)
	Slider.ZIndex = 2
	Slider.AnchorPoint = Vector2.new(0.5, 0.5)
	Slider.Parent = parent

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "UICorner"
	UICorner.Parent = Slider

	local Slide = Instance.new("TextButton")
	Slide.Name = "Slide"
	Slide.Position = UDim2.new(0, 0, 0.5, 0)
	Slide.Size = UDim2.new(0, 10, 1.5, 0)
	Slide.BackgroundColor3 = Color3.new(0.403922, 0.403922, 0.403922)
	Slide.BorderSizePixel = 0
	Slide.BorderColor3 = Color3.new(0, 0, 0)
	Slide.AnchorPoint = Vector2.new(0, 0.5)
	Slide.Text = ""
	Slide.TextColor3 = Color3.new(0, 0, 0)
	Slide.TextSize = 14
	Slide.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Slide.AutoButtonColor = false
	Slide.Parent = Slider

	local CanvasGroup = Instance.new("CanvasGroup")
	CanvasGroup.Name = "CanvasGroup"
	CanvasGroup.Size = UDim2.new(1, 0, 1, 0)
	CanvasGroup.BackgroundColor3 = Color3.new(1, 1, 1)
	CanvasGroup.BackgroundTransparency = 1
	CanvasGroup.BorderSizePixel = 0
	CanvasGroup.BorderColor3 = Color3.new(0, 0, 0)
	CanvasGroup.Parent = Slide

	local Shadow = Instance.new("ImageLabel")
	Shadow.Name = "Shadow"
	Shadow.Size = UDim2.new(1.5, 0, 1.5, 0)
	Shadow.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow.BackgroundTransparency = 1
	Shadow.BorderSizePixel = 0
	Shadow.BorderColor3 = Color3.new(0, 0, 0)
	Shadow.ZIndex = 0
	Shadow.AnchorPoint = Vector2.new(0.2, 0.3)
	Shadow.Image = "rbxassetid://7928096707"
	Shadow.ImageTransparency = 0.5
	Shadow.Parent = CanvasGroup

	local UICorner2 = Instance.new("UICorner")
	UICorner2.Name = "UICorner"
	UICorner2.Parent = CanvasGroup

	local UICorner3 = Instance.new("UICorner")
	UICorner3.Name = "UICorner"
	UICorner3.Parent = Slide

	local CanvasGroup2 = Instance.new("CanvasGroup")
	CanvasGroup2.Name = "CanvasGroup"
	CanvasGroup2.Size = UDim2.new(1, 0, 1, 0)
	CanvasGroup2.BackgroundColor3 = Color3.new(1, 1, 1)
	CanvasGroup2.BackgroundTransparency = 1
	CanvasGroup2.BorderSizePixel = 0
	CanvasGroup2.BorderColor3 = Color3.new(0, 0, 0)
	CanvasGroup2.Parent = Slider

	local Shadow2 = Instance.new("ImageLabel")
	Shadow2.Name = "Shadow"
	Shadow2.Position = UDim2.new(-0.3, 0, -0.5, 0)
	Shadow2.Size = UDim2.new(1.5, 0, 1.7, 0)
	Shadow2.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow2.BackgroundTransparency = 1
	Shadow2.BorderSizePixel = 0
	Shadow2.BorderColor3 = Color3.new(0, 0, 0)
	Shadow2.ZIndex = 0
	Shadow2.Image = "rbxassetid://7928096707"
	Shadow2.ImageTransparency = 0.5
	Shadow2.Parent = CanvasGroup2

	local UICorner4 = Instance.new("UICorner")
	UICorner4.Name = "UICorner"
	UICorner4.Parent = CanvasGroup2
	
	local m1 = false
	
	Slide.MouseButton1Down:Connect(function(x,y)
		m1 = true
	end)
	
	Slide.MouseButton1Up:Connect(function(x,y)
		m1 = false
	end)
	
	mouse.Button1Up:Connect(function()
		m1 = false
	end)
	
	game:GetService("RunService").Heartbeat:Connect(function()
		if m1 then
			local pos = UDim2.new(0, mouse.X-Slider.AbsolutePosition.X-(Slider.AbsoluteSize.X/10), 0.5, 0)
			Slide.Position = pos
			if Slide.Position.X.Offset <= 0 then
				Slide.Position = UDim2.new(0, 0, 0.5, 0)
			elseif Slide.Position.X.Offset >= Slider.AbsoluteSize.X then
				Slide.Position = UDim2.new(1, 0, 0.5, 0)
			end
			Callback((Slide.AbsolutePosition.X-Slider.AbsolutePosition.X)/Slider.AbsoluteSize.X)
		end
	end)
	
	return Slider
end

function Starter()
	local Animation = create("ScreenGui", {Name = "Animation";IgnoreGuiInset = true;ResetOnSpawn = false;ZIndexBehavior = Enum.ZIndexBehavior.Sibling;Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")});
	local Frame = create("Frame", {Name = "Frame";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(0, 350, 0, 70);BackgroundColor3 = Color3.new(0.113725, 0.113725, 0.113725);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Parent = Animation});
	local Crown = create("ImageLabel", {Name = "Crown";Position = UDim2.new(0.442857, 45, 5.157143, 0);Size = UDim2.new(0, 70, 0, 60);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 3;Rotation = -10;AnchorPoint = Vector2.new(0.5, 0.5);Image = "rbxassetid://17409640887";Parent = Frame});
	local Text = create("TextLabel", {Name = "Text";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "Gui Created Speccialy For <font color='rgb(255, 0, 255)'>Viktor18834</font>";TextColor3 = Color3.new(1, 1, 1);TextSize = 21;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextWrapped = true;RichText = true;Parent = Frame});
	local link = create("TextBox", {Name = "link";Position = UDim2.new(0, 0, 1, 0);Size = UDim2.new(1, 0, 0.25, 0);BackgroundColor3 = Color3.new(0.113725, 0.113725, 0.113725);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "https://youtube.com";TextColor3 = Color3.new(0.415686, 0.443137, 1);TextSize = 15;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Italic);TextXAlignment = Enum.TextXAlignment.Left;TextYAlignment = Enum.TextYAlignment.Top;RichText = true;Parent = Frame, TextEditable = false, ClearTextOnFocus = false});
	return {
		Animation = Animation;
		Frame = Frame;
		Crown = Crown;
		Text = Text;
		link = link
	}
end

local Starter_Guis = Starter()

local Animations = {
	{Starter_Guis.Frame, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {Position = UDim2.new(0.5, 0, 0.9)}};
	{Starter_Guis.Crown, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {ImageTransparency = 1}};
	{Starter_Guis.Text, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {TextTransparency = 1}};
	{Starter_Guis.link, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {TextTransparency = 1}};
	{Starter_Guis.Frame, TweenInfo.new(0.9, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, 0, 0.5)}};
	{Starter_Guis.Text, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {TextTransparency = 0}};
	{Starter_Guis.Text, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {TextTransparency = 0}};
	{Starter_Guis.Crown, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {ImageTransparency = 0, Position = UDim2.new(0.442857, 45, -0.457143, 0), Rotation = 0}};
	{Starter_Guis.Crown, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {Position = UDim2.new(0.442857, 45, 0.047143, 0), Rotation = -10}};
	{Starter_Guis.Crown, TweenInfo.new(0.13, Enum.EasingStyle.Quad), {Position = UDim2.new(0.442857, 45, 0.147143, 0), Rotation = -10}};
	{Starter_Guis.link, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {TextTransparency = 0}};
	{Starter_Guis.link, TweenInfo.new(5, Enum.EasingStyle.Linear), {TextTransparency = 0}};
}

wait(1)

for _,v in Animations do
	local tween: Tween = game:GetService("TweenService"):Create(v[1],v[2],v[3])
	tween:Play()
	tween.Completed:Wait()
end

local plr_selected = Instance.new("BindableEvent")
local hide_unhide_bind = Instance.new("BindableEvent")
local color = Instance.new("BindableEvent")

game:GetService("TweenService"):Create(Starter_Guis.Frame, TweenInfo.new(1), {Position = UDim2.new(0.5, 0, 0.9)}):Play()
for i,v in Starter_Guis do
	if v:IsA("TextLabel") then
		game:GetService("TweenService"):Create(v, TweenInfo.new(1), {TextTransparency = 1}):Play()
	elseif v:IsA("TextBox") then
		game:GetService("TweenService"):Create(v, TweenInfo.new(1), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
	end
	if v:IsA("Frame") then
		game:GetService("TweenService"):Create(v, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
	end
	if v:IsA("ImageLabel") then
		game:GetService("TweenService"):Create(v, TweenInfo.new(1), {ImageTransparency = 1}):Play()
	end
end

wait(1)

Starter_Guis.Animation:Destroy()
local DisplayName = false

local function create_gui()
	local guiScript1: ScreenGui = create("ScreenGui", {Name = "script", IgnoreGuiInset = true, ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")})
	local guiScript2 = create("Frame", {Name = "Frame", Position = UDim2.new(0.438389, 0, 0.524584, 0), Size = UDim2.new(0, 390, 0, 230), BackgroundColor3 = Color3.new(0.133333, 0.133333, 0.133333), BorderSizePixel = 0, AnchorPoint = Vector2.new(0, 0), Parent = guiScript1;Draggable=true,Active=true})
	local guiScript3 = create("UICorner", {Name = "UICorner", CornerRadius = UDim.new(0, 10), Parent = guiScript2})
	local guiScript4 = create("Frame", {Name = "Frame";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157);Parent = guiScript2})
	local guiScript5 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(0, 10);Parent = guiScript4})
	local guiScript6 = create("Frame", {Name = "PagesSelect";Position = UDim2.new(0, 0, 0.204, 0);Size = UDim2.new(0, 105, 0, 183);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;Transparency = 1;Parent = guiScript4})
	local guiScript7 = create("ScrollingFrame", {Name = "Scroll";Position = UDim2.new(0, 5, 0, 0);Size = UDim2.new(1, -6, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Active = true;CanvasSize = UDim2.new(0, 0, 0, 0);ScrollBarImageTransparency = 0.5;ScrollBarThickness = 4;ScrollingDirection = Enum.ScrollingDirection.Y;AutomaticCanvasSize = Enum.AutomaticSize.Y;Parent = guiScript6})
	local guiScript8 = create("UIListLayout", {Name = "UIListLayout";Padding = UDim.new(0, 1);HorizontalAlignment = Enum.HorizontalAlignment.Right;SortOrder = Enum.SortOrder.LayoutOrder;Parent = guiScript7})
	local guiScript9 = create("Frame", {Name = "Line";Position = UDim2.new(0, 5, 0, 0);Size = UDim2.new(0, 5, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Parent = guiScript6;})
	local guiScript10 = create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = guiScript9})
	local guiScript11 = create("Frame", {Name = "MaxLine";Position = UDim2.new(0, 5, 0, 0);Size = UDim2.new(0, 5, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.5;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Transparency = 0.5;Parent = guiScript6;})
	local guiScript12 = create("UICorner", {CornerRadius = UDim.new(1, 0);Parent = guiScript11})
	local guiScript13 = create("CanvasGroup", {Name = "CanvasGroup";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript4})
	local guiScript14 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.6, 0, 2, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.949999988079071;Parent = guiScript13})
	local guiScript15 = create("TextLabel", {Name = "name";Position = UDim2.new(0.04, 0, 0.1, 0);Size = UDim2.new(0.8, 0, 0.1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0, 0.5);TextTransparency = 0;Text = "WindowName";TextColor3 = Color3.new(1, 1, 1);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;TextXAlignment = Enum.TextXAlignment.Left;RichText = true;LineHeight = 3;Parent = guiScript4})
	local guiScript17 = create("ScrollingFrame", {Name = "Page";Position = UDim2.new(1, 0, 1, 0);Size = UDim2.new(1, -110, 0.8, -4);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 1);Transparency = 1;Parent = guiScript4;AutomaticCanvasSize = Enum.AutomaticSize.Y})
	local guiScript19 = create("Frame", {Name = "Lines";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 5;Transparency = 1;Parent = guiScript4})
	local guiScript20 = create("Frame", {Name = "Line";Position = UDim2.new(0, 106, 0.2, 0);Size = UDim2.new(0, 2, 0.77, 0);BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 5;Transparency = 1;Parent = guiScript19})
	local guiScript21 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(5, 0, 1.01, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0.172549, 0.172549, 0.172549);Parent = guiScript20})
	local guiScript22 = create("Frame", {Name = "Line";Position = UDim2.new(0, 0, 0.2, 0);Size = UDim2.new(1, 0, 0, 2);BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 5;AnchorPoint = Vector2.new(0, 1);Transparency = 1;Parent = guiScript19})
	local guiScript23 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.01, 0, 5, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0.172549, 0.172549, 0.172549);Parent = guiScript22})
	local guiScript24 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(0.5, 0, 0.5, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0, 0, 0);ImageTransparency = 0.20000000298023224;Parent = guiScript1})
	local guiScript25 = create("Frame", {Name = "Templates";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Visible = false;Transparency = 1;Parent = guiScript1})
	local guiScript26 = create("ImageLabel", {Name = "SelectImage";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.5, 0, 1.5, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0.905882, 0.905882, 0.905882);ImageTransparency = 0.800000011920929;Parent = guiScript25})
	local guiScript27 = create("Frame", {Name = "Text";Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local guiScript28 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);TextTransparency = 0;Text = "SectionName";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 15;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextWrapped = true;TextXAlignment = Enum.TextXAlignment.Center;TextYAlignment = Enum.TextYAlignment.Center;RichText = true;Parent = guiScript27})
	local guiScript29 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = guiScript27})
	local guiScript31 = create("TextButton", {Name = "TemplatePageSelect";Size = UDim2.new(1, 0, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);RichText = true;Parent = guiScript25})
	local guiScript54 = create("TextButton", {Name = "Button";Size = UDim2.new(1, 0, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 15;Text = "PageName";TextColor3 = Color3.new(0.952941, 0.952941, 0.952941);TextSize = 19;TextTransparency = 0;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);RichText = true;AutoButtonColor = false;Parent = guiScript31})
	local guiScript56 = create("Frame", {Name = "MouseText";Position = UDim2.new(0.49, 0, 0, 13);Size = UDim2.new(0.75, 0, 0, 0);BackgroundColor3 = Color3.new(0.207843, 0.207843, 0.207843);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0);Parent = guiScript31})
	local guiScript57 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(0, 5);Parent = guiScript56})
	local guiScript58 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1, 0, 2, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.800000011920929;Parent = guiScript56})
	local text = create("TextLabel", {Name = "text";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;TextColor3 = Color3.new(1, 1, 1);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;Parent = guiScript56})
	local UIStroke3 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = text})
	local TextBox = create("Frame", {Name = "TextBox";Position = UDim2.new(0, 0, 0, 120);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text6 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Text = "TextBox";TextTransparency = 0;TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;Parent = TextBox})
	local ActivateButton = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";TextTransparency = 0;TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = TextBox})
	local hor = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = TextBox})
	local UICorner7 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = hor})
	local TextBox2 = create("Frame", {Name = "TextBox";Position = UDim2.new(1, -15, 0.5, 0);Size = UDim2.new(0, 150, 0.6, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Parent = TextBox})
	local TextBox3 = create("TextBox", {Name = "TextBox";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "StarterValue";TextColor3 = Color3.new(1, 1, 1);TextSize = 14;TextTransparency = 0;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;TextXAlignment = Enum.TextXAlignment.Right;RichText = true;Parent = TextBox2})
	local UICorner8 = create("UICorner", {Name = "UICorner";Parent = TextBox2})
	local ImageLabel = create("ImageLabel", {Name = "ImageLabel";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.3, 0, 1.5, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.8999999761581421;Parent = TextBox2})
	local Slide = create("Frame", {Name = "Slide";Position = UDim2.new(0, 0, 0, 90);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local UIStroke6 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = guiScript28})
	local ActivateButton2 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(0.7, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";Position=UDim2.new(0,0,0,0);TextTransparency = 0;TextColor3 = Color3.new(1,1,1);TextSize = 21;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = Slide, TextXAlignment = Enum.TextXAlignment.Left})
	local _2 = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = Slide})
	local UICorner9 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = _2})
	local Slide2 = create("Frame", {Name = "Slide";Position = UDim2.new(1, -15, 0.5, 0);Size = UDim2.new(0, 50, 0, 25);BackgroundColor3 = Color3.new(0.223529, 0.223529, 0.223529);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Parent = Slide})
	local UICorner10 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = Slide2})
	local UIStroke7 = create("UIStroke", {Name = "UIStroke";Thickness = 3;Transparency = 0.6000000238418579;Parent = Slide2})
	local ImageLabel2 = create("ImageLabel", {Name = "ImageLabel";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.2, 0, 1.2, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0, 0, 0);ImageTransparency = 0.699999988079071;Parent = Slide2})
	local Dot = create("Frame", {Name = "Dot";Size = UDim2.new(0, 25, 0, 25);BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Parent = Slide2})
	local UICorner11 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = Dot})
	local ImageLabel3 = create("ImageLabel", {Name = "ImageLabel";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.9300000071525574;Parent = Dot})
	local Keybind = create("Frame", {Name = "Keybind";Position = UDim2.new(0, 0, 0, 60);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text3 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);TextTransparency = 0;Text = "Keybind";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;Parent = Keybind})
	local ActivateButton3 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = Keybind})
	local _3 = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = Keybind})
	local UICorner12 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = _3})
	local KeybindText = create("TextLabel", {Name = "KeybindText";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 25, 0, 25);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);TextTransparency = 0;Text = "T";TextColor3 = Color3.new(0.937255, 0.937255, 0.937255);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;Parent = Keybind})
	local ClickButton = create("Frame", {Name = "ClickButton";Position = UDim2.new(0, 0, 0, 30);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text4 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);TextTransparency = 0;Text = "ClickButton";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;Parent = ClickButton})
	local ActivateButton4 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = ClickButton})
	local _4 = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = ClickButton})
	local UICorner13 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = _4})
	local LeftTrow = create("ImageLabel", {Name = "LeftTrow";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 3;AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Image = "rbxassetid://2418686949";Parent = ClickButton})
	local CanvasGroup2 = create("CanvasGroup", {Name = "CanvasGroup";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 45, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Parent = ClickButton})
	local ImageLabel4 = create("ImageLabel", {Name = "ImageLabel";Size = UDim2.new(0, 90, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0, 0, 0);ImageTransparency = 0.699999988079071;Parent = CanvasGroup2})
	local Section = create("Frame", {Name = "Section";Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text5 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Transparency = 1;Text = "SectionName";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;RichText = true;Parent = Section})
	local ImageButton = create("ImageButton", {Name = "ImageButton";Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Image = "rbxassetid://11552476728";Parent = Section})
	local More = create("Frame", {Name = "More";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 50;Transparency = 1;Parent = guiScript2})
	local YScale:TextButton = create("TextButton", {Name = "YScale";Position = UDim2.new(0.5, 0, 1, 5);Size = UDim2.new(0, 150, 0, 9);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.5;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0);Transparency = 0.5;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);Parent = More, AutoButtonColor = false})
	local UICorner99 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = YScale})
	local XScale = create("TextButton", {Name = "XScale";Position = UDim2.new(1, 5, 0.5, 0);Size = UDim2.new(0, 5, 0, 150);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.5;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0, 0.5);Transparency = 0.5;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);Parent = More, AutoButtonColor = false})
	local UICorner99 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = XScale})
	local Close = create("ImageButton", {Name = "Close";Position = UDim2.new(1, -20, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://90965270530088";Parent = More})
	local Settings = create("ImageButton", {Name = "Settings";Position = UDim2.new(1, -90, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://112630223329701";Parent = More})
	local Hide = create("ImageButton", {Name = "Hide";Position = UDim2.new(1, -55, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://15396333997";Parent = More})

	local PlrSelect = Instance.new("Frame")
	PlrSelect.Name = "PlrSelect"
	PlrSelect.Position = UDim2.new(0, -50, 0, 0)
	PlrSelect.Size = UDim2.new(0.5, 0, 1, 0)
	PlrSelect.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	PlrSelect.BackgroundTransparency = 1
	PlrSelect.BorderSizePixel = 0
	PlrSelect.BorderColor3 = Color3.new(0, 0, 0)
	PlrSelect.AnchorPoint = Vector2.new(1, 0)
	PlrSelect.Visible = false
	PlrSelect.Parent = guiScript4

	local Shadow = Instance.new("ImageLabel")
	Shadow.Name = "Shadow"
	Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow.Size = UDim2.new(2, 0, 2, 0)
	Shadow.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow.BackgroundTransparency = 1
	Shadow.BorderSizePixel = 0
	Shadow.BorderColor3 = Color3.new(0, 0, 0)
	Shadow.ZIndex = 0
	Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow.Image = "rbxassetid://7928096707"
	Shadow.ImageColor3 = Color3.new(0, 0, 0)
	Shadow.ImageTransparency = 0.20000000298023224
	Shadow.Parent = PlrSelect

	local Frame = Instance.new("Frame")
	Frame.Name = "Frame"
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	Frame.BorderSizePixel = 0
	Frame.BorderColor3 = Color3.new(0, 0, 0)
	Frame.Parent = PlrSelect

	local CanvasGroup = Instance.new("CanvasGroup")
	CanvasGroup.Name = "CanvasGroup"
	CanvasGroup.Size = UDim2.new(1, 0, 1, 0)
	CanvasGroup.BackgroundColor3 = Color3.new(1, 1, 1)
	CanvasGroup.BackgroundTransparency = 1
	CanvasGroup.BorderSizePixel = 0
	CanvasGroup.BorderColor3 = Color3.new(0, 0, 0)
	CanvasGroup.Parent = Frame

	local Shadow2 = Instance.new("ImageLabel")
	Shadow2.Name = "Shadow"
	Shadow2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow2.Size = UDim2.new(1.6, 0, 2, 0)
	Shadow2.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow2.BackgroundTransparency = 1
	Shadow2.BorderSizePixel = 0
	Shadow2.BorderColor3 = Color3.new(0, 0, 0)
	Shadow2.ZIndex = 0
	Shadow2.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow2.Image = "rbxassetid://7928096707"
	Shadow2.ImageTransparency = 0.949999988079071
	Shadow2.Parent = CanvasGroup

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "UICorner"

	UICorner.Parent = Frame

	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Name = "ScrollingFrame"
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
	ScrollingFrame.Active = true
	ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
	ScrollingFrame.ScrollBarImageTransparency = 0.5
	ScrollingFrame.ScrollBarThickness = 10
	ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollingFrame.Parent = PlrSelect

	local PlrSelectTemp = Instance.new("Frame")
	PlrSelectTemp.Name = "PlrSelectTemp"
	PlrSelectTemp.Size = UDim2.new(0.95, 0, 0, 35)
	PlrSelectTemp.BackgroundColor3 = Color3.new(1, 1, 1)
	PlrSelectTemp.BackgroundTransparency = 1
	PlrSelectTemp.BorderSizePixel = 0
	PlrSelectTemp.BorderColor3 = Color3.new(0, 0, 0)
	PlrSelectTemp.Parent = guiScript25

	local plrIcon = Instance.new("ImageLabel")
	plrIcon.Name = "plrIcon"
	plrIcon.Size = UDim2.new(0.19, 0, 1, 0)
	plrIcon.BackgroundColor3 = Color3.new(1, 1, 1)
	plrIcon.BackgroundTransparency = 1
	plrIcon.BorderSizePixel = 0
	plrIcon.BorderColor3 = Color3.new(0, 0, 0)
	plrIcon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
	plrIcon.Parent = PlrSelectTemp

	local UICorner2 = Instance.new("UICorner")
	UICorner2.Name = "UICorner"
	UICorner2.CornerRadius = UDim.new(0, 16)
	UICorner2.Parent = plrIcon

	local TextLabel = Instance.new("TextLabel")
	TextLabel.Name = "TextLabel"
	TextLabel.Position = UDim2.new(1, 0, 0, 0)
	TextLabel.Size = UDim2.new(0.8, -3, 1, 0)
	TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel.BackgroundTransparency = 1
	TextLabel.BorderSizePixel = 0
	TextLabel.BorderColor3 = Color3.new(0, 0, 0)
	TextLabel.AnchorPoint = Vector2.new(1, 0)
	TextLabel.Text = "CornDogP350 (LXS_geroich)"
	TextLabel.TextColor3 = Color3.new(0.941177, 0.941177, 0.941177)
	TextLabel.TextSize = 12
	TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.RichText = true
	TextLabel.Parent = PlrSelectTemp

	local ActivateButton = Instance.new("TextButton")
	ActivateButton.Name = "ActivateButton"
	ActivateButton.Size = UDim2.new(1, 0, 1, 0)
	ActivateButton.BackgroundColor3 = Color3.new(1, 1, 1)
	ActivateButton.BackgroundTransparency = 1
	ActivateButton.BorderSizePixel = 0
	ActivateButton.BorderColor3 = Color3.new(0, 0, 0)
	ActivateButton.ZIndex = 3
	ActivateButton.Transparency = 1
	ActivateButton.TextColor3 = Color3.new(0, 0, 0)
	ActivateButton.TextSize = 14
	ActivateButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ActivateButton.AutoButtonColor = false
	ActivateButton.Parent = PlrSelectTemp

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Name = "UIListLayout"
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Wraps = true
	UIListLayout.Parent = ScrollingFrame

	local plrSelect = Instance.new("Frame")
	plrSelect.Name = "plrSelect"
	plrSelect.Position = UDim2.new(0, 0, 0, 90)
	plrSelect.Size = UDim2.new(1, 0, 0, 30)
	plrSelect.BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608)
	plrSelect.BackgroundTransparency = 1
	plrSelect.BorderSizePixel = 0
	plrSelect.BorderColor3 = Color3.new(0, 0, 0)
	plrSelect.Parent = guiScript25

	local ActivateButton = Instance.new("TextButton")
	ActivateButton.Name = "ActivateButton"
	ActivateButton.Size = UDim2.new(1, 0, 1, 0)
	ActivateButton.BackgroundColor3 = Color3.new(1, 1, 1)
	ActivateButton.BackgroundTransparency = 1
	ActivateButton.BorderSizePixel = 0
	ActivateButton.BorderColor3 = Color3.new(0, 0, 0)
	ActivateButton.Transparency = 1
	ActivateButton.Text = ""
	ActivateButton.TextColor3 = Color3.new(0, 0, 0)
	ActivateButton.TextSize = 14
	ActivateButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ActivateButton.AutoButtonColor = false
	ActivateButton.Parent = plrSelect

	local _4 = Instance.new("Frame")
	_4.Name = "|"
	_4.Position = UDim2.new(0, 15, 0.5, 0)
	_4.Size = UDim2.new(0, 3, 0.8, 0)
	_4.BackgroundColor3 = Color3.new(1, 1, 1)
	_4.BackgroundTransparency = 0.30000001192092896
	_4.BorderSizePixel = 0
	_4.BorderColor3 = Color3.new(0, 0, 0)
	_4.AnchorPoint = Vector2.new(0.5, 0.5)
	_4.Transparency = 0.30000001192092896
	_4.Parent = plrSelect

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = _4

	local TextLabel = Instance.new("TextLabel")
	TextLabel.Name = "TextLabel"
	TextLabel.Position = UDim2.new(0.1, 0, 0, 0)
	TextLabel.Size = UDim2.new(0.8, 0, 1, 0)
	TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	TextLabel.BackgroundTransparency = 1
	TextLabel.BorderSizePixel = 0
	TextLabel.BorderColor3 = Color3.new(0, 0, 0)
	TextLabel.TextColor3 = Color3.new(0.941177, 0.941177, 0.941177)
	TextLabel.TextSize = 18
	TextLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.RichText = true
	TextLabel.Parent = plrSelect

	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.Name = "ImageLabel"
	ImageLabel.Position = UDim2.new(1, -40, 0, 0)
	ImageLabel.Size = UDim2.new(0, 25, 0, 25)
	ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.BorderSizePixel = 0
	ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
	ImageLabel.Transparency = 1
	ImageLabel.Image = "rbxassetid://2243841635"
	ImageLabel.Parent = plrSelect
	
	local Color = Instance.new("Frame")
	Color.Name = "Color"
	Color.Position = UDim2.new(1, 50, 0.5, 0)
	Color.Size = UDim2.new(0, 175, 0, 175)
	Color.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	Color.BackgroundTransparency = 1
	Color.BorderSizePixel = 0
	Color.BorderColor3 = Color3.new(0, 0, 0)
	Color.AnchorPoint = Vector2.new(0, 0.5)
	Color.Parent = guiScript2
	Color.Visible = false
	local end_ = nil
	local end_color = nil
	local sliderBlack = here.slider(Color, UDim2.new(0.5, 0, 0.7, 0), UDim2.new(0.8, 0, 0.2, 0), function(value)
		end_ = Color3.fromRGB(255-value*2.55, 255-value*2.55, 255-value*2.55)
	end)
	
	local sliderColor = here.slider(Color, UDim2.new(0.5, 0, 0.3, 0), UDim2.new(0.8, 0, 0.3, 0), function(value)
		local r = 0
		local g = 0
		local b = 0
		local r2 = 0
		r = 0.25-value
		if r < 0 then
			r = 1
		end
		g = 0.5-value
		if g < 0 then
			g = 1
		end
		b = 0.75-value
		if b < 0 then
			b = 1
		end
		end_color = Color3.fromRGB(r,g,b)
	end)
	
	local UIGradientBlack = Instance.new("UIGradient")
	UIGradientBlack.Name = "UIGradient"
	UIGradientBlack.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))})
	UIGradientBlack.Parent = sliderBlack
	
	sliderBlack:FindFirstChildOfClass("CanvasGroup"):Destroy()
	
	local UIGradientColor = Instance.new("UIGradient")
	UIGradientColor.Name = "UIGradient"
	UIGradientColor.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
		ColorSequenceKeypoint.new(0.25, Color3.new(0, 0, 1)),
		ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 0.0823529)),
		ColorSequenceKeypoint.new(0.75, Color3.new(1, 0.933333, 0)),
		ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
	})
	UIGradientColor.Parent = sliderColor

	sliderColor:FindFirstChildOfClass("CanvasGroup"):Destroy()

	local Shadow = Instance.new("ImageLabel")
	Shadow.Name = "Shadow"
	Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow.Size = UDim2.new(2, 0, 2, 0)
	Shadow.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow.BackgroundTransparency = 1
	Shadow.BorderSizePixel = 0
	Shadow.BorderColor3 = Color3.new(0, 0, 0)
	Shadow.ZIndex = 0
	Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow.Transparency = 1
	Shadow.Image = "rbxassetid://7928096707"
	Shadow.ImageColor3 = Color3.new(0, 0, 0)
	Shadow.ImageTransparency = 0.20000000298023224
	Shadow.Parent = Color

	local Frame = Instance.new("Frame")
	Frame.Name = "Frame"
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
	Frame.BorderSizePixel = 0
	Frame.BorderColor3 = Color3.new(0, 0, 0)
	Frame.Parent = Color

	local CanvasGroup = Instance.new("CanvasGroup")
	CanvasGroup.Name = "CanvasGroup"
	CanvasGroup.Size = UDim2.new(1, 0, 1, 0)
	CanvasGroup.BackgroundColor3 = Color3.new(1, 1, 1)
	CanvasGroup.BackgroundTransparency = 1
	CanvasGroup.BorderSizePixel = 0
	CanvasGroup.BorderColor3 = Color3.new(0, 0, 0)
	CanvasGroup.Transparency = 1
	CanvasGroup.Parent = Frame

	local Shadow2 = Instance.new("ImageLabel")
	Shadow2.Name = "Shadow"
	Shadow2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow2.Size = UDim2.new(1.6, 0, 2, 0)
	Shadow2.BackgroundColor3 = Color3.new(1, 1, 1)
	Shadow2.BackgroundTransparency = 1
	Shadow2.BorderSizePixel = 0
	Shadow2.BorderColor3 = Color3.new(0, 0, 0)
	Shadow2.ZIndex = 0
	Shadow2.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow2.Transparency = 1
	Shadow2.Image = "rbxassetid://7928096707"
	Shadow2.ImageTransparency = 0.949999988079071
	Shadow2.Parent = CanvasGroup

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "UICorner"
	UICorner.Parent = Frame
	
	local ColorSelect = Instance.new("Frame")
	ColorSelect.Name = "ColorSelect"
	ColorSelect.Position = UDim2.new(0, 0, 0, 90)
	ColorSelect.Size = UDim2.new(1, 0, 0, 30)
	ColorSelect.BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608)
	ColorSelect.BackgroundTransparency = 1
	ColorSelect.BorderSizePixel = 0
	ColorSelect.BorderColor3 = Color3.new(0, 0, 0)
	ColorSelect.Parent = guiScript25

	local ActivateButton = Instance.new("TextButton")
	ActivateButton.Name = "ActivateButton"
	ActivateButton.Size = UDim2.new(1, 0, 1, 0)
	ActivateButton.BackgroundColor3 = Color3.new(1, 1, 1)
	ActivateButton.BackgroundTransparency = 1
	ActivateButton.BorderSizePixel = 0
	ActivateButton.BorderColor3 = Color3.new(0, 0, 0)
	ActivateButton.Text = ""
	ActivateButton.TextColor3 = Color3.new(0, 0, 0)
	ActivateButton.TextSize = 14
	ActivateButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ActivateButton.AutoButtonColor = false
	ActivateButton.Parent = ColorSelect

	local _5 = Instance.new("Frame")
	_5.Name = "|"
	_5.Position = UDim2.new(0, 15, 0.5, 0)
	_5.Size = UDim2.new(0, 3, 0.8, 0)
	_5.BackgroundColor3 = Color3.new(1, 1, 1)
	_5.BackgroundTransparency = 0.30000001192092896
	_5.BorderSizePixel = 0
	_5.BorderColor3 = Color3.new(0, 0, 0)
	_5.AnchorPoint = Vector2.new(0.5, 0.5)
	_5.Parent = ColorSelect

	local UICorner = Instance.new("UICorner")
	UICorner.Name = "UICorner"
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = _5

	local Text = Instance.new("TextLabel")
	Text.Name = "Text"
	Text.Position = UDim2.new(0.1, 0, 0, 0)
	Text.Size = UDim2.new(0.8, 0, 1, 0)
	Text.BackgroundColor3 = Color3.new(1, 1, 1)
	Text.BackgroundTransparency = 1
	Text.BorderSizePixel = 0
	Text.BorderColor3 = Color3.new(0, 0, 0)
	Text.Text = "Text"
	Text.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
	Text.TextSize = 19
	Text.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.RichText = true
	Text.Parent = ColorSelect

	local Image = Instance.new("ImageLabel")
	Image.Name = "Image"
	Image.Position = UDim2.new(1, -10, 0, 0)
	Image.Size = UDim2.new(0.11, 0, 1, 0)
	Image.BackgroundColor3 = Color3.new(1, 1, 1)
	Image.BackgroundTransparency = 1
	Image.BorderSizePixel = 0
	Image.BorderColor3 = Color3.new(0, 0, 0)
	Image.AnchorPoint = Vector2.new(1, 0)
	Image.Image = "rbxassetid://7928096707"
	Image.Parent = ColorSelect

	local Color = Instance.new("TextLabel")
	Color.Name = "Color"
	Color.Position = UDim2.new(0.1, 0, 0, 0)
	Color.Size = UDim2.new(0.77, 0, 1, 0)
	Color.BackgroundColor3 = Color3.new(1, 1, 1)
	Color.BackgroundTransparency = 1
	Color.BorderSizePixel = 0
	Color.BorderColor3 = Color3.new(0, 0, 0)
	Color.Text = "(255, 255, 255)"
	Color.TextColor3 = Color3.new(0.921569, 0.921569, 0.921569)
	Color.TextSize = 10
	Color.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Color.TextXAlignment = Enum.TextXAlignment.Right
	Color.RichText = true
	Color.Parent = ColorSelect
	
	local function hide_unhide(boolean: boolean)
		PlrSelect.Visible = boolean
	end
	
	hide_unhide_bind.Event:Connect(function(a)
		hide_unhide(a)
	end)
	
	local function on_plr_added(plr)
		local cloned = PlrSelectTemp:Clone()
		cloned.Parent = ScrollingFrame
		cloned.Name = plr.Name
		local image, _ = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		cloned:WaitForChild("plrIcon").Image = image
		cloned:FindFirstChildOfClass("TextLabel").Text = plr.DisplayName
		local function onActive3()
			plr_selected:Fire(plr)
			hide_unhide(false)
		end
		cloned.ActivateButton.TouchTap:Connect(onActive3)
		cloned.ActivateButton.MouseButton1Down:Connect(onActive3)
	end
	
	for _, plr in game.Players:GetPlayers() do
		on_plr_added(plr)
	end
	game.Players.PlayerAdded:Connect(on_plr_added)
	game.Players.PlayerRemoving:Connect(function(plr)
		local a = PlrSelect:FindFirstChild(plr.Name)
		if a then
			a:Destroy()
		end
	end)

	local gui = guiScript1
	local Frame = gui:WaitForChild("Frame"):WaitForChild("Frame")

	table.insert(Actived_Functions, game:GetService("RunService").Heartbeat:Connect(function()
		if gui:FindFirstChild("Shadow") then
			game:GetService("TweenService"):Create(gui:FindFirstChild("Shadow"), TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
				Position = UDim2.new(0, (Frame.AbsolutePosition.X+(Frame.AbsoluteSize.X/2)),0, (Frame.AbsolutePosition.Y+(Frame.AbsoluteSize.Y/1.5)))}):Play()
		end
	end))

	-- Scale
	local funY = nil
	YScale.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(YScale, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
			BackgroundTransparency = 0.25, Size = UDim2.new(0,215,0,13)}):Play()
	end)
	YScale.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(YScale, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
			BackgroundTransparency = 0.5, Size = UDim2.new(0,150,0,9)}):Play()
		if funY then
			funY:Disconnect()
		end
	end)
	YScale.MouseButton1Down:Connect(function()
		funY = game:GetService("RunService").Heartbeat:Connect(function()
			local frame: Frame = Frame.Parent
			local mouse = game.Players.LocalPlayer:GetMouse()
			local min = 180
			local max = 400
			frame.Size = UDim2.new(0,frame.AbsoluteSize.X,0,mouse.Y-frame.AbsolutePosition.Y-(YScale.AbsoluteSize.Y/2)-5)
			if frame.AbsoluteSize.Y < min then
				frame.Size = UDim2.new(0,frame.AbsoluteSize.X,0,min)
			end
			if frame.AbsoluteSize.Y > max then
				frame.Size = UDim2.new(0,frame.AbsoluteSize.X,0,max)
			end
		end)
	end)
	YScale.MouseButton1Up:Connect(function()
		funY:Disconnect()
	end)

	local funX = nil
	XScale.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(XScale, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
			BackgroundTransparency = 0.25, Size = UDim2.new(0,13,0,215)}):Play()
	end)
	XScale.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(XScale, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
			BackgroundTransparency = 0.5, Size = UDim2.new(0,9,0,150)}):Play()
		if funX then
			funX:Disconnect()
		end
	end)
	XScale.MouseButton1Down:Connect(function()
		funX = game:GetService("RunService").Heartbeat:Connect(function()
			local frame: Frame = Frame.Parent
			local mouse = game.Players.LocalPlayer:GetMouse()
			local min = 280
			local max = 550
			frame.Size = UDim2.new(0,mouse.X-frame.AbsolutePosition.X-(XScale.AbsoluteSize.X/2)-5,0,frame.AbsoluteSize.Y)
			if frame.AbsoluteSize.X < min then
				frame.Size = UDim2.new(0,min,0,frame.AbsoluteSize.Y)
			end
			if frame.AbsoluteSize.X > max then
				frame.Size = UDim2.new(0,max,0,frame.AbsoluteSize.Y)
			end
		end)
	end)
	XScale.MouseButton1Up:Connect(function()
		funX:Disconnect()
	end)

	--buttons functions
	local function OnActive1()
		for _,v in Frame:WaitForChild("Page"):GetChildren() do
			v:Destroy()
		end
		gui:Destroy()
	end
	Close.MouseButton1Down:Connect(OnActive1)
	Close.TouchTap:Connect(OnActive1)

	local vis = true
	local cd = false
	local y = 0
	local x = 0
	local function Hide_UnHide()
		if cd then return end
		cd = true
		vis = not vis
		if vis then
			gui.Enabled = true
			game:GetService("TweenService"):Create(Frame.Parent, TweenInfo.new(0.2), {
				Size = UDim2.new(0, x, 0, y)}):Play()
		else
			y = Frame.Parent.AbsoluteSize.Y
			x = Frame.Parent.AbsoluteSize.X
			game:GetService("TweenService"):Create(Frame.Parent, TweenInfo.new(0.2), {
				Size = UDim2.new(0, Frame.Parent.AbsoluteSize.X, 0, 0)}):Play()
			wait(0.2)
			gui.Enabled = false
		end
		cd = false
	end

	local function OnActive2()

	end
	Settings.MouseButton1Down:Connect(OnActive2)
	Settings.TouchTap:Connect(OnActive2)

	local function OnActive3()
		Hide_UnHide()
	end
	Hide.MouseButton1Down:Connect(OnActive3)
	Hide.TouchTap:Connect(OnActive3)

	table.insert(Actived_Functions, game:GetService("UserInputService").InputBegan:Connect(function(i,g)
		if g then return end
		if i.KeyCode == Enum.KeyCode.K then
			Hide_UnHide()
		end
	end))

	return guiScript1
end

local row = 0
Gui_to_return.Window = function(conf: {})
	local _return = {}
	local gui = create_gui()

	local Text_ = conf.Text or "Window";
	local Key_ = conf.Key or nil;
	local https_ = conf.Https or "None"

	if Key_ and type(Key_) == "string" then
		gui.Enabled = false
		local ScreenGui: ScreenGui = create("ScreenGui", {Name = "ScreenGui";IgnoreGuiInset = true;ResetOnSpawn = false;ZIndexBehavior = Enum.ZIndexBehavior.Sibling;Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")})
		local Frame: Frame = create("Frame", {Name = "Frame";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(0, 300, 0, 100);BackgroundColor3 = Color3.new(0.188235, 0.188235, 0.188235);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Parent = ScreenGui})
		local UICorner: UICorner = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(0, 12);Parent = Frame})
		local key: TextBox = create("TextBox", {Name = "key";Position = UDim2.new(0, 0, 0.85, 0);Size = UDim2.new(1, 0, 0.3, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0, 1);Text = "Enter Key";TextColor3 = Color3.new(0.996078, 0.996078, 0.996078);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039);Parent = Frame})
		local https: TextBox = create("TextBox",{Name = "https";Position = UDim2.new(0.5, 0, 0.1, 0);Size = UDim2.new(0.8, 0, 0.3, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0);Text = https_;TextColor3 = Color3.new(0.52549, 0.52549, 1);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;PlaceholderColor3 = Color3.new(0.52549, 0.52549, 1);Parent = Frame;TextEditable=false;ClearTextOnFocus=false})
		local Crown: ImageLabel = create("ImageLabel",{Name = "Crown";Position = UDim2.new(0.5, 0, 0.15, 0);Size = UDim2.new(0.35, 0, 0.9, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 1);Transparency = 1;Image = "rbxassetid://17409640887";Parent = Frame})
		repeat wait() until key.Text == Key_
		gui.Enabled = true
		ScreenGui:Destroy()
	end

	local Frame: Frame = gui:WaitForChild("Frame"):WaitForChild("Frame")
	local Page = Frame:WaitForChild("Page")
	local templates = gui:WaitForChild("Templates")
	
	local PlrSelect = Frame:WaitForChild("PlrSelect")

	Frame:WaitForChild("name").Text = Text_

	_return.AddPage = function(configurations: {})
		-- GETTED TABLE
		--[[
			ПРИМЕР:
			{OnMouseText = "Eblan", Text = "tosheeblan"}
		]]
		local any = {
			Row = row,
		}

		row += 1
		local _return2 = {}
		local OnMouseText = configurations.OnMouseText or nil
		local PageName = configurations.Text or "Standart Page";
		local sections = {}

		local copied_select_page: TextButton = templates:WaitForChild("TemplatePageSelect"):Clone()
		copied_select_page.Parent = Frame:WaitForChild("PagesSelect"):WaitForChild("Scroll")
		copied_select_page:WaitForChild("Button").Text = PageName

		local function OnActive()
			local PagesSelect = Frame:WaitForChild("PagesSelect")
			game:GetService("TweenService"):Create(PagesSelect:WaitForChild("Line"), TweenInfo.new(0.3334, Enum.EasingStyle.Linear), {
				Position = UDim2.new(0, 5, 0, any.Row*27)}):Play()
			for _, v in Page:GetChildren() do
				v:Destroy()
			end
			for _,v in sections do
				local cont = true
				for i, b in v do
					if b == nil then
						cont = false
						error(i.." Not Finded!")
					end
				end
				if cont then
					local new = templates:FindFirstChild(v.id)
					if new then
						new = new:Clone()
						local ActivateButton: TextButton = new:WaitForChild("ActivateButton")
						new.Parent = Frame:WaitForChild("Page")
						new.Position = UDim2.new(0, 0, 0, 30*(#Frame:WaitForChild("Page"):GetChildren()-1))
						local mousehoverImage2: ImageLabel = nil
						ActivateButton.MouseEnter:Connect(function()
							mousehoverImage2 = templates:WaitForChild("SelectImage"):Clone()
							mousehoverImage2.Parent = new
							local trans = mousehoverImage2.ImageTransparency
							mousehoverImage2.ImageTransparency = 1
							game:GetService("TweenService"):Create(mousehoverImage2, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
								ImageTransparency = trans}):Play()
						end)
						ActivateButton.MouseLeave:Connect(function()
							if mousehoverImage2 then
								game:GetService("Debris"):AddItem(mousehoverImage2, 0.1)
								game:GetService("TweenService"):Create(mousehoverImage2, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
									ImageTransparency = 1}):Play()
							end
						end)
						if v.id == "Slide" then
							local active = false
							local Slider = new:WaitForChild("Slide")
							local Dot = Slider:WaitForChild("Dot")
							new:FindFirstChildOfClass("TextButton").Text = v.Text
							local function OnActive2()
								active = not active
								if active then
									game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
										BackgroundColor3 = Color3.fromRGB(234, 234, 234), Position = UDim2.new(0.5)}):Play()
									game:GetService("TweenService"):Create(Dot:FindFirstChildOfClass("ImageLabel"), TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
										ImageColor3 = Color3.fromRGB(0, 0, 0), ImageTransparency = 0.8}):Play()
								else
									game:GetService("TweenService"):Create(Dot, TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
										BackgroundColor3 = Color3.fromRGB(21, 21, 21), Position = UDim2.new()}):Play()
									game:GetService("TweenService"):Create(Dot:FindFirstChildOfClass("ImageLabel"), TweenInfo.new(0.18, Enum.EasingStyle.Linear), {
										ImageColor3 = Color3.fromRGB(255, 255, 255), ImageTransparency = 0.93}):Play()
								end
								v.Callback(active)
							end
							ActivateButton.MouseButton1Down:Connect(OnActive2);
							ActivateButton.TouchTap:Connect(OnActive2)
						elseif v.id == "TextBox" then
							local txFrame = new:WaitForChild("TextBox")
							local txText: TextBox = txFrame:WaitForChild("TextBox")
							txText.Text = v.StarterValue
							local function OnActive2()
								v.Callback(txText.Text)
							end
							txText.InputEnded:Connect(OnActive2)
						elseif v.id == "ClickButton" then
							new:WaitForChild("Text").Text = v.Text
							local function OnActive2()
								v.Callback()
							end
							ActivateButton.MouseButton1Down:Connect(OnActive2)
							ActivateButton.TouchTap:Connect(OnActive2)
						elseif v.id == "Keybind" then
							new:WaitForChild("Text").Text = v.Text
							new:WaitForChild("KeybindText").Text = v.Keybind.Name
							local function OnActive2(e: Enum.KeyCode)
								if e then
									v.Keybind = e
								end
							end
							table.insert(Actived_Functions, game:GetService("UserInputService").InputBegan:Connect(function(i,g)
								if g then return end
								if i.KeyCode == v.Keybind then
									v.Callback()
								end
							end))
							local function OnActive3()
								local wait_ = game:GetService("UserInputService").InputBegan:Wait()
								if wait_.KeyCode and v.ChangedEnabled then
									v.Keybind = wait_.KeyCode
								end
							end
							ActivateButton.MouseButton1Down:Connect(OnActive3)
							ActivateButton.TouchTap:Connect(OnActive3)
						elseif v.id == "plrSelect" then
							new:WaitForChild("TextLabel").Text = v.Text
							local a
							local function OnActive3()
								if v.PlayerIcon then
									for _,v in PlrSelect:GetChildren() do
										PlrSelect:FindFirstChildOfClass("ImageLabel").ImageTransparency = 0
									end
								else
									for _,v in PlrSelect:GetChildren() do
										PlrSelect:FindFirstChildOfClass("ImageLabel").ImageTransparency = 1
									end
								end
								if not a then
									hide_unhide_bind:Fire(true)
									a = plr_selected.Event:Connect(function(plr)
										v.Callback(plr)
									end)
								else
									hide_unhide_bind:Fire(false)
									a:Disconnect()
								end
							end
							ActivateButton.MouseButton1Down:Connect(OnActive3)
							ActivateButton.TouchTap:Connect(OnActive3)
						elseif v.id == "ColorSelect" then
							
						end
					end
				end
			end
		end
		copied_select_page.Button.MouseButton1Down:Connect(OnActive);
		copied_select_page.Button.TouchTap:Connect(OnActive)
		local mousehoverImage: ImageLabel = nil
		copied_select_page.MouseEnter:Connect(function()
			mousehoverImage = templates:WaitForChild("SelectImage"):Clone()
			mousehoverImage.Parent = copied_select_page
			local trans = mousehoverImage.ImageTransparency
			mousehoverImage.ImageTransparency = 1
			game:GetService("TweenService"):Create(mousehoverImage, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
				ImageTransparency = trans}):Play()
		end)
		copied_select_page.MouseLeave:Connect(function()
			if mousehoverImage then
				game:GetService("Debris"):AddItem(mousehoverImage, 0.1)
				game:GetService("TweenService"):Create(mousehoverImage, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
					ImageTransparency = 1}):Play()
			end
		end)
		Frame:WaitForChild("PagesSelect"):WaitForChild("MaxLine").Size = UDim2.new(0, 5, 0, 27*(#Frame:WaitForChild("PagesSelect"):WaitForChild("Scroll"):GetChildren()-1))
		_return2.Text = function(configurations2: {})
			local Text_ = configurations2.Text or nil
			table.insert(sections, {id = "Text", Text = Text_})
		end
		_return2.ClickButton = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local Text_ = configurations2.Text or nil
			table.insert(sections, {id = "ClickButton", Callback = Callback_, Text = Text_})
		end
		_return2.TextBox = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local StarterValue_ = configurations2.StarterValue or nil
			local Text_ = configurations2.Text or nil
			table.insert(sections, {id = "TextBox", Callback = Callback_, StarterValue = StarterValue_, Text = Text_})
		end
		_return2.Slide = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local Text_ = configurations2.Text or nil
			table.insert(sections, {id = "Slide", Callback = Callback_, Text = Text_})
		end
		_return2.Keybind = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local ChangedEnabled_ = configurations2.ChangedEnabled or nil
			local Keybind_ = configurations2.Keybind or nil
			local Text_ = configurations2.Text or nil;
			table.insert(sections, {id = "Keybind", Callback = Callback_, ChangedEnabled = ChangedEnabled_, Keybind = Keybind_, Text = Text_})
		end
		_return2.ClickButton = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local Text_ = configurations2.Text or nil
			table.insert(sections, {id = "ClickButton", Callback = Callback_, Text = Text_})
		end
		_return2.PlrSelect = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local Text_ = configurations2.Text or nil
			local PlayerIcon_ = configurations2.PlayerIcon or nil
			table.insert(sections, {id = "plrSelect", Callback = Callback_, Text = Text_, PlayerIcon = PlayerIcon_})
		end
		_return2.ColorSelect = function(configurations2: {})
			local Callback_ = configurations2.Callback or nil
			local Text_ = configurations2.Text or nil
			local CallbackOnEnd_ = configurations2.CallbackOnEnd or nil
			table.insert(sections, {id = "ColorSelect", Callback = Callback_, Text = Text_, CallbackOnEnd = CallbackOnEnd_})
		end
		return _return2
	end

	local templates = gui:WaitForChild("Templates")
	return _return
end

return Gui_to_return
