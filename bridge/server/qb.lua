if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayer(id)
    return QBCore.Functions.GetPlayer(id)
end

function GetIdentifier(player)
    return player.PlayerData.citizenid
end

function GiveInventoryItems(player, items)
    for k, v in pairs(items) do
        player.Functions.AddItem(k, v, false)
    end
end

function CheckClaimed(identifier)
    local result = MySQL.scalar.await('SELECT getStarter FROM players WHERE citizenid = ?', { identifier })
    return result
end

function UpdateClaimed(identifier)
    MySQL.update('UPDATE players SET getStarter = ? WHERE citizenid = ?', { 1, identifier })
end