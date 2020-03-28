projectiles = {}
img.projectile = love.graphics.newImage("sprites/projectile.png")


fire = false --fire indicates launching projectile, used to activate the firing animation

function projectileUpdate(dt)

	--projectile direction
	for i,p in ipairs(projectiles) do 
		p.x = p.x +  math.cos(p.angle)* p.speed*dt
		p.y = p.y + math.sin(p.angle)* p.speed*dt
	end

	--deleting projectiles when they exit screen space or if they hit monster
	for i = #projectiles,1,-1 do
		local p = projectiles[i]
		if(p.x<0) or (p.x>window.width) or (p.y<0) or (p.y>window.height) then
			table.remove(projectiles,i)
		end

		if p.hit == true then	--triggered in monster.lua
			table.remove(projectiles,i)
		end
	end

end

function projectileDraw()
	for i,p in ipairs(projectiles) do
		love.graphics.draw(img.projectile, p.x, p.y, p.angle, 0.2,0.2)
	end
end


function move_projectile()
	local projectile = {}
	projectile.img = love.graphics.newImage("sprites/projectile.png")
	projectile.angle = get_mouseAngle()
	projectile.x = player.x ; projectile.y = player.y  
	projectile.speed = player.speed*2.25
	projectile.hit = false


	table.insert(projectiles, projectile)
end
 

 

