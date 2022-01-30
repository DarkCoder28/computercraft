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
            direction = true
            if blockFront and front.name == 'minecraft:sand' then
                turnAround()
            end
            for i = 1, 16, 1 do
                turtle.select(i)
                turtle.dropDown()
            end
            local bf, f = turtle.inspect()
            if bf and f.name == 'minecraft:cobblestone' then
                turtle.turnLeft()
            end
        elseif down.name == 'minecraft:melon' then
            turtle.digDown()
            turtle.suckDown()
        elseif down.name == 'minecraft:cobblestone' then
            if direction then
                turtle.turnLeft()
            else
                turtle.turnRight()
            end
            local bf, f = turtle.inspect()
            if bf and f.name == 'minecraft:oak_planks' then
                if not direction then
                    turnAround()
                    direction = false
                end
            elseif bf and f.name == 'minecraft:cobblestone' then
                turtle.turnRight()
                direction = false
            end
        elseif down.name == 'minecraft:sand' then
            if direction then
                turtle.turnRight()
            else
                turtle.turnLeft()
            end
        elseif down.name == 'minecraft:oak_planks' then
            direction = false
            if blockFront and front.name == 'minecraft:cobblestone' then
                turnAround()
            end
            local bf, f = turtle.inspect()
            if bf and f.name == 'minecraft:oak_planks' then
                turtle.turnRight()
            end
        end
    end
    turtle.forward()
end