lib.versionCheck('vanishdevs/vanish_starterpack')

lib.callback.register('vanishdev:server:CheckIfClaimed', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local result = MySQL.scalar.await('SELECT getStarter FROM users WHERE identifier = ?', { identifier })
    
    if result then
        return result == 1
    end
    
    return true
end)

RegisterNetEvent('vanishdev:server:ClaimStarterPack', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)

    if xPlayer and #(playerCoords - Config.Coords) < 5.0 then
        for k, v in pairs(Config.Items) do 
            xPlayer.addInventoryItem(k, v)
        end

        MySQL.update('UPDATE users SET getStarter = ? WHERE identifier = ?', { 1, identifier })

        ShowNotification(locale('recieved'), source)
    end
end)