if (fs.exists('/inspect.lua') == false) then
    shell.run("wget", "https://github.com/kikito/inspect.lua/raw/master/inspect.lua", "inspect.lua")
end
inspect = require('/inspect')

chest = peripheral.wrap("front")
machine = peripheral.wrap("top")
me = peripheral.wrap("back")

print(inspect(machine.list()))