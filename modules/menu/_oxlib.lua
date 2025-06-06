local resourceName = "ox_lib"

local Config = require "config.config"
if (Config.Default.Menu == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Menu ~= "auto" and Config.Default.Menu ~= resourceName) then return end

Menus = Menus or {}
--- Converts a QB menu to an Ox menu.
---@param id string The menu ID.
---@param menu table The QB menu data.
---@return table The Ox menu data.
local function QBToOxMenu(id, menu)
    local oxMenu = {
        id = id,
        title = "",
        canClose = true,
        options = {},
    }
    for i, v in pairs(menu) do
        if v.isMenuHeader then
            if oxMenu.title == "" then
                oxMenu.title = v.header
            end
        else
            local option = {
                title = v.header,
                description = v.txt,
                icon = v.icon,
                args = v.params.args,
                onSelect = function(selected, secondary, args)
                    local params = menu[id]?.options?[selected]?.params
                    if not params then return end
                    local event = params.event
                    local isServer = params.isServer
                    if not event then return end
                    if isServer then
                        return TriggerServerEvent(event, args)
                    end
                    return TriggerEvent(event, args)
                end

            }
            table.insert(oxMenu.options, option)
        end
    end
    return oxMenu
end

OpenMenu = function(id, data, useQBinput)
    if useQBinput then
        data = QBToOxMenu(id, data)
    end
    lib.registerContext(data)
    lib.showContext(id)
    return data
end
