input = peripheral.wrap("top")

turtle.select(1)
while true do
    while turtle.getItemCount(1) < 1 do
        turtle.suckUp(1)
    end
    turtle.place()
    turtle.dig()
    if turtle.getItemDetail(1).name ~= "minecraft:gravel" then
        while not turtle.dropDown() do
            sleep(1)
        end
    end
end
