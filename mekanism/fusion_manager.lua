local reactor = peripheral.find("fusionReactorLogicAdapter")

reactor.setInjectionRate(2)
function clearTerm()
    term.clear()
    term.setCursorPos(1,1)
    term.setTextColour(colours.yellow)
    print("ReactOS v1.1")
    term.setTextColour(colours.white)
    print("Fusion Reactor Management Active!")
end
clearTerm()

while true do
    caseTemp = reactor.getCaseTemperature()
    plasmaTemp = reactor.getPlasmaTemperature()
    if caseTemp >= 200000000 or plasmaTemp >= 350000000 then
        reactor.setInjectionRate(2)
    elseif caseTemp <= 75000000 or plasmaTemp <= 200000000 then
        reactor.setInjectionRate(4)
    end
    clearTerm()
    print('75000000 -> ' .. math.floor(caseTemp) .. ' <- 200000000')
    print('200000000 -> ' .. math.floor(plasmaTemp) .. ' <- 350000000')
end