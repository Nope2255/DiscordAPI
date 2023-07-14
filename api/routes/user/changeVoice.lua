function API:ChangeVoiceChannel(source, channelId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > ChangeVoiceChannel got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("PATCH", string.format("guilds/%s/members/%s", Config.GuildId, userId), {
        channel_id = channelId
    })

    return data
end
