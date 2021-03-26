queue = {}

function queue:push(item)
    table.insert(self.list, item)
end

function queue:pop()
    return table.remove(self.list, 1)
end

function queue:is_empty()
    return #self.list == 0
end

function queue:len()
    return #self.list
end

function queue.new()
    return setmetatable({list = {}}, {__index = queue})
end
function queue:print()
    for i,el in ipairs(self.list) do
        print(el)
    end
end

return queue