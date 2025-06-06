local resource = GetInvokingResource() or GetCurrentResourceName()
local script = GetResourceMetadata(resource, 'scriptname', 0)
local version = GetResourceMetadata(resource, 'version', 0)

Citizen.CreateThread(function()
    PerformHttpRequest('https://api.vezironi.com/v1/fivem/version-check', function(error_code, result_data, result_headers, error_data)
        local errdata = error_data and json.decode(error_data) or nil

        if error_code ~= 200 then
            print(errdata and errdata.message or 'Error fetching version data')
            return
        end

        if not result_data or result_data == '' then
            print(errdata and errdata.message or 'Error fetching version data')
            return
        end

        local data = json.decode(result_data)

        if data.old_version then
            print('[^1WARNING^0] You are not running the latest version, please update! (latest version: ^4'..data.version..'^0, your version: ^3'..version..'^0)')
            for category, messages in pairs(data.changelog) do
                print('^2'..category..':^0')
                for _, msg in ipairs(messages) do
                    print('  • ' .. msg)
                end
            end
            print('^2Discord:^0')
            print('  • Check the discord for more information on the new features and changes: https://discord.gg/0resmon')
        else
            print('^3['..script..'] ^2- You are using the latest version of the script. ^0\nCurrent Version: ^1'..version..'^0.')
        end
    end, 'GET', nil, {
        ['Content-Type'] = 'application/json',
        ["x-script-name"] = script,
        ["x-version"] = version,
    })
end)