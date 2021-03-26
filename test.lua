move_queue = {}

local function queue_move(dir)
    local opposites = {{'left', 'right'}, {'up', 'down'}}
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


queue_move('right')
queue_move('up')

queue_move('right')
queue_move('left')
queue_move('right')
for i,el in ipairs(move_queue) do
    print(i, el)
end