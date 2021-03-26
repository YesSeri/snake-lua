require "Part"
require "Queue"
Snake = {}
Snake.__index = Snake

function Snake:new()
    local s = {}
    setmetatable(s, Snake)
    s:push(Part:new(3, 5))
    s:push(Part:new(4, 5))
    s:push(Part:new(5, 5))
    return s
end
function Snake:move(direction)
    local head = self:getHead()
    local x = head.x
    local y = head.y
    if direction == 'up' then
        self:push(Part:new(x, y - 1))
    elseif direction == 'down' then
        self:push(Part:new(x, y + 1))
    elseif direction == 'left' then
        self:push(Part:new(x - 1, y))
    elseif direction == 'right' then
        self:push(Part:new(x + 1, y))
    end
    self:pop()
end
function Snake:push(part)
    table.insert(self, part)
end

function Snake:pop()
    return table.remove(self, 1)
end

function Snake:getHead()
    return self[#self]
end

function Snake:draw(square_size)
    for i, part in ipairs(self) do
        love.graphics.rectangle("fill", part['x'] * square_size, part['y'] * square_size, square_size, square_size, 5, 5)
    end
end
function Snake:__tostring()
    local s = "snake: { "
    for i,part in ipairs(self) do
        s = s .. tostring(part)
    end
    s = s .. " } \n"
    return s
end