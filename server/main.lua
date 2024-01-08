ESX = exports['es_extended']:getSharedObject()

local polices = 0
local ambulances = 0
local mecanos = 0
local taxi = 0
local countedPlayers = {}

ESX.RegisterServerCallback('dei_pausemenu:getJobs', function(source, cb)
    local Players = ESX.GetPlayers()
        for k,v in pairs(Players) do
            local xPlayer = ESX.GetPlayerFromId(v)
            for k,v in pairs(Config.Jobs) do
                if xPlayer.job.name == v and not countedPlayers[v] then
                    if v == 'police' then
                        polices = polices + 1
                    elseif v == 'ambulance' then
                        ambulances = ambulances + 1
                    elseif v == 'mechanic' then
                        mecanos = mecanos + 1
                    elseif v == 'taxi' then
                        taxi = taxi + 1
                    end
                    countedPlayers[v] = true
                end
            end
        end
        local cJobs = {
            police = polices,
            ambulance = ambulances,
            mechanic = mecanos,
            taxi = taxi
        }
        cb(cJobs)
end)