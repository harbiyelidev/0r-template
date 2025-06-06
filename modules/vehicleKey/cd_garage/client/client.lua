local resourceName = "cd_garage"

local Config = require "config.config"
if (Config.Default.VehicleKey == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.VehicleKey ~= "auto" and Config.Default.VehicleKey ~= resourceName) then return end

VehicleKey = VehicleKey or {}

VehicleKey.GiveKeys = function(vehicle, plate)
    if not plate then return false end
    TriggerEvent('cd_garage:AddKeys', plate)
end

VehicleKey.RemoveKeys = function(vehicle, plate)
    return true
end

return VehicleKey