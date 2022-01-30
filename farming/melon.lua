local pretty = require "cc.pretty"

while true do
    local blockDown, down = turtle.inspectDown()
    local blockFront, front = turtle.inspect()
    print(down.name)
    if (blockFront) then
        if front.name == 'oak_planks' then
            turtle.turnRight()
        end
    end
    if blockDown then
        if down.name == '' then
            --
        end
    end
end