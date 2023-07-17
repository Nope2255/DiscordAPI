API = {}

PerformHttpRequest('https://raw.githubusercontent.com/Nope2255/DiscordAPI/main/version', function(err, responseText, headers)
    local resourceName = GetCurrentResourceName();
    local currentVersion = GetResourceMetadata(resourceName, 'version', 0)

    if responseText ~= nil and currentVersion ~= responseText then
        print(('[%s] is not up to date. Please update to version %s.'):format(resourceName, responseText));
        print(('[%s] https://github.com/Nope2255/DiscordAPI.'):format(resourceName))
    end
end, 'GET');


local errorCodes = {
    ["200"] = "OK",
    ["204"] = "OK - NO CONTENT",
    ["304"] = "ERROR - NOT MODIFIED",
    ["400"] = "ERROR - BAD REQUEST",
    ["401"] = "ERROR - UNAUTHORIZED",
    ["403"] = "ERROR - FORBIDDEN",
    ["404"] = "ERROR - ENDPOINT NOT FOUND",
    ["405"] = "ERROR - METHOD NOT ALLOWED",
    ["429"] = "ERROR - TOO MANY REQUESTS",
    ["502"] = "ERROR - GATEWAY UNAVAILABLE"
}

function API:getDiscordID(source)
    local identifiers = GetPlayerIdentifiers(source)

    for _, v in pairs(identifiers) do
        if string.find(v, "discord:") then
            return string.gsub(v, "discord:", "")
        end
    end
end

function API:sendRequestToDiscord(method, endPoint, data)
    local callbackData = nil
    local error = 404

    if method == "POST" then
        data = #data > 0 and data or "{}"
    else
        data = #data > 0 and data or ""
    end

    if Config.DebugPrints then
        print("(^5discord-api^0) > Trying to Request to the Discord API!")
    end

    PerformHttpRequest("https://discord.com/api/v10/" .. endPoint, function(errorCode, resultData, resultHeader)
        error = errorCode

        if errorCode == 200 or errorCode == 201 then
            if Config.DebugPrints then
                print("(^5discord-api^0) > Request to Discord was successful!")
            end

            callbackData = {
                resultData = resultData,
                resultHeader = resultHeader
            }
        end
    end, method, data, {
        ["Content-Type"] = 'application/json',
        ["Authorization"] = string.format("Bot %s", Config.BotToken)
    })

    local timer = GetGameTimer()

    while callbackData == nil do
        Citizen.Wait(0)

        if Config.DebugPrints then
            print("(^5discord-api^0) > Waiting for Request to Discord to finish!")
        end

        if GetGameTimer() - timer > 2000 then
            return
                "(^5discord-api^0) > Request to Discord timed out after 2 Seconds! (" .. errorCodes[tostring(error)] ..
                    ")"
        end
    end

    return callbackData
end

exports("GetAPI", function()
    return API
end)
