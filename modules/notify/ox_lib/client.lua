Notify = Notify or {}
local resourceName = "ox_lib"

local Config = require "config.config"
if (Config.Default.Notify == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Notify ~= "auto" and Config.Default.Notify ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Notify.GetResourceName = function()
    return resourceName
end

---This will send a notify message of the type and time passed
---@param message string
---@param _type string
---@param time number
---@return nil
---@diagnostic disable-next-line: duplicate-set-field
Notify.SendNotify = function(message, _type, time)
    time = time or 3000
    return exports.ox_lib:notify({ description = message, type = _type, position = 'center-left' })
end

return Notify