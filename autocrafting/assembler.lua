if (fs.exists('/inspect.lua') == false) then
    shell.run("wget", "https://github.com/kikito/inspect.lua/raw/master/inspect.lua", "inspect.lua")
end
inspect = require('/inspect')

chest = peripheral.wrap("front")
machine = peripheral.wrap("top")
me = peripheral.wrap("back")

print(http.post('http://192.168.1.47:3001/', inspect(machine.list())))