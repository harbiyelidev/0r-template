local resourceName = "mk_vehiclekeys"

local Config = require "config.config"
if (Config.Default.VehicleKey == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.VehicleKey ~= "auto" and Config.Default.VehicleKey ~= resourceName) then return end

VehicleKey = VehicleKey or {}

VehicleKey.GiveKeys = function(vehicle, plate)
    if not vehicle and not DoesEntityExist(vehicle) then return false end
    return exports["mk_vehiclekeys"]:AddKey(vehicle)
end

VehicleKey.RemoveKeys = function(vehicle, plate)
    if not vehicle and not DoesEntityExist(vehicle) then return false end
    return exports["mk_vehiclekeys"]:RemoveKey(vehicle)
end

return VehicleKey