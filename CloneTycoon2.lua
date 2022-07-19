	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("Project Hydra", "Ocean")
	local Tab = Window:NewTab("Main")
	local Section = Tab:NewSection("Character Modification")
	Section:NewSlider("Health Hack", "Slide to increase your health", 500, 100, function(s)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = s
	end)
	Section:NewSlider("Walkspeed", "Slide to change your Walkspeed", 500, 16, function(s)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = s
	end)
	Section:NewSlider("Jumppower", "Slide to change your Jumppower", 500, 50, function(s)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").UseJumpPower = true -- uses jump power :)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = s
	end)
	Section:NewKeybind("GUI Toggle", "Toggles the GUI", Enum.KeyCode.RightShift, function()
		Library:ToggleUI()
	end)
	local Section2 = Tab:NewSection("Game Modification")
	Section2:NewToggle("Ore Farm", "Stand near your ore refinery and it will automatically farm money", function(pog)
		function FindSelfTycoon()
			for i,v in pairs(game:GetService("Workspace").Tycoons:GetChildren()) do
				if (v.Factory.Player.Value == game.Players.LocalPlayer.Name) then
					return v
				end
			end
		end

		while true do
			do
				fireproximityprompt(FindSelfTycoon().Factory.Objects.BoughtItems["Ore Refinery"].SpellVortex.Main.Attachment.SellOres)
			end

			do
				local minnerai = {
					"Coal",
					"Iron",
					"Gold",
					"Diamonds",
					"Stone",
				}

				for i,v in pairs(minnerai) do
					workspace.Events.DataStores.uhoh:FireServer("mine",v)
				end
			end

			game.RunService.RenderStepped:Wait()
		end
	end)
	local Tab2 = Window:NewTab("Admin Scripts")
	local Tab2Section = Tab2:NewSection("Scripts")
	Tab2Section:NewButton("Infinite Yield Admin", "Gives you admin commands", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true)()
	end)
	Tab2Section:NewButton("Basic ESP", "Allows you to see all players", function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/zachisfunny/ROBLOX-ESP/main/Script'),true))()
	end)
	Tab2Section:NewButton("Fate's Admin", "Gives you admin commands", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua'),true)()
	end)
