-- Library Loadstring
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))() -- This is load the Kavo UI library as a string
-- Library UI
local Window = Library.CreateLib("Project Hydra", "Ocean") -- This creates the library that includes the sections and tabs
local Tab = Window:NewTab("Main")-- This creates a new tab in the library
local Tab2 = Window:NewTab("Miscellaneous")
local Tab3 = Window:NewTab("Admin Scripts")
local CreditsTab = Window:NewTab("Credits")
-- Tab 1
local Section = Tab:NewSection("Character Modification") -- A section to make which used to separate every single buttons
local Section2 = Tab:NewSection("Advanced Modifications")
-- Tab 2
local Tab2Section = Tab2:NewSection("Weapon Giver")
-- Tab 3
local Tab3Section = Tab3:NewSection("Admin Scripts")
-- Credits Tab
local CreditsSection = CreditsTab:NewSection("Credits")

-- Sections

-- Tab 1, Section 1
Section:NewSlider("Health Hack", "Slide to set the amount of health you want", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MaxHealth = 500
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = s
end)

Section:NewSlider("Walkspeed", "Slide to change your Walkspeed", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = s
end)

Section:NewSlider("Jumppower", "Slide to change your Jumppower", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").UseJumpPower = true
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = s
end)

-- Tab 1, Section 2

Section2:NewToggle("Fly", "Allows you to fly", function(state)
	if state then
		local FlyingKey = Enum.KeyCode.B
		loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
	else
		local FlyingKey = Enum.KeyCode.B
		loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
	end
end)

Section2:NewButton("Suicide", "Kills your roblox character", function()
	local playerToSuicide = game.Players.LocalPlayer
	playerToSuicide.Character:FindFirstChildOfClass("Humanoid").Health = 0
	print("You just fucking commited a suicide, your a dumbass")
end)

-- Tab 2, Section 1
Tab2Section:NewButton("BTool Destroy Tool", "Just for some fun :) Controls printed in console", function()
	loadstring(game:GetObjects("rbxassetid://282948276")[1].Source)() -- made by TheC0mmunity, a famous roblox hecker
	print("Btools Loaded, Press X so that itll start jamming some stuff once you click your left mouse button ;)")
end)

Tab2Section:NewToggle("Coin Farm + God", "Teleport to every coin", function(omg)
	local toggle = false

	if toggle == false then
		toggle = true
		print("Coin farm enabled")
	else
		toggle = false
		print("Coin farm disabled")
	end

	while toggle do wait(.25)
		local place = game.Workspace:GetChildren()	
		local currentX = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
		local currentY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
		local currentZ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z

		for i,v in pairs(place) do	    
			local vChildren = v:GetChildren()
			for i,child in pairs(vChildren) do
				if child.Name == "CoinContainer" then

					if child.Coin_Server:FindFirstChild("Coin") ~= nil then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.Coin_Server.Coin.CFrame
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)
						print("coin not enabled!!!")
						toggle = false
					end

				end
			end	
		end
	end

end)

Tab2Section:NewButton("Gun Drop Teleporter", "Teleports you whenever the gun drops", function()
	local currentX = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
	local currentY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
	local currentZ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z	

	if workspace:FindFirstChild("GunDrop") ~= nil then

		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("GunDrop").CFrame	
		wait(.25)	
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)

	else
		print("No gun yet")
	end
end)

Tab2Section:NewButton("Murder all (Only for murderer)", "This makes you kill all the innocents", function()
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") ~= nil then -- Only works if you're the murderer

		local Players = game:GetService("Players")	
		for i, Victim in pairs(Players:GetPlayers()) do
			if Victim.Name ~= game.Players.LocalPlayer.Name then

				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Victim.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
				until
				Victim.Character.Humanoid.Health == 0

			end
		end

	else
		print("No victims killed")
	end
end)

-- Tab 3, Section 1

Tab3Section:NewButton("Fate's Admin (LAGGY FOR POTATO DEVICES)", "FE Admin script", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	print("Fate's admin loaded")
end)

Tab3Section:NewButton("Infinite Yield Admin", "FE Admin script 2", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
	print("Infinite Yield loaded")
end)

-- Credits Tab

CreditsSection:NewLabel("Owner: Deadless#8554")
CreditsSection:NewLabel("Main Developer: RTLua#2400")
CreditsSection:NewLabel("Server: dsc.gg/hydrascripts")
CreditsSection:NewLabel("YouTube channel: https://www.youtube.com/c/RandomTroubleshooterLua")
CreditsSection:NewLabel("Thank you for using Project Hydra! :)")
Section:NewKeybind("GUI Toggle", "Toggles the GUI", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
