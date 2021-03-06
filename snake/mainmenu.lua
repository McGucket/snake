exf = {}

function exf.empty() end

local x, y, w, h, image

selection = 1

function love.load()
	start = {
		x = 115,
		y = 140,
		image = love.graphics.newImage("src/img/start.png")
	}
	exit = {
		x = 131.5,
		y = 270,
		image = love.graphics.newImage("src/img/exit.png")
	}
	select = {
		x = 70,
		y = 169,
		w = 20,
		h = 20
	}
end

function love.update(dt)

	if love.keyboard.isDown("up") then
		selection = 1
		select.y = 169
	end

	if love.keyboard.isDown("down") then
		selection = 2
		select.y = 299
	end

	if selection == 1 and love.keyboard.isDown("return") then
		love.load = exf.empty
		love.update = exf.empty
		love.draw = exf.empty
		love.keypressed = exf.empty
		love.keyreleased = exf.empty
		love.mousepressed = exf.empty
		love.mousereleased = exf.empty
		level = love.filesystem.load("level.lua")()
		love.load(level)
	elseif selection == 2 and love.keyboard.isDown("return") then
		love.event.quit()
	elseif love.keyboard.isDown("escape") then
		love.event.quit()
	end

end

function love.draw()
	love.graphics.setBackgroundColor(55, 70, 150)
	love.graphics.rectangle("fill", select.x, select.y, select.w, select.h)
	love.graphics.draw(start.image, start.x, start.y)
	love.graphics.draw(exit.image, exit.x, exit.y)
end
