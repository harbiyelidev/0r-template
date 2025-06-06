Skills = Skills or {}
local resourceName = "OT_skills"

local Config = require "config.config"
if (Config.Default.Skillbar == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Skillbar ~= "auto" and Config.Default.Skillbar ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetResourceName = function()
    return resourceName
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetSkillLevel = function(src, skillName)
    local skillData = exports.OT_skills:getSkill(src, skillName)
    return skillData.level or 0
end

Skills.AddXp = function(src, skillName, amount)
    local skillData = exports.OT_skills:getSkill(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.OT_skills:addXP(src, skillName, amount)
    return true
end

Skills.RemoveXp = function(src, skillName, amount)
    local skillData = exports.OT_skills:getSkill(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.OT_skills:removeXP(src, skillName, amount)
    return true
end

return Skills