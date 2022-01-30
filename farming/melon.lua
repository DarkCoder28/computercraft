local pretty = require "cc.pretty"

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

direction = true

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
            direction = true
        elseif down.name == 'minecraft:melon' then
            turtle.digDown()
            turtle.suckDown()
        elseif down.name == 'minecraft:cobblestone' then
            if direction then
                turtle.turnLeft()
            else
                turtle.turnRight
            end
        elseif down.name == 'minecraft:sand' then
            if direction then
                turtle.turnRight()
            else
                turtle.turnLeft()
            end
        elseif down.name == 'minecraft:oak_planks' then
            if blockFront and front.name == 'minecraft:cobblestone' then
                turnAround()
            end
            direction = false
        end
    end
    turtle.forward()
end