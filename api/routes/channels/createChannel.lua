function API:CreateChannel(channelName, channelType, parentID, permissionsOverwirtes)
    if Config.DebugPrints then
        print("(^5discord-api^0) > CreateChannel got Triggered!")
    end

    local types = {
        text = 0,
        voice = 2,
        category = 4
    }

    local data = API:sendRequestToDiscord("POST", string.format("guilds/%s/channels", Config.GuildId), json.encode({
        name = channelName or "New Channel!",
        type = types[channelType] or 0,
        parent_id = parentID or nil,
        permission_overwrites = permissionsOverwirtes or nil
    }))

    return data
end
