local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Project Hydra", "Ocean")
local Tab = Window:NewTab("LocalPlayer")
local Section = Tab:NewSection("LocalPlayer")
Section:NewSlider("Walkspeed", "Changes your walkspeed", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("JumpPower", "Changes your jumppower", 500, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
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
local ScriptsSection = Scripts:NewSection("Prision Life")
ScriptsSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
	local Event = game:GetService("Workspace").Remote.ItemHandler
	Event:InvokeServer(A_1)
end)
ScriptsSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
	local module = nil
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
		module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
	elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
		module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
	end
	if module ~= nil then
		module["MaxAmmo"] = math.huge
		module["CurrentAmmo"] = math.huge
		module["StoredAmmo"] = math.huge
		module["FireRate"] = 0.000001
		module["Spread"] = 0
		module["Range"] = math.huge
		module["Bullets"] = 10
		module["ReloadTime"] = 0.000001
		module["AutoFire"] = true
	end
end)
Section:NewKeybind("GUI Toggle", "Toggles the GUI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
