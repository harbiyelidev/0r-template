Skills = Skills or {}
local resourceName = "evolent_skills"

local Config = require "config.config"
if (Config.Default.Skillbar == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Skillbar ~= "auto" and Config.Default.Skillbar ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetResourceName = function()
    return resourceName
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetSkillLevel = function(src, skillName)
    local skillData = exports.evolent_skills:getSkillLevel(src, skillName)
    return skillData or 0
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.AddXp = function(src, skillName, amount)
    local skillData = exports.evolent_skills:getSkillLevel(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.evolent_skills:addXp(src, skillName, amount)
    return true
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.RemoveXp = function(src, skillName, amount)
    local skillData = exports.evolent_skills:getSkillLevel(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.evolent_skills:removeXp(src, skillName, amount)
    return true
end

return Skills