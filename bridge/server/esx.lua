if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function GetIdentifier(player)
    return player.identifier
end

function GiveInventoryItems(player, items)
    for k, v in pairs(items) do
        player.addInventoryItem(k, v)
    end
end

function CheckClaimed(identifier)
    local result = MySQL.scalar.await('SELECT getStarter FROM users WHERE identifier = ?', { identifier })
    return result
end

function UpdateClaimed(identifier)
    MySQL.update('UPDATE users SET getStarter = ? WHERE identifier = ?', { 1, identifier })
end