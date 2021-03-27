require "Snake"
math.randomseed(os.time())

function love.load()
	square_size = 30
	grid_x = 15
	grid_y = 10 
	success = love.window.setMode(square_size * (1 + grid_x) , square_size * (1 + grid_y))
	snake = Snake:new()
	game_over = false
	direction = 'right'
	move_queue = {}
	timer = 0
	food = {x = 8, y = 5}
end
local function gameover_check()
	local head = snake:getHead()
	local x = head.x
	local y = head.y
	if(x < 0 or x > grid_x or y < 0 or y > grid_y) then
		game_over = true
	elseif snake:isCrashing() then
		game_over = true
	else
		game_over = false
	end
end
local function newFood()
	local emptySquares = {}
	for x = 0, grid_x - 1 do
		for y = 0, grid_y - 1 do
			local empty = true
			for i, part in ipairs(snake) do
				if x == part.x and y == part.y then
					empty = false
				end
			end
			if empty then
				table.insert(emptySquares, {x = x, y = y})
			end
		end
	end
	food = emptySquares[math.random(#emptySquares)]
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


local function queue_move(dir)
	local mq = move_queue[#move_queue]
	if mq == nil then 
		mq = direction
	end
	if #move_queue < 2 then
		if (dir == "right" or dir == 'left') and (mq == 'right' or mq == 'left') then
			return
		elseif (dir == "up" or dir == 'down') and (mq == 'up' or mq == 'down') then
			return
		end
		table.insert(move_queue, dir)
	end
end
local function resetGame()
	snake = Snake:new()
	game_over = false
	direction = 'right'
	move_queue = {}
	timer = 0
	food = {x = 8, y = 5}
end
function love.keypressed( key )
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
    if love.keyboard.isDown('space') then
		resetGame()
    end
end

function love.update(dt)
	timer = timer + dt
	
	if timer > 0.3 and not game_over then
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
	love.graphics.setBackgroundColor( 0.1, 0.1, 0.1)
	if game_over == true then
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()
		love.graphics.setColor( 0.15, 0.7, 0.15)
		love.graphics.printf( 'Gameover, press space', width/2-100, height * 2/5, 200, 'center')
		love.graphics.setColor( 0.15, 0.4, 0.15)
	else
		love.graphics.setColor( 0.7, 0.15, 0.15)
		love.graphics.rectangle("fill", food.x * square_size,  food.y * square_size, square_size, square_size, 5, 5)
		love.graphics.setColor( 0.15, 0.7, 0.15)
	end
	snake:draw(square_size)
end
