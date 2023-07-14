function API:GetChannel(channelId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > GetChannel got Triggered!")
    end

    local data = API:sendRequestToDiscord("GET", string.format("channels/%s", channelId))

    return data
end
