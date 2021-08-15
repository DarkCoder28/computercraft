local ae = peripheral.wrap("left")
rednet.open("top")
rednet.host("base-mon", "ae")

while true do
    rednet.broadcast("ae|"..tostring(#ae.listAvailableItems()), "base-mon")
    os.sleep(5)
end