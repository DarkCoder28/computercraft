pretty = (require('cc.pretty')).pretty
chat = peripheral.wrap('left')
connection_url = 'ws://192.168.1.64:3002'
local ws = http.websocket(connection_url)

if not ws then
    os.reboot()
end
ws.send('modded-chat')

function split(message)
    local t = {}
    for str in string.gmatch(message, '([^|:|]+)') do
        table.insert(t,str)
    end
    return t
end

local function receiver()
    local _, url, response, isBinary = os.pullEvent("websocket_message")
    if (url == connection_url and isBinary == false) then
        data = split(response)
        data[1] = data[1]:sub(1,data[1]:len()-1)
        data[2] = data[2]:sub(2)
        chat.say('<'..data[1]..'> '..data[2])
    end
end

chat.capture()
local function transmitter()
    local _, message, _, player = os.pullEvent('chat_capture')
    chat.say('f')
    chat.say('<'..player..'> '..message)
end

while true do
    parallel.waitForAll(receiver, transmitter)
end