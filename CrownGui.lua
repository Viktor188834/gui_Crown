

local function create(name, prop)
	local a = Instance.new(name);
	for i,v in pairs(prop) do
		a[i] = v
	end
	return a
end

local Gui_to_return = {}
local Actived_Functions = {}

function Starter()
	local Animation = create("ScreenGui", {Name = "Animation";IgnoreGuiInset = true;ResetOnSpawn = false;ZIndexBehavior = Enum.ZIndexBehavior.Sibling;Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")});
	local Frame = create("Frame", {Name = "Frame";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(0, 350, 0, 70);BackgroundColor3 = Color3.new(0.113725, 0.113725, 0.113725);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Parent = Animation});
	local Crown = create("ImageLabel", {Name = "Crown";Position = UDim2.new(0.442857, 45, 5.157143, 0);Size = UDim2.new(0, 70, 0, 60);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 3;Rotation = -10;AnchorPoint = Vector2.new(0.5, 0.5);Image = "rbxassetid://17409640887";Parent = Frame});
	local Text = create("TextLabel", {Name = "Text";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "Gui Created Speccialy For <font color='rgb(255, 255, 0)'>Crown Softworks</font>";TextColor3 = Color3.new(1, 1, 1);TextSize = 21;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextWrapped = true;RichText = true;Parent = Frame});
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
	{Starter_Guis.Crown, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {Position = UDim2.new(0.442857, 45, 0.047143, 0), Rotation = 0}};
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
	local guiScript16 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = guiScript15})
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
	local guiScript30 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = guiScript28})
	local guiScript31 = create("TextButton", {Name = "TemplatePageSelect";Size = UDim2.new(1, 0, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);RichText = true;Parent = guiScript25})
	local guiScript54 = create("TextButton", {Name = "Button";Size = UDim2.new(1, 0, 0, 27);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 15;Text = "PageName";TextColor3 = Color3.new(0.952941, 0.952941, 0.952941);TextSize = 19;TextTransparency = 0;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);RichText = true;AutoButtonColor = false;Parent = guiScript31})
	local guiScript55 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = guiScript54})
	local guiScript56 = create("Frame", {Name = "MouseText";Position = UDim2.new(0.49, 0, 0, 13);Size = UDim2.new(0.75, 0, 0, 0);BackgroundColor3 = Color3.new(0.207843, 0.207843, 0.207843);BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0);Parent = guiScript31})
	local guiScript57 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(0, 5);Parent = guiScript56})
	local guiScript58 = create("ImageLabel", {Name = "Shadow";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1, 0, 2, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 0;AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.800000011920929;Parent = guiScript56})
	local text = create("TextLabel", {Name = "text";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;TextColor3 = Color3.new(1, 1, 1);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;Parent = guiScript56})
	local UIStroke3 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = text})
	local TextBox = create("Frame", {Name = "TextBox";Position = UDim2.new(0, 0, 0, 120);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text6 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Text = "TextBox";TextTransparency = 0;TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;Parent = TextBox})
	local UIStroke4 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = Text6})
	local ActivateButton = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";TextTransparency = 0;TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = TextBox})
	local hor = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = TextBox})
	local UICorner7 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = hor})
	local TextBox2 = create("Frame", {Name = "TextBox";Position = UDim2.new(1, -15, 0.5, 0);Size = UDim2.new(0, 150, 0.6, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Parent = TextBox})
	local TextBox3 = create("TextBox", {Name = "TextBox";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "StarterValue";TextColor3 = Color3.new(1, 1, 1);TextSize = 14;TextTransparency = 0;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;TextXAlignment = Enum.TextXAlignment.Right;RichText = true;Parent = TextBox2})
	local UIStroke5 = create("UIStroke", {Name = "UIStroke";Parent = TextBox3})
	local UICorner8 = create("UICorner", {Name = "UICorner";Parent = TextBox2})
	local ImageLabel = create("ImageLabel", {Name = "ImageLabel";Position = UDim2.new(0.5, 0, 0.5, 0);Size = UDim2.new(1.3, 0, 1.5, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://7928096707";ImageTransparency = 0.8999999761581421;Parent = TextBox2})
	local Slide = create("Frame", {Name = "Slide";Position = UDim2.new(0, 0, 0, 90);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local UIStroke6 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = guiScript28})
	local ActivateButton2 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Text = "";TextTransparency = 0;TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = Slide})
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
	local UIStroke8 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = Text3})
	local ActivateButton3 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = Keybind})
	local _3 = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = Keybind})
	local UICorner12 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = _3})
	local KeybindText = create("TextLabel", {Name = "KeybindText";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 25, 0, 25);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);TextTransparency = 0;Text = "T";TextColor3 = Color3.new(0.937255, 0.937255, 0.937255);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextScaled = true;TextWrapped = true;RichText = true;Parent = Keybind})
	local UIStroke9 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = KeybindText})
	local ClickButton = create("Frame", {Name = "ClickButton";Position = UDim2.new(0, 0, 0, 30);Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text4 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);TextTransparency = 0;Text = "ClickButton";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;Parent = ClickButton})
	local UIStroke10 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = Text4})
	local ActivateButton4 = create("TextButton", {Name = "ActivateButton";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);TextTransparency = 0;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);AutoButtonColor = false;Parent = ClickButton})
	local _4 = create("Frame", {Name = "|";Position = UDim2.new(0, 15, 0.5, 0);Size = UDim2.new(0, 3, 0.8, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.30000001192092896;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 0.30000001192092896;Parent = ClickButton})
	local UICorner13 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = _4})
	local LeftTrow = create("ImageLabel", {Name = "LeftTrow";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 3;AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Image = "rbxassetid://2418686949";Parent = ClickButton})
	local CanvasGroup2 = create("CanvasGroup", {Name = "CanvasGroup";Position = UDim2.new(1, -9, 0.5, 0);Size = UDim2.new(0, 45, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0.5);Transparency = 1;Parent = ClickButton})
	local ImageLabel4 = create("ImageLabel", {Name = "ImageLabel";Size = UDim2.new(0, 90, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Image = "rbxassetid://7928096707";ImageColor3 = Color3.new(0, 0, 0);ImageTransparency = 0.699999988079071;Parent = CanvasGroup2})
	local Section = create("Frame", {Name = "Section";Size = UDim2.new(1, 0, 0, 30);BackgroundColor3 = Color3.new(0.219608, 0.219608, 0.219608);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Parent = guiScript25})
	local Text5 = create("TextLabel", {Name = "Text";Position = UDim2.new(1, 0, 0, 0);Size = UDim2.new(1, -30, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(1, 0);Transparency = 1;Text = "SectionName";TextColor3 = Color3.new(0.917647, 0.917647, 0.917647);TextSize = 22;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);TextXAlignment = Enum.TextXAlignment.Left;RichText = true;Parent = Section})
	local UIStroke11 = create("UIStroke", {Name = "UIStroke";Thickness = 2;Parent = Text5})
	local ImageButton = create("ImageButton", {Name = "ImageButton";Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);Transparency = 1;Image = "rbxassetid://11552476728";Parent = Section})
	local More = create("Frame", {Name = "More";Size = UDim2.new(1, 0, 1, 0);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);ZIndex = 50;Transparency = 1;Parent = guiScript2})
	local YScale:TextButton = create("TextButton", {Name = "YScale";Position = UDim2.new(0.5, 0, 1, 5);Size = UDim2.new(0, 150, 0, 9);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.5;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0);Transparency = 0.5;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);Parent = More, AutoButtonColor = false})
	local UICorner99 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = YScale})
	local XScale = create("TextButton", {Name = "XScale";Position = UDim2.new(1, 5, 0.5, 0);Size = UDim2.new(0, 5, 0, 150);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 0.5;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0, 0.5);Transparency = 0.5;Text = "";TextColor3 = Color3.new(0, 0, 0);TextSize = 14;FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);Parent = More, AutoButtonColor = false})
	local UICorner99 = create("UICorner", {Name = "UICorner";CornerRadius = UDim.new(1, 0);Parent = XScale})
	local Close = create("ImageButton", {Name = "Close";Position = UDim2.new(1, -20, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://90965270530088";Parent = More})
	local Settings = create("ImageButton", {Name = "Settings";Position = UDim2.new(1, -90, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://112630223329701";Parent = More})
	local Hide = create("ImageButton", {Name = "Hide";Position = UDim2.new(1, -55, 0, 20);Size = UDim2.new(0, 30, 0, 30);BackgroundColor3 = Color3.new(1, 1, 1);BackgroundTransparency = 1;BorderSizePixel = 0;BorderColor3 = Color3.new(0, 0, 0);AnchorPoint = Vector2.new(0.5, 0.5);Transparency = 1;Image = "rbxassetid://15396333997";Parent = More})
	
	local gui = guiScript1
	local Frame = gui:WaitForChild("Frame"):WaitForChild("Frame")
	
	table.insert(Actived_Functions, game:GetService("RunService").Heartbeat:Connect(function()
		game:GetService("TweenService"):Create(gui:WaitForChild("Shadow"), TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
			Position = UDim2.new(0, (Frame.AbsolutePosition.X+(Frame.AbsoluteSize.X/2)),0, (Frame.AbsolutePosition.Y+(Frame.AbsoluteSize.Y/1.5)))}):Play()
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
	local https_ = conf.Https or nil
	
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
		return _return2
	end

	local templates = gui:WaitForChild("Templates")
	return _return
end

return Gui_to_return
