function API:DeleteChannel(channelId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > DeleteChannel got Triggered!")
    end

    local data = API:sendRequestToDiscord("DELETE", string.format("channels/%s", channelId))

    return data
end
