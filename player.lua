player = {}

player.x = window.width/2 ; player.y = window.height/2
player.width = img.player_guard:getWidth() ; player.height = img.player_guard:getHeight()
player.speed = 10*30


function playerUpdate(dt)

-- player movement
	if gameState == 2 then
		if player.y > 0 and love.keyboard.isDown('up') or love.keyboard.isDown('w') then
			player.y = player.y - dt*player.speed

		elseif player.y < window.height and love.keyboard.isDown('down') or love.keyboard.isDown('s') then
			player.y = player.y + dt*player.speed

		elseif player.x > 0 and love.keyboard.isDown('left') or love.keyboard.isDown('a') then
			player.x = player.x - dt*player.speed

		elseif player.x < window.width and love.keyboard.isDown('right') or love.keyboard.isDown('d') then
			player.x = player.x + dt*player.speed

		end
	end
 end

 function get_mouseAngle()
 	theta.mouse = math.atan2(love.mouse.getY() - player.y,
 		love.mouse.getX() - player.x)
 	return theta.mouse
 end
