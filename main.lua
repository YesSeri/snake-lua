require "Snake"
function love.load()
	snake = Snake:new()
	grid_size = 25
	game_over = false
	direction = 'right'
	move_queue = {}
	timer = 0.6
end

function love.update(dt)
	timer = timer + dt
    if love.keyboard.isDown('up') then
		direction = 'up'
    elseif love.keyboard.isDown('down') then
		direction = 'down'
	elseif love.keyboard.isDown('right') then
		direction = 'right'
    elseif love.keyboard.isDown('left') then
		direction = 'left'
    end
	if timer > 1.5 then
		timer = 0
		snake:move(direction)
	end
end

local function game_over()
	local head = snake:getHead()
	local x = head.x
	local y = head.y
	if(x < 0 or x > 25 or y < 0 or y > 25) then
		return true
	end
	return false
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
	snake:draw(square_size)
end
