rednet.open("top")
rednet.host("base-mon", "client")
local link = peripheral.wrap("back")
local canvas = link.canvas()
canvas.clear()
local x,y = canvas.getSize() -- 512x288

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
    black = 0x191919ff
}

local function split(msg)
    local t = {}
    local count = 0
    for i in msg:gmatch "|" do
        count = count+1
        t[count]=i
    end
    t["len"]=count
    return t
end

status = {
    power = 0.2
}

function receiveAndProcessMessages()
    local id, val = rednet.receive("base-mon", 10)
    if (id) then
        print(id..": "..val)
    end
end
function updateDisplay()
    canvas.clear()
    canvas.addRectangle(0,0,tostring(status.power):len()*4, 5, col.red)
    canvas.addText({0,0}, tostring(power), col.white, 1)
end

while true do
    receiveAndProcessMessages()
    updateDisplay()
end
