player = {}

img.player_guard =  love.graphics.newImage("sprites/player_guard.png")
img.player_fire = love.graphics.newImage("sprites/player_fire.png")


player.img = img.player_guard

player.x = window.width/2 ; player.y = window.height/2
player.width = img.player_guard:getWidth() ; player.height = img.player_guard:getHeight()
player.speed = 10*30

local timer = 0
local currentTime = timer 
function playerUpdate(dt)
	timer = timer + dt
-- player movement
	if gameState == 2 then
		if player.y > 25 and (love.keyboard.isDown('up') or love.keyboard.isDown('w')) then
			player.y = player.y - dt*player.speed

		elseif player.y < (window.height -25) and (love.keyboard.isDown('down') or love.keyboard.isDown('s')) then
			player.y = player.y + dt*player.speed

		elseif player.x > 25 and (love.keyboard.isDown('left') or love.keyboard.isDown('a')) then
			player.x = player.x - dt*player.speed

		elseif player.x < (window.width - 25) and (love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
			player.x = player.x + dt*player.speed

		end
	end

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


 function get_mouseAngle()
 	theta.mouse = math.atan2(love.mouse.getY() - player.y,
 		love.mouse.getX() - player.x)
 	return theta.mouse
 end


