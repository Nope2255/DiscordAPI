function API:BanUser(source, deleteMessagesTimestamp, reason)
    if Config.DebugPrints then
        print("(^5discord-api^0) > BanUser got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("PUT", string.format("guilds/%s/bans/%s", Config.GuildId, userId),
        json.encode({
            delete_message_days = deleteMessagesTimestamp or 0
        }), reason)

    return data
end
