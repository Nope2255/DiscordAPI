function API:UnbanUser(source)
    if Config.DebugPrints then
        print("(^5discord-api^0) > UnbanUser got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("DELETE", string.format("guilds/%s/bans/%s", Config.GuildId, userId))

    return data
end
