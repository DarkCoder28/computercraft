local reactor = peripheral.find("fissionReactorLogicAdapter")
while true do
    if reactor.getDamagePercent() > 0 or reactor.getCoolantFilledPercentage() < 0.75 then
        if reactor.getStatus() then
            reactor.scram()
        end
    end
end