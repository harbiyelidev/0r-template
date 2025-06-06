Skills = Skills or {}
local resourceName = "OT_skills"

local Config = require "config.config"
if (Config.Default.Skillbar == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Skillbar ~= "auto" and Config.Default.Skillbar ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetResourceName = function()
    return resourceName
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetSkillLevel = function(skillName)
    local skillData = exports.OT_skills:getSkill(skillName)
    return skillData.level or 0
end

return Skills