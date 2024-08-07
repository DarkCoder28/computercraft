--if (fs.exists('/inspect.lua') == false) then
--    shell.run("wget", "https://github.com/kikito/inspect.lua/raw/master/inspect.lua", "inspect.lua")
--end
--pretty = require "cc.pretty"
rednet.open("top")
rednet.host("base-mon", "client_"..os.getComputerLabel())
link = peripheral.wrap("back")
canvas = link.canvas()
canvas.clear()
_,y = canvas.getSize() -- 512x288
-- Define Colours
col = {
    --      0xRRGGBBOO
    white = 0xffffffff,
    orange = 0xf2b233ff,
    magenta = 0xe57fd8ff,
    lightBlue = 0x99b2f2ff,
    yellow = 0xdede6cff,
    lime = 0x7fcc19ff,
    pink = 0xF2B2CCff,
    gray = 0x4C4C4Cff,
    lightGray = 0x999999ff,
    cyan = 0x4C99B2ff,
    purple = 0xB266E5ff,
    blue = 0x3366CCff,
    brown = 0x7F664Cff,
    green = 0x57A64Eff,
    red = 0xCC4C4Cff,
    black = 0x191919ff,
    -- CUSTOM
    teal = 0x32c8bbff
}

--for i = 1, x do
--    for j = 1, y do
--        local c = col.purple
--        if ((i+j)%2 == 0) then
--            canvas.addDot({i,j}, col.white-0x7f)
--        end
--    end
--end
--canvas.addRectangle(0,y-26, 22*6, 26, col.black)
--canvas.addRectangle(19, y-19, 1, 14, col.teal-0x93)
--canvas.addRectangle(20, y-21, 2, 18, col.teal-0x93)
--canvas.addRectangle(22, y-22, 22*4, 20, col.teal-0x93)
--canvas.addRectangle(110, y-21, 2, 18, col.teal-0x93)
--canvas.addRectangle(112, y-19, 1, 14, col.teal-0x93)
--os.exit()

function split(msg)
    local t = {}
    local count = 0
    for i in msg:gmatch "[^|]+" do
        count = count+1
        t[count]=i
    end
    t["len"]=count
    return t
end

status = {
    power = 0.2,
    itemTypes = 0
}

--print(pretty.pretty(status))
--inspect = require('/inspect')
--print(inspect(status))

function receiveAndProcessMessages()
    local id, val = rednet.receive("base-mon")
    if (id) then
        msg = split(val)
        case =
        {
            ["capacitor"] = function()
                status.power = msg[2]+0
            end,
            ["ae"] = function()
                status.itemTypes = msg[2]+0
            end
        }
        if (case[msg[1]]) then
            case[msg[1]]()
        end
        --print(pretty.pretty(status))
        --print(inspect(status))
    end
end
function updateDisplay()
    canvas.clear()
    -- Draw Info Box
    canvas.addRectangle(19, y-19, 1, 14, col.teal-0x93)
    canvas.addRectangle(20, y-21, 2, 18, col.teal-0x93)
    canvas.addRectangle(22, y-22, 88, 20, col.teal-0x93) -- Main Box
    canvas.addRectangle(110, y-21, 2, 18, col.teal-0x93)
    canvas.addRectangle(112, y-19, 1, 14, col.teal-0x93)
    canvas.addRectangle(21, y-23, 90, 1, col.white)
    canvas.addRectangle(19, y-22, 3, 1, col.white)
    canvas.addRectangle(19, y-21, 1, 2, col.white)
    canvas.addRectangle(18, y-20, 1, 16, col.white)
    canvas.addRectangle(19, y-5, 1, 2, col.white)
    canvas.addRectangle(19, y-3, 3, 1, col.white)
    canvas.addRectangle(21, y-2, 90, 1, col.white)
    canvas.addRectangle(110, y-22, 3, 1, col.white)
    canvas.addRectangle(112, y-21, 1, 2, col.white)
    canvas.addRectangle(113, y-20, 1, 16, col.white)
    canvas.addRectangle(112, y-5, 1, 2, col.white)
    canvas.addRectangle(110, y-3, 3, 1, col.white)
    -- End Info Box
    -- Info Box Content
    canvas.addText({21,y-20}, 'Power: '..(tostring(math.ceil(status.power*100)):gmatch "[^%.]+")()..'%', col.white, 1)
    canvas.addText({21,y-11}, 'ItemTypes: '..tostring(status.itemTypes), col.white, 1)
    -- End Info Box Content
end

while true do
    receiveAndProcessMessages()
    updateDisplay()
end
