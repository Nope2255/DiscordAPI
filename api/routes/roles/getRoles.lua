function API:GetRoles()
    if Config.DebugPrints then
        print("(^5discord-api^0) > GetRoles got Triggered!")
    end

    local data = API:sendRequestToDiscord("GET", string.format("guilds/%s/roles", Config.GuildId))

    return data
end
