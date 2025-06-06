Database = {}

CreateThread(function()
    local file = json.decode(LoadResourceFile(GetCurrentResourceName(), "database/index.json"))
    if file then
        for index, data in pairs(file) do
            Database[index] = data
        end
    end
end)

while (not Framework) do
    Citizen.Wait(1000)
end