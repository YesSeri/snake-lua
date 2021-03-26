move_queue = {}

local function queue_move(dir)
    if dir ~= move_queue[#move_queue] and #move_queue < 2 then
        table.insert(move_queue, dir)
    end
end

queue_move('right')
queue_move('left')
queue_move('right')
queue_move('left')
for i,el in ipairs(move_queue) do
    print(i, el)
end