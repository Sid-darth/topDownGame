function love.load()
-- love.window.setMode(700,550)
love.graphics.setBackgroundColor(0.65,0.1,0.15)
img = {} --table with sprites listed
-- img.background = 
img.player_guard =  love.graphics.newImage("sprites/player_guard.png")
img.player_fire = love.graphics.newImage("sprites/player_fire.png")
img.monster_1 = love.graphics.newImage("sprites/monster_1.png")
img.monster_2 = love.graphics.newImage("sprites/monster_2.png")
-- imag.enemy = 
-- img.projectile = 

gameState = 2
window = {}
theta = {}
window.width = love.graphics.getWidth() ; window.height = love.graphics.getHeight()
require('player')



end

function love.update(dt)

	playerUpdate(dt)

end

function love.draw()
	love.graphics.draw(img.player_guard, player.x, player.y, get_mouseAngle(), 1/20,1/20,player.width/2, player.height/2)
	love.graphics.print("W, H:".. window.width.. ",".. window.height)

end

function love.keypressed(key, scancode, isrepeat)
	if key == 'escape' then
		love.event.quit()
	end
end

