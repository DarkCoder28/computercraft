local reactor = peripheral.find("fissionReactorLogicAdapter")
term.clear()
term.setCursorPos(1,1)
term.setTextColour(colours.yellow)
print("ReactOS v1.1")
term.setTextColour(colours.white)
print("Fission Reactor Protection Active!")
while true do
    if reactor.getDamagePercent() > 0 or reactor.getCoolantFilledPercentage() < 0.75 then
        if reactor.getStatus() then
            term.setTextColour(colours.red)
            print("!!!OVERLOADED!!!\n  !!!SCRAM!!!")
            reactor.scram()
        end
    end
end