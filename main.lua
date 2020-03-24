function love.load()
love.window.setMode(900,550)
love.graphics.setBackgroundColor(0.65,0.1,0.15)
img = {} --table with sprites listed
img.background = love.graphics.newImage("sprites/background.png")

score = 0



gameState = 1
window = {}
theta = {}
window.width = love.graphics.getWidth() ; window.height = love.graphics.getHeight()
require('player')
require('projectile')
require('monster')



end

function love.update(dt)

	playerUpdate(dt)
	projectileUpdate(dt)
	monsterUpdate(dt)



end

function love.draw()
	love.graphics.draw(img.background, window.width/2, window.height/2, nil, (window.width/img.background:getWidth())+1, 
		(window.height/img.background:getWidth())+1, img.background:getWidth()/2, img.background:getHeight()/2)
	love.graphics.draw(player.img, player.x, player.y, get_mouseAngle(), 1/20,1/20,player.width/2, player.height/2)
	
	for i,p in ipairs(projectiles) do
		love.graphics.draw(img.projectile, p.x, p.y, p.angle, 0.2,0.2)
		
	end

	for i,m1 in ipairs(monsters_1) do
		love.graphics.draw(img.monster_1, m1.x, m1.y, get_monsterAngle(m1)+math.pi/2, 0.4, 0.4, m1.width/2, m1.height/2)
	end
	
	-- love.graphics.draw(img.monster_1, 100, 100, get_monsterAngle()
	love.graphics.print("SCORE: "..score)

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
 	end


 end

 function distance(x1,y1, x2,y2)
 	d = math.sqrt((x1-x2)^2 + (y1-y2)^2)
 	return d
 end


