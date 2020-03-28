objects = {}


gameMap = sti("maps/map_1.lua")

for i, obj in pairs(gameMap.layers["object_layer"].objects) do
	spawn_object(obj.x, obj.y, obj.width, obj.height)
end


