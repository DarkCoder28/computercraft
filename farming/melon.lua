local pretty = require "cc.pretty"

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

while true do
    local blockDown, down = turtle.inspectDown()
    local blockFront, front = turtle.inspect()
    if (blockFront) then
        if front.name == 'minecraft:oak_planks' then
            turtle.turnRight()
        end
    end
    if blockDown then
        if down.name == 'minecraft:chest' then
            turnAround()
            for i = 1, 16, 1 do
                turtle.select(i)
                turtle.dropDown()
            end
        elseif down.name == 'minecraft:melon' then
            turtle.digDown()
            turtle.suckDown()
        elseif down.name == 'minecraft:cobblestone' or down.name == 'minecraft:sand' then
            turtle.turnLeft()
        elseif down.name == 'minecraft:oak_planks' then
            turnAround()
        end
    end
    turtle.forward()
end