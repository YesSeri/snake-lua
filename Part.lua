Part = {}
function Part:new(x, y)
    local p = {}
    setmetatable(p, Part)
    p.x = x
    p.y = y
    return p
end

function Part:__tostring()
    return "part: { x: " .. self.x .. " y: " .. self.y .. " } "
end