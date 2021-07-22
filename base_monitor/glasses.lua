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
    black = 0x191919ff,
    -- CUSTOM
    teal = 0x32c8bbff
}

for i = 1, x do
    for j = 1, y do
        local c = col.purple
        if ((i+j)%2 == 0) then
            canvas.addDot({i,j}, col.white-0x7f)
        end
    end
end
--canvas.addRectangle(0,y-26, 22*6, 26, col.black)
canvas.addRectangle(19, y-19, 1, 14, col.teal-0x93)
canvas.addRectangle(20, y-21, 2, 18, col.teal-0x93)
canvas.addRectangle(22, y-22, 22*4, 20, col.teal-0x93)
canvas.addRectangle(110, y-21, 2, 18, col.teal-0x93)
canvas.addRectangle(112, y-19, 1, 14, col.teal-0x93)
os.exit()

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
    canvas.addRectangle(5,64,tostring(status.power):len()*4, 10, 0x32c8bb6c)
    canvas.addText({6,64}, tostring(power), col.white, 1)
end

while true do
    receiveAndProcessMessages()
    updateDisplay()
end
