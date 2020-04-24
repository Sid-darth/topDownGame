player = {}
local timer = 0
local currentTime = timer 

function player:new()
	img.player_guard =  love.graphics.newImage("sprites/player_guard.png")
	img.player_fire = love.graphics.newImage("sprites/player_fire.png")

	self.img = img.player_guard
	self.x = window.width/2 ; self.y = window.height/2
	self.width = img.player_guard:getWidth() ; self.height = img.player_guard:getHeight()
	self.speed = 10*30
	self.collider = world:newCircleCollider(self.x,self.y,20)
	self.collider:setCollisionClass('Player')
	self.collider:setObject(self)
	
end


function player:update(dt)
	timer = timer+dt

	--player movement
	if gameState == 2 then
		local vectorX = 0; local vectorY = 0
	
		-- if self.y > 25 and (love.keyboard.isDown('up') or love.keyboard.isDown('w')) then
			-- player.y = player.y - dt*player.speed
		-- elseif self.y < (window.height -25) and (love.keyboard.isDown('down') or love.keyboard.isDown('s')) then
			-- player.y = player.y + dt*player.speed
		-- elseif self.x > 25 and (love.keyboard.isDown('left') or love.keyboard.isDown('a')) then
			-- player.x = player.x - dt*player.speed
		-- elseif self.x < (window.width - 25) and (love.keyboard.isDown('right') or love.keyboard.isDown('d')) then
			-- player.x = player.x + dt*player.speed

		if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
			vectorY = -1
		elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') then
			vectorY = 1
		elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') then
			vectorX = -1
		elseif love.keyboard.isDown('right') or love.keyboard.isDown('d') then
			vectorX = 1

		end

		self.collider:setLinearVelocity(vectorX*player.speed, vectorY*player.speed)

		-- shooting animation
		if fire == true then
			currentTime = timer
			self.img = img.player_fire
			fire = false
		end

		if fire == false and timer > (currentTime+0.1) then
			self.img = img.player_guard
		end

		-- for i,m1 in ipairs(monsters_1) do
		-- 	if self.collider:enter('Monsters_1') then
		-- 		m1.flag = 1
		-- 	end
		-- end
		--...

	end
end

function player:draw()
	self.x = self.collider:getX()
	self.y = self.collider:getY()
	love.graphics.draw(self.img,self.x,self.y,player:angle(),
		1/20,1/20,self.width/2,self.height/2)
	love.graphics.print('Angle'.. player:angle()..'rad\n'.. (player:angle()*180/math.pi)..'degs')
end


function player:angle()
	--local theta = math.atan2(love.mouse.getY()-self.y,love.mouse.getX()-self.x)
	local theta = math.atan2(mouseY-self.y,mouseX-self.x)
	return theta
end

