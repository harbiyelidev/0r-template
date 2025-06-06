NuiLoaded = false

--- CheckNui()
--- @return nil
--- @description This function checks if the NUI is loaded. It waits until the NUI is loaded before proceeding with the rest of the code.
local function CheckNui()
    while not NuiLoaded do
        Wait(100)
    end
end

--- NuiMessage()
--- @param action string - The action to perform in the NUI.
--- @param payload table - The data to send to the NUI.
--- @return nil
--- @description This function sends a message to the NUI with the specified action and payload. It checks if the NUI is loaded before sending the message.
function SendVueMessage(action, payload)
    CheckNui()
    SendNUIMessage({
        action = action,
        payload = payload
    })
end

--- FetchNui()
--- @return nil
--- @description This function checks if the NUI is loaded. It sends a message to the NUI to check its status and waits until it is loaded.
local function FetchNui()
    while not NuiLoaded do
        if NetworkIsSessionStarted() then
            SendNUIMessage({
                action = "CHECK_NUI",
            })
        end
        Wait(2000)
    end
end

RegisterNetEvent('0r-template:client:onPlayerLoaded', function ()
    Wait(1500)
    FetchNui()
end)

RegisterNetEvent('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Wait(1500)
        FetchNui()
    end
end)