monsters_1 = {}
monsters_2 = {}
monsters_3 = {}

img.monster_1 = love.graphics.newImage("sprites/monster_1.png")
img.monster_2 = love.graphics.newImage("sprites/monster_2.png")
img.monster_3 = love.graphics.newImage("sprites/monster_3.png")

local spawn_timer = 3.5
local timer = spawn_timer


function monsterUpdate(dt)
	--move monster
	for i,m1 in ipairs(monsters_1) do
		-- m1.x = m1.x + math.cos(get_monsterAngle(m1)) *m1.speed*dt/2
		-- m1.y = m1.y + math.sin(get_monsterAngle(m1)) *m1.speed*dt/2

		m1.collider:setLinearVelocity(math.cos(get_monsterAngle(m1)) *(m1.speed*30)*dt/2,math.sin(get_monsterAngle(m1)) *(m1.speed*30)*dt/2)

		for j,p in ipairs(projectiles) do	--detecting projectile hitting monster
			if distance(p.x,p.y,m1.x,m1.y) < 20 then
				m1.hit = true
				p.hit = true
				score = score+1
				hit:play()
			end
		end

		if m1.collider:enter('Player') then
			m1.hit = true
		end

		--deleting monster if they get hit
		for i = #monsters_1,1,-1 do
			local m1 = monsters_1[i]
			if m1.hit == true then
				table.remove(monsters_1,i)
				m1.collider:destroy()
			end
		end
	end

	--timing enemy spawning
	if gameState == 2 then
		timer = timer - dt --spawning enemies every 2 seconds
		if timer <= 0 then
			spawn_monster()
			spawn_timer = spawn_timer*0.97
			timer = spawn_timer
		end
	end

	


	
end

function spawn_monster()
	local monster_1 = {}
	monster_1.x = 0 ; monster_1.y = 0 ; monster_1.speed = player.speed*0.75
	
	monster_1.angle = get_monsterAngle(monster_1)
	monster_1.width = img.monster_1:getWidth() ; monster_1.height = img.monster_1:getHeight()
	monster_1.hit = false
	local n = math.random(1,4)

	if n == 1 then
		monster_1.x = math.random(0,window.width) ; monster_1.y = -10		
	elseif n == 2 then
		monster_1.x = window.width+10 ; monster_1.y = math.random(0,window.height)
	elseif n == 3 then
		monster_1.x = math.random(0,window.width) ; monster_1.y = window.height+10
	else
		monster_1.x = -10 ; monster_1.y = math.random(0,window.height)
	end
	monster_1.collider = world:newCircleCollider(monster_1.x, monster_1.y, 20)
	monster_1.collider:setCollisionClass('Monsters_1')
	monster_1.collider:setObject(monster_1)
	table.insert(monsters_1, monster_1)
end

function m1Draw()
	world:draw()
	for i,m1 in ipairs(monsters_1) do
		m1.x = m1.collider:getX()
		m1.y = m1.collider:getY()
		love.graphics.draw(img.monster_1, m1.x, m1.y, get_monsterAngle(m1)+math.pi/2, 0.4, 0.4, m1.width/2, m1.height/2)
		m1.flag = 0
	end
end

function get_monsterAngle(monster)

	monsterAngle = math.atan2(player.y-monster.y , player.x- monster.x)
	return monsterAngle
end