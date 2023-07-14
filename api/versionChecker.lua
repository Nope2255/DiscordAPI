Citizen.CreateThread(function()
    PerformHttpRequest('https://divouz.github.io/lua-lua_scripts/lls-mechanic/version',
        function(err, responseText, headers)
            local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

            if (responseText ~= nil and currentVersion ~= responseText) then
                print('\n##########################################################')
                print('[Discord-API] is not up to date')
                print('should be: \'' .. responseText .. '\' and it is: \'' .. currentVersion .. '\'')
                print('please download the latest version!')
                print('############################################################\n')
            end
        end, 'GET')
end)
