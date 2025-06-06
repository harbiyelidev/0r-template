VehicleKey = VehicleKey or {}

---This will give keys to the specifed vehicle/plate.
---@param vehicle number The vehicle entity ID.
---@param plate string The plate of the vehicle.
VehicleKey.GiveKeys = function(vehicle, plate)
    return true
end

---This will remove keys from the specifed vehicle/plate.
---@param vehicle number The vehicle entity ID.
---@param plate string The plate of the vehicle.
---@return boolean | nil
VehicleKey.RemoveKeys = function(vehicle, plate)
    return true
end

return VehicleKey