Rectangle = {x = 0, y = 0, dx = 0, dy = 0}

function Rectangle:new(x,y,dx,dy)
    Rectangle.x = x
    Rectangle.y = y
    Rectangle.dx = dx
    Rectangle.dy = dy
    return Rectangle
end

function Rectangle:area()
    return Rectangle.dx * Rectangle.dy
end

function Rectangle:print()
    io.write("x:", Rectangle.x, " y:", Rectangle.y, " dx:", Rectangle.dx, " dy:", Rectangle.dy)
end

Square = Rectangle:new()
function Square:new(x,dx)
    Square.x = x
    Square.y = x
    Square.dx = dx
    Square.dy = dx
    return Square
end