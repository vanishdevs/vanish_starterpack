CreateThread(function()
    lib.requestModel(Config.Ped, 500)

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
                local hasClaimed = lib.callback.await('vanishdev:server:CheckIfClaimed', false)
                if not hasClaimed then return ShowNotification(locale("alreadyrecieved")) end

                TriggerServerEvent("vanishdev:server:ClaimStarterPack")
            end
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end)