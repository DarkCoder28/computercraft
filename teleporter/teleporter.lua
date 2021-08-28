--local pretty = (require "cc.pretty").pretty
local tele = peripheral.wrap('left')
redstone.setOutput('left', false)

local history = {}

locs = {}
locs['island'] = 1
locs['old-base'] = 2
locs['moon'] = 3
locs['nether'] = 4
locs['void'] = 5
locs['end'] = 6
locs['spawn'] = 7
locs['blaze'] = 8

function starts_with(str, start)
    return str:sub(1, #start) == start
end

function auto_complete(partial)
    local possibilities = {}
    for k,_ in pairs(locs) do
        if starts_with(k,partial) then
            table.insert(possibilities,k)
        end
    end
end

while true do
    term.clear()
    term.setCursorPos(1,1)
    -- Print welcome message in yellow on black
    term.blit('Welcome to TelOS!\n\n', '444444444444444444ff', 'ffffffffffffffffffff')
    print('Please enter your destination.\nIf you would like a list of possible destinations, enter \'help\'.\n')
    write('> ')
    local input = read(nil, history, function(text) return auto_complete(text) end)
    if input == 'help' then
        print('Possible Destinations: (Press \'Return\' to exit)')
        for k,_ in pairs(locs) do
            print(k)
        end
        read()
    else
        for k,v in pairs(locs) do
            if input == k then
                table.insert(history,input)
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