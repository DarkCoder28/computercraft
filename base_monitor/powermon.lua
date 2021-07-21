local capacitor = peripheral.wrap("right")
rednet.open("bottom")
rednet.host("base-mon", "capacitor")
function getLevel()
    return capacitor.getEnergyStored()/capacitor.getEnergyCapacity()
end

while true do
    rednet.broadcast("capacitor|"+String(getLevel()), "base-mon")
    os.sleep(5)
end