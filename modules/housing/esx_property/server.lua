if GetResourceState('esx_property') ~= 'started' then return end

Housing = Housing or {}

RegisterNetEvent('esx_property:enter', function(insideId)
    local src = source
    TriggerEvent('0r-template:server:onPlayerInside', src, insideId)
end)

RegisterNetEvent('esx_property:leave', function(insideId)
    local src = source
    TriggerEvent('0r-template:server:onPlayerInside', src, insideId)
end)

return Housing