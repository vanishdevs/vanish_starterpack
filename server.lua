lib.versionCheck('vanishdevs/vanish_starterpack')

lib.callback.register('vanishdev:server:CheckIfClaimed', function(source)
    local player = GetPlayer(source)
    local playerIdentifier = GetIdentifier(player)
    local result = CheckClaimed(playerIdentifier)
    
    if result then
        return result == 1
    end
    
    return true
end)

RegisterNetEvent('vanishdev:server:ClaimStarterPack', function()
    local source = source
    local player = GetPlayer(source)
    local playerIdentifier = GetIdentifier(player)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)

    if xPlayer and #(playerCoords - Config.Coords) < 5.0 then
        GiveInventoryItems(player, Config.Items)
        UpdateClaimed(playerIdentifier)
        ShowNotification(locale('recieved'), source)
    end
end)