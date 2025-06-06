HelpText = HelpText or {}
local resourceName = "okokTextUI"

local Config = require "config.config"
if (Config.Default.HelpText == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.HelpText ~= "auto" and Config.Default.HelpText ~= resourceName) then return end

---This will show a help text message at the screen position passed
---@param message string
---@param _position string
---@return nil
---@diagnostic disable-next-line: duplicate-set-field
HelpText.ShowHelpText = function(message, _position)
    return exports['okokTextUI']:Open(message, 'darkblue', _position, false)
end

---This will hide the help text message on the screen
---@return nil
---@diagnostic disable-next-line: duplicate-set-field
HelpText.HideHelpText = function()
    return exports['okokTextUI']:Close()
end

return HelpText