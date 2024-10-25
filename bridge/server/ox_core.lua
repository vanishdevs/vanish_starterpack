if GetResourceState('ox_core') ~= 'started' then return end

local Ox = require '@ox_core.lib.init'

function GetPlayer(id)
    return Ox.GetPlayer(id)
end

function GetIdentifier(player)
    return player.stateId
end

function GiveInventoryItems(player, items)
    for k, v in pairs(items) do
        exports.ox_inventory:AddItem(player.source, k, v)
    end
end

function CheckClaimed(identifier)
    local result = MySQL.scalar.await('SELECT getStarter FROM characters WHERE stateId = ?', { identifier })
    return result
end

function UpdateClaimed(identifier)
    MySQL.update('UPDATE characters SET getStarter = ? WHERE stateId = ?', { 1, identifier })
end