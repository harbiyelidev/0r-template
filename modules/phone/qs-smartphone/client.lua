local resourceName = "qs-smartphone"

local Config = require "config.config"
if (Config.Default.Phone == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Phone ~= "auto" and Config.Default.Phone ~= resourceName) then return end

Phone = Phone or {}

---comment
---@param email string
---@param title string
---@param message string
---@return nil
---@diagnostic disable-next-line: duplicate-set-field
Phone.SendEmail = function(email, title, message)
    return true, TriggerServerEvent('qs-smartphone:server:sendNewMail', { sender = email, subject = title, message = message, button = {} })
end

RegisterNetEvent('community_bridge:Server:genericEmail', function(data)
    TriggerServerEvent('qs-smartphone:server:sendNewMail', { sender = data.email, subject = data.title, message = data.message, button = {} })
end)

return Phone