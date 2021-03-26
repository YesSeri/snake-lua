stack = {}

function stack.push(item)
    table.insert(stack, item) 
end

function stack.pop()
    return table.remove(stack)
end

s = stack

for i=1,10 do
   s.push(i)
end

a = s.pop()
while(a) do
    a = s.pop()
end