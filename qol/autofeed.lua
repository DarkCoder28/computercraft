function clear()
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colours.yellow)
    print("aOS 0.1")
    term.setTextColor(colours.white)
end
clear()
modules = peripheral.find("manipulator")
chest = peripheral.wrap("left")
if not modules then
    error("Must have manipulator")
end

if not modules.hasModule("plethora:sensor") then
    error("Entity sensor missing!")
end
if not modules.hasModule("plethora:introspection") then
    error("Introspection missing!")
end

inv = modules.getInventory()
cachedSlot = false
lastFood = false

function feed()
    local data = modules.getMetaOwner()
    while data.food.hungry do
        local item
        if cachedSlot then
            local slotItem = inv.getItem(cachedSlot)
            if slotItem and slotItem.consume then
                item = slotItem
            else
                cachedSlot = nil
            end
        end
        if not item then
            for slot, _ in pairs(inv.list()) do
                local slotItem = inv.getItem(slot)
                if slotItem and slotItem.consume then
                    print("Using food from slot " .. slot)
                    item = slotItem
                    cachedSlot = slot
                    lastFood = slot
                    break
                end
            end
        end
        if item then
            item.consume()
        else
            print("Cannot find food")
            print("Grabbing more food")
            inv.pullItems("left", 1, 64, lastFood)
            break
        end
        data = modules.getMetaOwner()
    end
end

while true do
    pcall(feed)
    sleep(5)
end
