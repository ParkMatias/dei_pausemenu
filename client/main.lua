ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while true do
        Wait(1)
        SetPauseMenuActive(false)
        if (IsControlJustPressed(0, 200)) then
            ESX.TriggerServerCallback('dei_pausemenu:getJobs', function(cJobs)
                SetNuiFocus(true, true)
                local MugShot = exports["MugShotBase64"]:GetMugShotBase64(PlayerPedId(), true)
                GetPlayerData(
                    function(playerdata)
                        SendNUIMessage({
                            open = true,
                            playerdata = playerdata,
                            jobs = cJobs,
                            mugshot = MugShot
                        })
                    end
                )
            end)
        end
    end
end)

RegisterNUICallback('Option', function(data)
    if data.option == 'map' then
        CloseNUI()
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_SP_PAUSE'), false, -1)
    elseif data.option == 'settings' then
        CloseNUI()
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), false, -1)
    elseif data.option == 'close' then
        CloseNUI()
    end
end)

GetPlayerData = function(cb)
    local xPlayer = ESX.GetPlayerData()
    local playerdata = {
        name = xPlayer.name,
        job = xPlayer.job.label .. ' - ' .. xPlayer.job.grade_label,
        money = xPlayer.money,
        bank = xPlayer.accounts[3].money,
    }
    cb(playerdata)
end

CloseNUI = function()
    SetNuiFocus(false, false)
end
