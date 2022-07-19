local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Project Hydra", "Ocean")
local Tab = Window:NewTab("LocalPlayer")
local Section = Tab:NewSection("LocalPlayer")
Section:NewSlider("Walkspeed", "Slide to change your Walkspeed", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("Jumppower", "Slide to change your Jumppower", 500, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)
Section:NewToggle("Fly", "Allows you to fly", function(state)
	if state then
		local FlyingKey = Enum.KeyCode.B
		loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
	else
		local FlyingKey = Enum.KeyCode.B
		loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
	end
end)
Section:NewToggle("Infinite Jump", "Removes the jump limit", function(v)
	getgenv().infjump = v
	local Player = game:GetService'Players'.LocalPlayer;
	local UIS = game:GetService'UserInputService';
	_G.JumpHeight = 50;

	function Action(Object, Function) if Object ~= nil then Function(Object); end end

	UIS.InputBegan:connect(function(UserInput)
		if not getgenv().infjump then return end
		if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
			Action(Player.Character.Humanoid, function(self)
				if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
					Action(self.Parent.HumanoidRootPart, function(self)
						self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
					end)
				end
			end)
		end
	end)
end)

--SKRIPT HUB--
local Scripts = Window:NewTab("Script Hub")
local ScriptsSection = Scripts:NewSection("Scripts")
ScriptsSection:NewButton("Infinite Yield Admin", "Gives you admin commands", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true)()
end)
ScriptsSection:NewButton("Basic ESP", "Allows you to see all players", function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/zachisfunny/ROBLOX-ESP/main/Script'),true))()
end)
ScriptsSection:NewButton("Fate's Admin", "Gives you admin commands", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua'),true)()
end)
local ScriptsSection = Scripts:NewSection("Ninja Legends")
ScriptsSection:NewToggle("Auto Swing", "Make your player autoswing", function(v)
	getgenv().autoswing = v
	while true do
		if not getgenv().autoswing then return end
		for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:FindFirstChild("ninjitsuGain") then
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
				break
			end
		end
		local A_1 = "swingKatana"
		local Event = game:GetService("Players").LocalPlayer.ninjaEvent
		Event:FireServer(A_1)
		wait(0.1)
	end
end)

ScriptsSection:NewToggle("Auto Sell", "Makes your player autosell", function(v)
	getgenv().autosell = v
	while true do
		if getgenv().autoswing == false then return end
		game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(0.1)
		game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
		wait(0.1)
	end
end)

ScriptsSection:NewButton("Unlock all islands", "Unlocks all islands", function()
	local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
		wait(0.1)
	end
	wait(0.1)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
end)

ScriptsSection:NewToggle("Auto buy all swords", "Auto buys all swords", function(v)
	getgenv().buyswords = v
	while true do
		if not getgenv().buyswords then return end
		local A_1 = "buyAllSwords"
		local A_2 = "Inner Peace Island"
		local Event = game:GetService("Players").LocalPlayer.ninjaEvent
		Event:FireServer(A_1, A_2)
		wait(0.5)
	end
end)

ScriptsSection:NewToggle("Auto buy all belts", "Auto buys all belts", function(v)
	getgenv().buybelts = v
	while true do
		if not getgenv().buybelts then return end
		local A_1 = "buyAllBelts"
		local A_2 = "Inner Peace Island"
		local Event = game:GetService("Players").LocalPlayer.ninjaEvent
		Event:FireServer(A_1, A_2)
		wait(0.5)
	end
end)
Section:NewKeybind("GUI Toggle", "Toggles the GUI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
