local reactor = peripheral.find("fusionReactorLogicAdapter")

reactor.setInjectionRate(2)
term.clear()
term.setCursorPos(1,1)
term.setTextColour(colours.yellow)
print("ReactOS v1.1")
term.setTextColour(colours.white)
print("Fusion Reactor Management Active!")

while true do
    if reactor.getCaseTemperature() >= 200000000 or reactor.getPlasmaTemperature() >= 350000000 then
        reactor.setInjectionRate(2)
    elseif reactor.getCaseTemperature <= 75000000 or reactor.getPlasmaTemperature <= 200000000 then
        reactor.setInjectionRate(4)
    end
end