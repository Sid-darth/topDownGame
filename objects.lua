objects = {}
shotWall = false


gameMap = sti("maps/map_1.lua")

for i, obj in pairs(gameMap.layers["object_layer"].objects) do
	spawn_object(obj.x, obj.y, obj.width, obj.height)
end

function objectUpdate(dt)

	--projectile hitting wall
	local w = 0 ; local h = 0


	for i, obj in pairs(gameMap.layers["object_layer"].objects) do
		for j,p in ipairs(projectiles) do
			if (obj.x+w) < (obj.x+obj.width) then
				if distance(p.x,p.y,obj.x+w,obj.y) <20 then
					p.fire = true
				end
				w = w + 0.1
			-- else w = 0

			elseif (obj.y+h) < (obj.y+obj.height) then
				if distance(p.x,p.y,obj.x,obj.y+h) <20 then
					p.fire = true
				end
				h = h + 0.1
			else h = 0 ; w =0
			end
		end
	end
end