require "Part"
Snake = {}
Snake.__index = Snake

function Snake:new()
    local s = {}
    setmetatable(s, Snake)
    s:push(Part:new(1, 5))
    s:push(Part:new(2, 5))
    s:push(Part:new(3, 5))
    s:push(Part:new(4, 5))
    s:push(Part:new(5, 5))
    s:push(Part:new(6, 5))
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
end
function Snake:push(part)
    table.insert(self, part)
end

function Snake:pop()
    return table.remove(self, 1)
end

function Snake:isCrashing()
    head = self:getHead()

    local crashTest = function (h, p)
        if h.x == p.x and h.y == p.y then
            return true
        end
        return false
    end
    for i = 1, #self-1 do
        if crashTest(head, self[i]) == true then
            return true
        end
    end
    return false
end

function Snake:draw(square_size)
    for i, part in ipairs(self) do
        love.graphics.rectangle("fill", part['x'] * square_size, part['y'] * square_size, square_size, square_size, 5, 5)
    end
end

function Snake:getHead()
    return self[#self]
end

function Snake:__tostring()
    local s = "snake: { "
    for i,part in ipairs(self) do
        s = s .. tostring(part)
    end
    s = s .. " } \n"
    return s
end