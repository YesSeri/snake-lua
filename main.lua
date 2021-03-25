require("snake")
function love.load()
	snake = Snake:new(4, 4)
	snake.print()
	grid_size = 25
	game_over = false
	direction = 'right'
	timer = 0.6
end

function love.update(dt)
	timer = timer + dt
	if timer > 0.5 then
		timer = 0
		local x = snake:getX()
		local y = snake:getY()
		snake:print()
		if direction == 'up' then
			snake.move(x, y - 1)
		elseif direction == 'down' then
			snake.move(x, y + 1)
		elseif direction == 'left' then
			snake.move(x - 1, y)
		elseif direction == 'right' then
			snake.move(x + 1, y)
		end
	end
    if love.keyboard.isDown('up') then
		direction = 'up'
    elseif love.keyboard.isDown('down') then
		direction = 'down'
	elseif love.keyboard.isDown('right') then
		direction = 'right'
    elseif love.keyboard.isDown('left') then
		direction = 'left'
    end
	function game_over()
		-- if(x < 0 or x > 25 or y < 0 or y > 25) then
		-- 	return true
		-- else
			return false
		-- end
	end
end

function love.draw()

	local square_size = 30
	function grid_x(grid_x)
		return grid_x*square_size
	end
	function grid_y(grid_y)
		return grid_y*square_size
	end

	if game_over() then
		love.graphics.print( 'Gameover', grid_x(13), grid_y(10))
	end
	love.graphics.setBackgroundColor( 0.1, 0.1, 0.1)
	love.graphics.setColor( 0.15, 0.7, 0.15)
	Snake:draw(square_size)
end
