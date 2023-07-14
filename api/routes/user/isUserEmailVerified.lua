function API:IsUserEmailVerified(source)
    if Config.DebugPrints then
        print("(^5discord-api^0) > IsUserEmailVerified got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("GET", string.format("users/%s", userId))

    return data.verified
end
