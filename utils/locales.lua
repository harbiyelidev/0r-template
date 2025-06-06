local Config = require 'config.config'

local function LoadLocaleFile()
    local path = 'locales/' .. Config.Locale .. '.json'
    local file = LoadResourceFile(GetCurrentResourceName(), path)

    if not file then
        file = LoadResourceFile(GetCurrentResourceName(), 'locales/en.json')
        print(('Locale file "%s" not found, falling back to default "en".'):format(Config.Locale))
    end

    return file
end

local function LoadLocale()
    local file = LoadLocaleFile()

	if not file or file == '' then
        error('Locale file is empty or not found')
    end

    local success, content = pcall(json.decode, file)

	if not success then
        error(('Failed to decode JSON from locale file: %s'):format(content))
    end


    if not content['Lua'] then
        error('Missing "Lua" section in locale file')
    end

    return content['Lua']
end

Locales = LoadLocale()

function _T(key, ...)
    if Locales[key] then
        return Locales[key]:format(...)
    end
    return key
end