RegisterNUICallback('NUI_READY', function(data, cb)
    NuiLoaded = true
    print('NUI Loaded!')
    cb('ok')
end)