--local pretty = (require "cc.pretty").pretty
local tele = peripheral.wrap('left')
redstone.setOutput('left', false)

local locs = {}
locs['island'] = 1
locs['old-base'] = 2

local text = ''

while true do
    local _,key = os.pullEvent('key')
    if keys.getName(key) ~= nil then
        local char = keys.getName(key)
        if char == 'backspace' then
            text = text:sub(text:len())
        elseif char:len() == 1 then
            text = text .. char
        end
    elseif key == 28 then
        for k,v in pairs(locs) do
            if k == text then
                tele.pullItems("bottom",v,1)
                sleep(0.25)
                tele.pushItems("bottom",1,1,v)
                redstone.setOutput('left', true)
                sleep(0.25)
                redstone.setOutput('left', false)
                break
            end
        end
    end
end