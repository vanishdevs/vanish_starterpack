if GetResourceState('qbx_core') ~= 'started' then return end

local QBX = exports.qbx_core

function GetPlayer(id)
    return QBX:GetPlayer(id)
end

function GetIdentifier(player)
    return player.PlayerData.citizenid
end

function GiveInventoryItems(player, items)
    for k, v in pairs(items) do
        exports.ox_inventory:AddItem(player.PlayerData.source, k, v)
    end
end

function CheckClaimed(identifier)
    local result = MySQL.scalar.await('SELECT getStarter FROM players WHERE citizenid = ?', { identifier })
    return result
end

function UpdateClaimed(identifier)
    MySQL.update('UPDATE players SET getStarter = ? WHERE citizenid = ?', { 1, identifier })
end