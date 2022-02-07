local input = ...
local itemName = input
if not(input:find(":")) then itemName = "minecraft:"..input end
local altar = peripheral.wrap("front")

local function getItemName(message)
    for i in string.gmatch(message, ":.+") do
        return string.sub(i,2)
    end
end

print("Crafting " .. output .. " from items in the first slot")
turtle.select(1)
local ammt = turtle.getItemCount(1)
for i = 1, ammt, 1 do
    turtle.drop(1)
    while getItemName(altar.getItemDetail(1)) ~= getItemName(itemName) do
        sleep(1)
    end
    turtle.suck(1)
end