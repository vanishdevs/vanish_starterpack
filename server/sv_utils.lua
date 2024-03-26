--- @param id number The player's ID
AddItems = function(id)
    for k, v in pairs(Config.Items) do
        exports.ox_inventory:AddItem(id, k, v)
    end
end

--- @param id number The player's identifier.
--- @param cb function Callback function to return the result.
checkIfUsed = function(id, cb)
    local _src = id
    local _ply = ESX.GetPlayerFromId(_src)
    MySQL.scalar("SELECT getStarter FROM users WHERE identifier = ?", {
        _ply.identifier
    }, function(result)
        if result then
            local isUsed = result == 1
            return cb(isUsed)
        else
            return cb(false)
        end
    end)
end

--- @param id number The user's identifier.
--- @param cb function Callback function to return the result.
updateUser = function(id, cb)
    local _src = id
    local _ply = ESX.GetPlayerFromId(_src)
    MySQL.update("UPDATE users SET getStarter = ? WHERE identifier = ?", {
        1, _ply.identifier
    }, function(rowsChanged)
        local success = rowsChanged > 0
        return cb(success)
    end)
end
