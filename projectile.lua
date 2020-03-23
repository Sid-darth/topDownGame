projectiles = {}



fire = false

function projectileUpdate(dt)

	--projectile direction
	for i,p in ipairs(projectiles) do 
		p.x = p.x +  math.cos(p.angle)* p.speed*dt
		p.y = p.y + math.sin(p.angle)* p.speed*dt
	end

end

function move_projectile()
	local projectile = {}
	projectile.img = love.graphics.newImage("sprites/projectile.png")
	projectile.angle = get_mouseAngle()
	projectile.x = player.x ; projectile.y = player.y  
	projectile.speed = player.speed*3
	hit = false


	table.insert(projectiles, projectile)
end
 

 function love.mousepressed(x,y,b, istouch)
 	if b==1 and gameState == 2 then
 		move_projectile()
 		fire = true
 		
 	end
 end