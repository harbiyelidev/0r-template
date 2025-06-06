local resourceName = "qs-smartphone"

local Config = require "config.config"
if (Config.Default.Phone == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Phone ~= "auto" and Config.Default.Phone ~= resourceName) then return end

Phone = Phone or {}

---comment
---@param src number
---@return number||boolean
---@diagnostic disable-next-line: duplicate-set-field
Phone.GetPlayerPhone = function(src)
    return exports['qs-base']:GetPlayerPhone(src) or false
end

---comment
---@param src number
---@param email string
---@param title string
---@param message string
---@return boolean
Phone.SendEmail = function(src, email, title, message)
    TriggerClientEvent('0r-template:server:genericEmail', src, { sender = email, subject = title, message = message, button = {} })
    return true
end

return Phone