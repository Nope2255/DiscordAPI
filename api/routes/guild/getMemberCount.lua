function API:GetMemberCount()
    if Config.DebugPrints then
        print("(^5discord-api^0) > GetMemberCount got Triggered!")
    end

    local data = API:sendRequestToDiscord("GET", string.format("guilds/%s", Config.GuildId))

    return data.approximate_member_count
end
