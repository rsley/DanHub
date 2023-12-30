-- Credits to gamerlel1224 for the initial code and GUI
-- Modified for my needs.

local scriptexecutorguibygamerlel1224 = Instance.new("ScreenGui")
local mainexploit = Instance.new("Frame")
local script = Instance.new("TextBox")
local execute = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
--Properties:
scriptexecutorguibygamerlel1224.Name = "script executor gui by gamerlel1224"
scriptexecutorguibygamerlel1224.Parent = game.CoreGui
mainexploit.Name = "main exploit"
mainexploit.Parent = scriptexecutorguibygamerlel1224
mainexploit.BackgroundColor3 = Color3.new(0.333333, 1, 0)
mainexploit.BorderColor3 = Color3.new(1, 0, 0)
mainexploit.Position = UDim2.new(0.0254549254, 0, 0.448881775, 0)
mainexploit.Size = UDim2.new(0, 253, 0, 309)
mainexploit.Active = true
mainexploit.Draggable = true
 
script.Name = "script"
script.Parent = mainexploit
script.BackgroundColor3 = Color3.new(1, 1, 1)
script.Position = UDim2.new(0.0355731212, 0, 0.0873786435, 0)
script.Size = UDim2.new(0, 237, 0, 219)
script.Font = Enum.Font.SourceSans
script.Text = ""
script.TextColor3 = Color3.new(0, 0, 0)
script.TextSize = 14
script.TextWrapped = true
 
execute.Name = "execute"
execute.Parent = mainexploit
execute.BackgroundColor3 = Color3.new(1, 1, 1)
execute.Position = UDim2.new(0.102766797, 0, 0.815533996, 0)
execute.Size = UDim2.new(0, 200, 0, 50)
execute.Font = Enum.Font.SourceSans
execute.Text = "Execute"
execute.TextColor3 = Color3.new(0, 0, 0)
execute.TextSize = 14
execute.MouseButton1Click:connect(function()
    loadstring([[repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Building Tools")
Tool = game.Players.LocalPlayer.Character:FindFirstChild("Building Tools");
Core = {SyncAPI = Tool.SyncAPI}
function reload()
	repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Building Tools")
Tool = game.Players.LocalPlayer.Character:FindFirstChild("Building Tools");
Core = {SyncAPI = Tool.SyncAPI}
end



-- Import relevant references
local Materials = {
	[Enum.Material.SmoothPlastic] = 'Smooth Plastic';
	[Enum.Material.Plastic] = 'Plastic';
	[Enum.Material.Brick] = 'Brick';
	[Enum.Material.Cobblestone] = 'Cobblestone';
	[Enum.Material.Concrete] = 'Concrete';
	[Enum.Material.CorrodedMetal] = 'Corroded Metal';
	[Enum.Material.DiamondPlate] = 'Diamond Plate';
	[Enum.Material.Fabric] = 'Fabric';
	[Enum.Material.Foil] = 'Foil';
	[Enum.Material.Granite] = 'Granite';
	[Enum.Material.Grass] = 'Grass';
	[Enum.Material.Ice] = 'Ice';
	[Enum.Material.Marble] = 'Marble';
	[Enum.Material.Metal] = 'Metal';
	[Enum.Material.Neon] = 'Neon';
	[Enum.Material.Pebble] = 'Pebble';
	[Enum.Material.Sand] = 'Sand';
	[Enum.Material.Slate] = 'Slate';
	[Enum.Material.Wood] = 'Wood';
	[Enum.Material.WoodPlanks] = 'Wood Planks';
	[Enum.Material.Glass] = 'Glass';
};












function CreatePart(Type,cf)

	-- Send the creation request to the server
	local Part = Core.SyncAPI:Invoke('CreatePart', Type, cf);

return Part

end;
function Recolortool(Color)
	Core.SyncAPI:Invoke('RecolorHandle',Color)
end
function Cloner(Parts)
	return Core.SyncAPI:Invoke('Clone',Parts)
end

function Remove(Parts)
	Core.SyncAPI:Invoke('Remove',Parts)
end

function Color(Parts,Color1)
		local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, Color = Color1 });
		end
Core.SyncAPI:Invoke('SyncColor',Changes)
end

function Collision(Parts,Value)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, CanCollide = Value });
		end
Core.SyncAPI:Invoke('SyncCollision',Changes)
end

function CreateWeld(Parts,Part)
	return Core.SyncAPI:Invoke('CreateWelds',Parts,Part)
end

function RemoveWeld(Welds)
	return Core.SyncAPI:Invoke('RemoveWelds',Welds)
end

function Anchor(Parts,Value)
		local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, Anchored = Value });
		end
	Core.SyncAPI:Invoke('SyncAnchor',Changes)
end

function CreateMesh(Parts)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part });
		end
	return Core.SyncAPI:Invoke('CreateMeshes',Changes)
end

function ChangeMesh(Parts,Prop,Value)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part , [Prop] = Value});
		end
Core.SyncAPI:Invoke('SyncMesh',Changes)
end

function ChangeTexture(Parts,Type,Prop,Value)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part,TextureType = Type, [Prop] = Value });
		end
	return Core.SyncAPI:Invoke('CreateTextures',Changes)
end

function ChangeSurface(Parts,Prop,Value)
	
	local Changes = {}
	local Surfaces = {}
	for i,Part in pairs(Parts) do
		Surfaces[Prop] = Part[Prop .. 'Surface'];
		table.insert(Changes, { Part = Part, Surfaces = Surfaces });
		end
	Core.SyncAPI:Invoke('SyncSurface', Changes);
end

function CreateDec(Parts,Type)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, DecorationType = Type });
		end
	return Core.SyncAPI:Invoke('CreateDecorations', Changes);
end

function ChangeDec(Parts,Type,Prop,Value1)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, DecorationType = Type, [Prop] = Value1 });
		end
	Core.SyncAPI:Invoke('SyncDecorate', Changes);
end

function CreateTexture(Parts,Type)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part,TextureType = Type });
		end
	return Core.SyncAPI:Invoke('CreateTextures',Changes)
end

function MakeLight(Parts,Type)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part,LightType = Type });
		end
	return Core.SyncAPI:Invoke('CreateLights',Changes)
end



function ChangeLight(Parts,Type,Prop,Value1)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, LightType = Type, [Prop] = Value1 });
		end
	Core.SyncAPI:Invoke('SyncLighting', Changes);
end

function Visual(Property,Value,Parts)
		local Changes = {}
		for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, [Property] = Value });
		end
Core.SyncAPI:Invoke('SyncMaterial',Changes)
end;

function Move(Parts,CF)
	local Changes = {}
	for i,Part in pairs(Parts) do
	table.insert(Changes, { Part = Part, CFrame = CF });
	end
	Core.SyncAPI:Invoke('SyncMove', Changes);
end

function Resize(Parts,Size)
	local Changes = {}
	for i,Part in pairs(Parts) do
		table.insert(Changes, { Part = Part, Size = Size, CFrame = Part.CFrame });
		end
		Core.SyncAPI:Invoke('SyncResize', Changes);
end







]].. script.Text)
end)
 
TextLabel.Parent = mainexploit
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.Size = UDim2.new(0, 253, 0, 27)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "GUI By: gamerlel1224"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 14