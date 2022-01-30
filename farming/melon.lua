local pretty = require "cc.pretty"

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

while true do
    local blockDown, down = turtle.inspectDown()
    local blockFront, front = turtle.inspect()
    if blockFront then
        if front.name == 'minecraft:oak_planks' then
            turtle.turnRight()
        end
    end
    if blockDown then
        if down.name == 'minecraft:chest' then
            if blockFront and front.name == 'minecraft:sand' then
                turnAround()
            end
            for i = 1, 16, 1 do
                turtle.select(i)
                turtle.dropDown()
            end
        elseif down.name == 'minecraft:melon' then
            turtle.digDown()
            turtle.suckDown()
        elseif down.name == 'minecraft:cobblestone' then
            turtle.turnLeft()
        elseif down.name == 'minecraft:sand' then
            turtle.turnRight()
        elseif down.name == 'minecraft:oak_planks' then
            if blockFront and front.name == 'minecraft:cobblestone' then
                turnAround()
            end
        end
    end
    turtle.forward()
end