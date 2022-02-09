local reactor = peripheral.find("fissionReactorLogicAdapter")
while true do
    if reactor.getDamagePercent() > 0 then
        if reactor.getStatus() then
            reactor.scram()
        end
    end
end