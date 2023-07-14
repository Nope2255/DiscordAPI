function API:CreateChannel(channelName, channelType, parentID, permissionOverwrites)
    if Config.DebugPrints then
        print("(^5discord-api^0) > CreateChannel got Triggered!")
    end

    local types = {
        ["text"] = 0,
        ["voice"] = 2,
        ["category"] = 4
    }

    local data = API:sendRequestToDiscord("POST", string.format("guilds/%s/channels", Config.GuildId), json.encode({
        name = channelName or "No name provided.",
        type = types[channelType] or 0,
        parent_id = parentID or nil,
        permission_overwrites = permissionOverwrites or nil
    }))

    return data
end
