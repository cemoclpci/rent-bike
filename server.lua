function rentBike(duration)
    local player = client
    local price = duration * 50
    if exports.global:takeMoney(player, price) then
        outputChatBox("Bisiklet kiralama başarılı! Kiralama süreniz: " .. duration .. " dakika.", player, 0, 255, 0)
        setTimer(function()
            outputChatBox("Bisiklet süreniz dolduğu için bisiklet alındı.", player, 255, 0, 0)
        end, duration * 60000, 1)
    else
        outputChatBox("Yeterli paranız yok!", player, 255, 0, 0)
    end
end
addEvent("rentBike", true)
addEventHandler("rentBike", root, rentBike)
