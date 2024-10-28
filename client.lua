local ped
local point = lib.points.new({
    coords = Config.Coords,
    distance = 30.0
})

function point:onEnter()
    lib.requestModel(Config.PedSettings.model, 500)
    ped = CreatePed(5, Config.PedSettings.model, Config.Coords.x, Config.Coords.y, Config.Coords.z, Config.Heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, Config.PedSettings.anim, 0, true)
    local options = {
        {
            label = 'Starter Pack',
            icon = 'fa-solid fa-sack-dollar',
            distance = 3.0,
            onSelect = function()
                local hasClaimed = lib.callback.await('vanishdev:server:CheckIfClaimed', false)
                if hasClaimed then return ShowNotification(locale("alreadyrecieved")) end

                TriggerServerEvent("vanishdev:server:ClaimStarterPack")
            end
        },
    }
    exports.ox_target:addLocalEntity(ped, options)
end

function point:onExit()
    DeleteEntity(ped)
end