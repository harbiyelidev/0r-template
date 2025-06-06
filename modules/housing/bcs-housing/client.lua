if GetResourceState('bcs-housing') ~= 'started' then return end

Housing = Housing or {}

RegisterNetEvent('Housing:client:EnterHome', function(insideId)
    TriggerServerEvent('0r-template:server:onPlayerInside', insideId)
end)

RegisterNetEvent("Housing:client:DeleteFurnitures", function()
    TriggerServerEvent('0r-template:server:onPlayerInside', false)
end)

return Housing