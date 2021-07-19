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

local link = peripheral.wrap("back")
link.canvas().clear()
local canvas = link.canvas()
local x,y = canvas.getSize() -- 512x288
for i=-10,10,1 do
    canvas.addLine({i*10,0},{x,y},col.red,1)
end
