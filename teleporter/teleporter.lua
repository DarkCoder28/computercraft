--local pretty = (require "cc.pretty").pretty
local tele = peripheral.wrap('left')
redstone.setOutput('left', false)

local history = {}

locs = {}
locs['island'] = 1
locs['old-base'] = 2

function starts_with(str, start)
    return str:sub(1, #start) == start
end

function auto_complete(partial)
    local possibilities = {}
    for k,_ in locs do
        if starts_with(k,partial) then
            possibilities:insert(k)
        end
    end
end

while true do
    local input = read(nil, history, auto_complete, 'island')
    for k,v in locs do
        if input == k then
            history:insert(input)
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

--local text = ''

--while true do
--    term.clear()
--    local _,key = os.pullEvent('key')
--    if keys.getName(key) ~= nil then
--        local char = keys.getName(key)
--        if char == 'backspace' then
--            text = text:sub(text:len())
--        elseif char:len() == 1 then
--            text = text .. char
--        end
--    elseif key == 28 then
--        for k,v in pairs(locs) do
--            if k == text then
--                tele.pullItems("bottom",v,1)
--                sleep(0.25)
--                tele.pushItems("bottom",1,1,v)
--                redstone.setOutput('left', true)
--                sleep(0.25)
--                redstone.setOutput('left', false)
--                text = ''
--                break
--            end
--        end
--    end
--end