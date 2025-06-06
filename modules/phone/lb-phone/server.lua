local resourceName = "lb-phone"

local Config = require "config.config"
if (Config.Default.Phone == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Phone ~= "auto" and Config.Default.Phone ~= resourceName) then return end

Phone = Phone or {}

---@diagnostic disable-next-line: duplicate-set-field
Phone.GetPlayerPhone = function(src)
    return exports["lb-phone"]:GetEquippedPhoneNumber(src) or false
end

---comment
---@param src number
---@param email string
---@param title string
---@param message string
---@return boolean
---@diagnostic disable-next-line: duplicate-set-field
Phone.SendEmail = function(src, email, title, message)
    local numberNumber = exports["lb-phone"]:GetEquippedPhoneNumber(src)
    if not numberNumber then return false end
    local playerEmail = exports["lb-phone"]:GetEmailAddress(numberNumber)
    if not playerEmail then return false end
    local success, id = exports["lb-phone"]:SendMail({
        to = playerEmail,
        sender = email,
        subject = title,
        message = message,
    })
    return success
end

RegisterNetEvent('0r-template:server:genericEmail', function(data)
    local src = source
    return Phone.SendEmail(src, data.email, data.title, data.message)
end)

return Phone