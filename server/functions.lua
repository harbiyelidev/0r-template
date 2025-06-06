--- SaveDatabase()
--- @param data table: The data to be saved to the database.
--- @return nil
--- @description This function saves the provided data to a JSON file in the resource's directory.
function SaveDatabase(data)
    SaveResourceFile(GetCurrentResourceName(), "database/index.json", json.encode(data, {indent = true}), -1)
end