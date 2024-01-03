ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while true do
        Wait(1)
        SetPauseMenuActive(false)
        if (IsControlJustPressed(0, 200)) then
            TransitionToBlurred(1000)
            SetNuiFocus(true, true)
            GetPlayerData(
                function(playerdata)
                    SendNUIMessage({
                        open = true,
                        playerdata = playerdata
                    })
                end
            )
        end
    end
end)

RegisterNUICallback('Close', function()
    CloseNUI()
end)

GetPlayerData = function (cb)
    local xPlayer = ESX.GetPlayerData()
    local playerdata = {
        name = xPlayer.name,
        job = xPlayer.job.label.. ' - ' ..xPlayer.job.grade_label,
        money = xPlayer.money,
        bank = xPlayer.accounts[3].money,
    }
    cb(playerdata)
end

CloseNUI = function ()
    TransitionFromBlurred(1000)
    SetNuiFocus(false, false)
    SendNUIMessage({
        open = false
    })
end