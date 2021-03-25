test = {'a', 'b', 'c', {'d', 'e'}}

local function printNestedTables(table)
    for i,elem in ipairs(table) do
        if (type(elem) == "table") then
            printNestedTables(elem)
        else
            print(elem)
        end
    end
end
function recToString(table, idx)
    local i = idx or 1
    if i > #table then 
        return ""
    elseif type(table[i]) == 'string' then
        return table[i] .. ", ".. recToString(table, i + 1)
    elseif type(table[i]) == 'table' then
        return recToString(table[i])
    end

end

s = recToString(2)
print(s)