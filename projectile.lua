projectiles = {}
img.projectile = love.graphics.newImage("sprites/projectile.png")


fire = false --fire indicates launching projectile, used to activate the firing animation


function projectileUpdate(dt)

	--projectile direction
	for i,p in ipairs(projectiles) do		
		p.x = p.x +  math.cos(p.angle)* p.speed*dt
		p.y = p.y + math.sin(p.angle)* p.speed*dt
		if p.deg>-90 and p.deg<0 then
			p.collider:setPosition(p.x+5,p.y+5)
		elseif p.deg < -90 then
			p.collider:setPosition(p.x+5,p.y-5)
		elseif p.deg>0 and p.deg<90 then
			p.collider:setPosition(p.x-5,p.y+5)
		else
			p.collider:setPosition(p.x-5,p.y-5)
		end
	end

	

	--deleting projectiles when they exit screen space or if they hit monster
	for i = #projectiles,1,-1 do
		local p = projectiles[i]
		if(p.x<0) or (p.x>window.width) or (p.y<0) or (p.y>window.height) then
			table.remove(projectiles,i)
		end

		for j,m in ipairs(monsters_1) do
			if p.collider:enter('Monsters_1') then
				p.hit = true
				
			end
		end

		if p.hit == true then	--triggered in monster.lua
			table.remove(projectiles,i)
			p.collider:destroy()
		elseif p.fire==true then
			table.remove(projectiles,i)
		end
	end

	

end

function projectileDraw()
	-- world:draw()

	for i,p in ipairs(projectiles) do
		-- p.x = p.collider:getX()
		-- p.y = p.collider:getY()
		love.graphics.draw(img.projectile, p.x, p.y, p.angle, 0.2,0.2)
	end
end


function move_projectile()
	local projectile = {}
	projectile.img = love.graphics.newImage("sprites/projectile.png")
	projectile.angle = player:angle()
	projectile.deg = player:angle()*180/math.pi
	projectile.x = player.x ; projectile.y = player.y  
	projectile.speed = player.speed*1.5
	projectile.hit = false
	projectile.fire = false

	projectile.collider = world:newCircleCollider(projectile.x,projectile.y,2)
	projectile.collider:setCollisionClass('Projectile')
	projectile.collider:setObject(p)

	table.insert(projectiles, projectile)
end
 

 

