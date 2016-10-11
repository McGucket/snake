local anim8 = require 'anim8'

local image, animation

function love.load()
	player = {
		x = 10,
		y = 10,
		speed = 100
	}
  	image = love.graphics.newImage('assets/geghon_.png')
  	local g = anim8.newGrid(40, 40, image:getWidth(), image:getHeight())
  	animation = anim8.newAnimation(g('1-4', 1, '1-4', 2), 0.1)
end

function love.update(dt)
  	animation:update(dt)
	if love.keyboard.isDown("up") then
    player.y = player.y - (player.speed * dt)
    end
    if love.keyboard.isDown("down") then
    player.y = player.y + (player.speed * dt)
    end
    if love.keyboard.isDown("left") then
    player.x = player.x - (player.speed * dt)
    end
    if love.keyboard.isDown("right") then
    player.x = player.x + (player.speed * dt)
    end
end

function love.draw()
	love.graphics.setBackgroundColor(200,200,255)
  	animation:draw(image, player.x, player.y)
end