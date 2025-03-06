RegisterNetEvent('hud:update')
AddEventHandler('hud:update', function(street, postal, userid)
    SendNUIMessage({
        type = 'updateHUD',
        street = street,
        postal = postal,
        userid = userid
    })
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local streetName, crossingRoad = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local street = GetStreetNameFromHashKey(streetName)
        local postal = exports['nearest-postal']:getPostal() or '0000'
        local userid = GetPlayerServerId(PlayerId())
        
        TriggerEvent('hud:update', street, postal, userid)
    end
end)
