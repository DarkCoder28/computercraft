local pretty = require "cc.pretty"

function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

direction = true
skipreboot = true

while true do
    local blockDown, down = turtle.inspectDown()
    local blockFront, front = turtle.inspect()
    if blockFront and front.name == 'minecraft:oak_planks' then
        turtle.turnRight()
    elseif blockDown then
        if down.name == 'minecraft:chest' then
            direction = true
            if blockFront and front.name == 'minecraft:sand' then
                turnAround()
            end
            for i = 1, 16, 1 do
                turtle.select(i)
                turtle.dropDown()
            end
            for i = 1, 16, 1 do
                if turtle.getItemCount(i) > 0 then
                    sleep(10)
                    goto continue
                end
            end
            if not skipreboot then
                shell.run('reboot')
            end
            skipreboot = false
        elseif down.name == 'minecraft:melon' then
            turtle.digDown()
            turtle.suckDown()
        elseif down.name == 'minecraft:cobblestone' then
            if direction then
                turtle.turnLeft()
            else
                turtle.turnRight()
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
        end
    end
    turtle.forward()
    ::continue::
end