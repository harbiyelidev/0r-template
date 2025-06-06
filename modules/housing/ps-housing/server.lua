if GetResourceState('ps-housing') ~= 'started' then return end

Housing = Housing or {}

RegisterNetEvent('ps-housing:server:enterProperty', function(insideId)
    local src = source
    TriggerEvent('0r-template:server:onPlayerInside', src, insideId)
end)

RegisterNetEvent('ps-housing:server:leaveProperty', function(insideId)
    local src = source
    TriggerEvent('0r-template:server:onPlayerInside', src, insideId)
end)

return Housing