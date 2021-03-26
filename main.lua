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
	local function queue_move(dir)
		mq = move_queue[#move_queue]
		if #move_queue < 2 then
			if (dir == "right" or dir == 'left') and (mq == 'right' or mq == 'left') then
				return
			elseif (dir == "up" or dir == 'down') and (mq == 'up' or mq == 'down') then
				return
			end
			table.insert(move_queue, dir)
		end
	end

    if love.keyboard.isDown('up') then
		queue_move('up')
    elseif love.keyboard.isDown('down') then
		queue_move('down')
	elseif love.keyboard.isDown('right') then
		queue_move('right')
    elseif love.keyboard.isDown('left') then
		queue_move('left')
    end
	if timer > 0.5 then
		timer = 0
		if move_queue[1] ~= nil then 
			direction = move_queue[1]
			table.remove(move_queue, 1)
		end
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
	if game_over() then
		love.graphics.print( 'Gameover', grid_x(13), grid_y(10))
	end
	love.graphics.setBackgroundColor( 0.1, 0.1, 0.1)
	love.graphics.setColor( 0.15, 0.7, 0.15)
	snake:draw(square_size)
end
