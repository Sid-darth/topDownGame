function love.load()
-- love.window.setMode(700,550)
love.graphics.setBackgroundColor(0.65,0.1,0.15)
img = {} --table with sprites listed
img.background = love.graphics.newImage("sprites/background.png")
img.projectile = love.graphics.newImage("sprites/projectile.png")

img.monster_1 = love.graphics.newImage("sprites/monster_1.png")
img.monster_2 = love.graphics.newImage("sprites/monster_2.png")
img.monster_3 = love.graphics.newImage("sprites/monster_3.png")
-- imag.enemy = 
-- img.projectile = 

gameState = 2
window = {}
theta = {}
window.width = love.graphics.getWidth() ; window.height = love.graphics.getHeight()
require('player')
require('projectile')



end

function love.update(dt)

	playerUpdate(dt)
	projectileUpdate(dt)

end

function love.draw()
	love.graphics.draw(img.background, window.width/2, window.height/2, nil, (window.width/img.background:getWidth())+1, 
		(window.height/img.background:getWidth())+1, img.background:getWidth()/2, img.background:getHeight()/2)
	love.graphics.draw(player.img, player.x, player.y, get_mouseAngle(), 1/20,1/20,player.width/2, player.height/2)
	
	for i,p in ipairs(projectiles) do
		love.graphics.draw(img.projectile, p.x, p.y, p.angle, 0.2,0.2)
		
	end
	
	
	-- love.graphics.print("W, H:".. window.width.. ",".. window.height)

end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end
end



