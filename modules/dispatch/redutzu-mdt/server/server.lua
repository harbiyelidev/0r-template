if GetResourceState('redutzu-mdt') ~= 'started' then return end
Dispatch = Dispatch or {}

RegisterNetEvent("0r-template:server:dispatch:sendAlert", function(data)
    TriggerEvent('redutzu-mdt:server:addDispatchToMDT', {
        code = data.code,
        title = data.message,
        street = data.street,
        duration = data.time,
        coords = data.coords
    })
end)

return Dispatch