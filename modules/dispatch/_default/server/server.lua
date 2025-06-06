Dispatch = Dispatch or {}

RegisterNetEvent("0r-template:server:dispatchAlert", function(data)
    local jobs = data.jobs
    for _, name in pairs(jobs) do
        local activeJobPlayers = Bridge.Framework.GetPlayersByJob(name)
        for src, _ in pairs(activeJobPlayers) do
            TriggerClientEvent('0r-template:client:dispatchAlert', src, data)
        end
    end
end)

return Dispatch