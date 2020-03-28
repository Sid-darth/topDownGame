player = {}

img.player_guard =  love.graphics.newImage("sprites/player_guard.png")
img.player_fire = love.graphics.newImage("sprites/player_fire.png")


player.img = img.player_guard

player.x = window.width/2 ; player.y = window.height/2
player.width = img.player_guard:getWidth() ; player.height = img.player_guard:getHeight()
player.speed = 10*30
player.collider = world:newCircleCollider(player.x, player.y,20)
local timer = 0
local currentTime = timer 
function playerUpdate(dt)
	timer = timer + dt
-- player movement
	if gameState == 2 then
		local vectorX = 0; local vectorY = 0
	
		if player.y > 25 and (love.keyboard.isDown('up') or love.keyboard.isDown('w')) then
			-- player.y = player.y - dt*player.speed
			vectorY = -1

		elseif player.y < (window.height -25) and (love.keyboard.isDown('down') or love.keyboard.isDown('s')) then
			-- player.y = player.y + dt*player.speed
			vectorY = 1

		elseif player.x > 25 and (love.keyboard.isDown('left') or love.keyboard.isDown('a')) then
			-- player.x = player.x - dt*player.speed
			vectorX = -1

		elseif player.x < (window.width - 25) and (love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
			-- player.x = player.x + dt*player.speed
			vectorX = 1

		end

		player.collider:setLinearVelocity(vectorX*player.speed, vectorY*player.speed)
	

-- shooting animation
	
		if fire == true then
			currentTime = timer
			player.img = img.player_fire
			fire = false
		end

		if fire == false and timer > (currentTime+0.1) then
			player.img = img.player_guard
		end
	end
 end

 function playerDraw()
 	player.x = player.collider:getX()
	player.y = player.collider:getY()
	
	world:draw()
	love.graphics.draw(player.img, player.x, player.y, 
		get_mouseAngle(), 1/20,1/20,player.img:getWidth()/2,player.img:getHeight()/2)
end


 function get_mouseAngle()
 	theta.mouse = math.atan2(love.mouse.getY() - player.y,
 		love.mouse.getX() - player.x)
 	return theta.mouse
 end


