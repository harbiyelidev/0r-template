Skills = Skills or {}
local resourceName = "pickle_xp"

local Config = require "config.config"
if (Config.Default.Skillbar == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Skillbar ~= "auto" and Config.Default.Skillbar ~= resourceName) then return end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetResourceName = function()
    return resourceName
end

---@diagnostic disable-next-line: duplicate-set-field
Skills.GetSkillLevel = function(src, skillName)
    local skillData = exports.pickle_xp:GetPlayerLevel(src, skillName)
    return skillData or 0
end

Skills.AddXp = function(src, skillName, amount)
    local skillData = exports.pickle_xp:GetPlayerLevel(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.pickle_xp:AddPlayerXP(src, skillName, amount)
    return true
end

Skills.RemoveXp = function(src, skillName, amount)
    local skillData = exports.pickle_xp:GetPlayerLevel(src, skillName)
    if not skillData then return false, print("Skill not found") end
    exports.pickle_xp:RemovePlayerXP(src, skillName, amount)
    return true
end

return Skills