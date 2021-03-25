Snake = {}

function PartNew(x, y)
    local Part = {}
    Part['x'] = x
    Part['y'] = y
    return Part
end

function Snake:new(x, y)
    Snake[1] = PartNew(5,5)
    Snake[2] = PartNew(4,5)
    Snake[3] = PartNew(3,5)
    return Snake
end
function Snake:move(x, y)
    table.insert(snake, PartNew(12, 12))
    table.remove(snake)
end
function Snake:getX()
    return snake[1]['x']
end
function Snake:getY()
    return snake[1]['y']
end

function Snake:draw(square_size)
    for i, part in ipairs(Snake) do
        love.graphics.rectangle("fill", part['x'] * square_size, part['y'] * square_size, square_size, square_size, 5, 5)
    end
end
function Snake:print()
    for i,part in ipairs(Snake) do
        io.write("snake:{ ", "x: ", part["x"], " y: ", part["y"], " }, ")
    end
    print()
end