function modifyChannel(channelId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > ModifyChannel got Triggered!")
    end

    local data = API:sendRequestToDiscord("PATCH", string.format("channels/%s", channelId))

    return data
end
