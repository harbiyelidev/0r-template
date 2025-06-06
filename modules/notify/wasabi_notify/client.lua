Notify = Notify or {}
local resourceName = "wasabi_notify"

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
    return exports.wasabi_notify:notify(_type, message, time, _type)
end

return Notify