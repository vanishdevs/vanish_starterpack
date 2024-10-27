lib.versionCheck('vanishdevs/vanish_starterpack')

---@param playerId (number) The ID of the player to check
---@return boolean
local function CheckIfClaimed(playerId)
    local player = GetPlayer(playerId)
    local playerIdentifier = GetIdentifier(player)
    local result = CheckClaimed(playerIdentifier)
    
    if result then
        return result == 1
    end
    
    return true
end

lib.callback.register('vanishdev:server:CheckIfClaimed', function(source)
    return CheckIfClaimed(source)
end)

RegisterNetEvent('vanishdev:server:ClaimStarterPack', function()
    local source = source
    local player = GetPlayer(source)
    local playerIdentifier = GetIdentifier(player)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local hasClaimed = CheckIfClaimed(source)

    if player and not hasClaimed and #(playerCoords - Config.Coords) < 5.0 then
        GiveInventoryItems(player, Config.Items)
        UpdateClaimed(playerIdentifier)
        ShowNotification(locale('recieved'), source)
    end
end)