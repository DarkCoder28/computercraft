local pretty = require "cc.pretty"

--while true do
    local blockDown, down = turtle.inspectDown()
    pretty.pretty_print(down)
    local blockFront, front = turtle.inspect()
    pretty.pretty_print(front)
--end