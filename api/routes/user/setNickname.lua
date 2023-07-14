function API:SetNickname(source, nickname)
    if Config.DebugPrints then
        print("(^5discord-api^0) > SetNickname got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("PATCH", string.format("guilds/%s/members/%s", Config.GuildId, userId),
        json.encode({
            nick = nickname
        }))

    return data
end
