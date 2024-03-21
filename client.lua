lib.locale()

CreateThread(function()
    RequestModel(Config.Ped)
    while not HasModelLoaded(Config.Ped) do
        Wait(500)
    end

    local ped = CreatePed(5, Config.Ped, Config.Coords.x, Config.Coords.y, Config.Coords.z, Config.Coords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, Config.PedAnim, 0, true)
    local options = {
        {
            label = 'Starter Pack',
            icon = 'fa-solid fa-sack-dollar',
            distance = 3.0,
            onSelect = function()
                ESX.TriggerServerCallback('vanishdev:server:checkIfUsed', function(hasChecked)
                    if hasChecked then
                        ESX.ShowNotification(locale("alreadyrecieved"))
                    else
                        TriggerServerEvent("vanishdev:server:markAsUsed")
                    end
                end)
            end
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end)