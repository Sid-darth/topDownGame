monsters_1 = {}
monsters_2 = {}
monsters_3 = {}

img.monster_1 = love.graphics.newImage("sprites/monster_1.png")
img.monster_2 = love.graphics.newImage("sprites/monster_2.png")
img.monster_3 = love.graphics.newImage("sprites/monster_3.png")

function monsterUpdate(dt)
	--move monster
	for i,m1 in ipairs(monsters_1) do
		m1.x = m1.x + math.cos(m1.angle) *m1.speed*dt/2
		m1.y = m1.y + math.sin(m1.angle) *m1.speed*dt/2
	end

	
end

function spawn_monster()
	local monster_1 = {}
	monster_1.x = 0 ; monster_1.y = 0 ; monster_1.speed = player.speed*0.75
	monster_1.angle = get_monsterAngle(monster_1)
	monster_1.width = img.monster_1:getWidth() ; monster_1.height = img.monster_1:getHeight()

	table.insert(monsters_1, monster_1)
end

function get_monsterAngle(monster)

	monsterAngle = math.atan2(player.y-monster.y , player.x-monster.x)
	return monsterAngle
end