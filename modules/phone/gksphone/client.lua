local resourceName = "gksphone"

local Config = require "config.config"
if (Config.Default.Phone == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Phone ~= "auto" and Config.Default.Phone ~= resourceName) then return end

Phone = Phone or {}

---comment
---@param email string
---@param title string
---@param message string
---@return boolean
---@diagnostic disable-next-line: duplicate-set-field
Phone.SendEmail = function(email, title, message)
    return exports["gksphone"]:SendNewMail({ sender = email, image = '/html/static/img/icons/mail.png', subject = title, message = message })
end

return Phone