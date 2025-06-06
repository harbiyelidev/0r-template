Housing = Housing or {}

---@param src number
---@param insideId string
RegisterNetEvent('0r-template:server:onPlayerInside', function(src, insideId)
    local currentBucket = GetPlayerRoutingBucket(src)
    local playerEntity = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerEntity)
    TriggerEvent('0r-template:client:onPlayerInside', src, insideId, currentBucket, playerCoords)
end)

return Housing