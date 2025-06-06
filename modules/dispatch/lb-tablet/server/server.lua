if GetResourceState('lb-tablet') ~= 'started' then return end
Dispatch = Dispatch or {}

RegisterNetEvent("0r-template:server:dispatch:sendAlert", function(data)
    exports["lb-tablet"]:AddDispatch(data) -- this has a return value but we dont really have a use for it atm.
end)

return Dispatch