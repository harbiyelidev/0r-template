local resourceName = "qb-input"

local Config = require "config.config"
if (Config.Default.Input == "auto" and GetResourceState(resourceName) ~= "started") or (Config.Default.Input ~= "auto" and Config.Default.Input ~= resourceName) then return end

function OxTypeToQBType(_type)
    if _type == "input" then
        return "text"
    elseif _type == "number" then
        return "number"
    elseif _type == "checkbox" then
        return "checkbox"
    elseif _type == "select" then
        return "select"
    elseif _type == "multi-select" then
        return "select"
    elseif _type == "slider" then
        return "number"
    elseif _type == "color" then
        return "text"
    elseif _type == "date" then
        return "date"
    elseif _type == "date-range" then
        return "date"
    elseif _type == "time" then
        return "time"
    elseif _type == "textarea" then
        return "text"
    end
end

function OxToQBInput(data)
    local returnData = {}
    for i, v in pairs(data) do
        local input = {
            text = v.label,
            name = i,
            type = OxTypeToQBType(v.type),
            isRequired = v.required,
            default = v.default or "",
        }
        if v.type == "select" then
            input.text = ""
            input.options = {}
            for k, j in pairs(v.options) do
                table.insert(input.options, {value = j.value, text = j.label})
            end
        elseif v.type == "checkbox" then
            input.text = ""
            input.options = {}
            if v.options then -- Checks if options varible is valid so checkboxes are bundled together (not used by ox for each checkpoint)
                for k, j in pairs(v.options) do
                    table.insert(input.options, {value = j.value, text = j.label, checked = j.checked}) -- added checked option (used to show box as ticked or not)
                end
            else -- If options is not valid or people pass a single checkbox then it will be a single checkbox per entry
                table.insert(input.options, {value = v.value, text = v.label, checked = v.checked}) -- Kept value just incase it's used for other stuffs
            end
        end
        table.insert(returnData, input)
    end
    return returnData
end

function OpenInput(title, data, isQBFormat, submitText)
    local input = data.inputs
    if not isQBFormat then
        input = OxToQBInput(data)
    end
    local returnData = exports['qb-input']:ShowInput({
        header = title,
        submitText = submitText or "Submit",
        inputs = input
    })
    if not returnData then return end
    if returnData[1] then return returnData end
    --converting to standard format (ox)
    local convertedData = {}
    if isQBFormat then
        for i, v in pairs(input) do
            for k, j in pairs(returnData) do
                if k == v.text then
                    convertedData[tonumber(i)] = j
                end
            end
        end
        return convertedData
    end

    for i, v in pairs(returnData) do
        convertedData[tonumber(i)] = v
    end
    return convertedData
end
