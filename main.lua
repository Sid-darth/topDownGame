function love.load()
	love.window.setMode(1000, 660)
	love.graphics.setBackgroundColor(0.25,0.41,0.15)

	windfield = require('windfield-master/windfield') --box2D library
	world = windfield.newWorld()
	world:addCollisionClass('Player')
	world:addCollisionClass('Monsters_1')
	world:addCollisionClass('Projectile')
	sti = require("tiled-master/sti") --library for tiled
	
	img = {} --table with sprites listed
	img.background = love.graphics.newImage("sprites/background.png")

	score = 0


	gameState = 1
	window = {}
	theta = {}
	window.width = love.graphics.getWidth() ; window.height = love.graphics.getHeight()
	
	require('player')
	player:new()
	require('projectile')
	require('monster')
	require('sounds')
	require('objects')
	cameraFile = require("hump/camera")
	camera = cameraFile(player.x,player.y)
	font = love.graphics.newFont(30)

	world:setQueryDebugDrawing(false)
	

end

function love.update(dt)
	world:update(dt)
	gameMap:update(dt)

	player:update(dt)
	projectileUpdate(dt)
	monsterUpdate(dt)
	objectUpdate(dt)
	camera:lookAt(player.x,player.y)
	mouseX, mouseY = camera:mousePosition() --mouse position awareness with camera translation
end

function love.draw()
	-- world:draw()
	camera:attach()
	player:draw()
	gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
	
	projectileDraw()
	m1Draw()
	
	-- love.graphics.draw(img.monster_1, 100, 100, get_monsterAngle()
	love.graphics.setFont(font)
	love.graphics.printf("SCORE: "..score, 0, 50, love.graphics.getWidth(),"center")
	love.graphics.print('\nx:'..player.x..'y:'..player.y)


	camera:detach()

end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'return' then
		gameState = 2
	end
end

function love.mousepressed(x,y,b, istouch)
 	if b == 1 and gameState == 2 then
 		move_projectile()
 		fire = true	
 		laser_shot:play()
 	end


 end

 function distance(x1,y1, x2,y2)
 	d = math.sqrt((x1-x2)^2 + (y1-y2)^2)
 	return d
 end

function spawn_object(x,y,w,h)
	local object = {}
	object = world:newRectangleCollider(x,y,w,h)
	object:setType('static')

	table.insert(objects, object)
end
