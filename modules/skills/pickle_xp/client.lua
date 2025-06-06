Skills = Skills or {}
local resourceName = "pickle_xp"

local Config = require "config.config"
if (Config.Default.Skillbar == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Skillbar ~= "auto" and Config.Default.Skillbar ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetResourceName = function()
    return resourceName
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetSkillLevel = function(skillName)
    local skillData = exports.OT_skills:GetLevel(skillName)
    return skillData or 0
end

return Skills