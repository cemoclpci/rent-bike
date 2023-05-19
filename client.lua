local npcMarker
local npcPed
local bikeMenu

function createNPC()
    npcPed = createPed(0, npcX, npcY, npcZ) -- Ped modelini ve NPC'nin konumunu belirleyin
    setElementFrozen(npcPed, true)
end
addEventHandler("onClientResourceStart", resourceRoot, createNPC)

function showBikeMenu()
    bikeMenu = guiCreateWindow(400, 200, 300, 200, "Bisiklet Kiralama", false)
    local durationLabel = guiCreateLabel(10, 30, 200, 20, "Kiralama Süresi (dakika):", false, bikeMenu)
    local durationEdit = guiCreateEdit(10, 50, 200, 20, "", false, bikeMenu)
    local rentButton = guiCreateButton(10, 90, 100, 30, "Kirala", false, bikeMenu)
    local closeButton = guiCreateButton(120, 90, 100, 30, "Kapat", false, bikeMenu)
    
    addEventHandler("onClientGUIClick", rentButton, function()
        local duration = tonumber(guiGetText(durationEdit))
        if duration then
            triggerServerEvent("rentBike", resourceRoot, duration)
            guiSetVisible(bikeMenu, false)
        else
            outputChatBox("Geçerli bir süre girin!", 255, 0, 0)
        end
    end, false)
    
    addEventHandler("onClientGUIClick", closeButton, function()
        guiSetVisible(bikeMenu, false)
    end, false)
end

function interactWithNPC()
    if isElementWithinMarker(localPlayer, npcMarker) then
        showBikeMenu()
    end
end
addCommandHandler("rentbike", interactWithNPC)

function showRemainingTime(remainingTime)
    outputChatBox("Kalan Bisiklet Süresi: " .. remainingTime .. " dakika.", 0, 255, 0)
end
addEvent("showRemainingTime", true)
addEventHandler("showRemainingTime", root, showRemainingTime)

function showBikeTakenMessage()
    outputChatBox("Bisiklet süreniz dolduğu için bisiklet alındı.", 255, 0, 0)
end
addEvent("showBikeTakenMessage", true)
addEventHandler("showBikeTakenMessage", root, showBikeTakenMessage)
