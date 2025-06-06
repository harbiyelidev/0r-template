local resourceName = "qs-vehiclekeys"

local Config = require "config.config"
if (Config.Default.VehicleKey == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.VehicleKey ~= "auto" and Config.Default.VehicleKey ~= resourceName) then return end

VehicleKey = VehicleKey or {}

VehicleKey.GiveKeys = function(vehicle, plate)
    if not vehicle then return false end
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local verifiedPlate = GetVehicleNumberPlateText(vehicle)
    return exports['qs-vehiclekeys']:GiveKeys(verifiedPlate, model, true)
end

VehicleKey.RemoveKeys = function(vehicle, plate)
    if not vehicle then return false end
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local verifiedPlate = GetVehicleNumberPlateText(vehicle)
    return exports['qs-vehiclekeys']:RemoveKeys(verifiedPlate, model)
end

return VehicleKey