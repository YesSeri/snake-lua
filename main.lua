require "Snake"
math.randomseed(os.time())
function love.load()
	square_size = 30
	grid_size = 20
	success = love.window.setMode(square_size * grid_size , square_size * grid_size, {} )
	snake = Snake:new()
	game_over = false
	direction = 'right'
	move_queue = {}
	timer = 0.6
	food = {x = 8, y = 5}
end
local function gameover_check()
	local head = snake:getHead()
	local x = head.x
	local y = head.y
	if(x < 0 or x > grid_size or y < 0 or y > grid_size) then
		game_over = true
	elseif snake:isCrashing() then
		game_over = true
	else
		game_over = false
	end
end
local function newFood()
	food.x =  math.random(0,grid_size)
	food.y =  math.random(0,grid_size)
end
local function isEating()
	local head = snake:getHead()
	local x = head.x
	local y = head.y
	if food.x == x and food.y == y then
		return true
	end
	return false
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
    end
    if love.keyboard.isDown('down') then
		queue_move('down')
    end
	if love.keyboard.isDown('right') then
		queue_move('right')
    end
    if love.keyboard.isDown('left') then
		queue_move('left')
    end
	if timer > 0.8 and not game_over then
		for i, part in ipairs(move_queue) do
			print(i, part)
		end
		timer = 0
		if move_queue[1] ~= nil then 
			direction = move_queue[1]
			table.remove(move_queue, 1)
		end
		if not isEating() then
			snake:pop()
		else
			newFood()
		end
		snake:move(direction)
		gameover_check()
	end
end



function love.draw()
	if game_over == true then
		love.graphics.print( 'Gameover', 12 *square_size, 10 *square_size)
	end
	love.graphics.setBackgroundColor( 0.1, 0.1, 0.1)
	love.graphics.setColor( 0.7, 0.15, 0.15)
	love.graphics.rectangle("fill", food.x * square_size,  food.y * square_size, square_size, square_size, 5, 5)
	love.graphics.setColor( 0.15, 0.7, 0.15)
	snake:draw(square_size)
end
