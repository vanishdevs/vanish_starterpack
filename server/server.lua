lib.locale()

ESX.RegisterServerCallback('vanishdev:server:checkIfUsed', function(source, cb) 
    checkIfUsed(source, cb)
end)

RegisterNetEvent("vanishdev:server:markAsUsed")
AddEventHandler("vanishdev:server:markAsUsed", function()
    local _src = source
    local _ply = ESX.GetPlayerFromId(_src)
    AddItems(_src)
    _ply.showNotification(locale('recieved'))
    updateUser(_src, function(result) if result then end end)
end)