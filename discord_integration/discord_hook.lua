chat = peripheral.wrap('left')
connection_url = 'ws://192.168.1.64:3002'
local ws = http.websocket(connection_url)

if not ws then
    os.reboot()
end
ws.send('modded-chat')

while true do
    local _, url, response, isBinary = os.pullEvent("websocket_message")
    if (url == connection_url and isBinary == false) then
        print(response)
    end
end