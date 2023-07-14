function API:DeleteRole(roleId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > DeleteRole got Triggered!")
    end

    local data = API:sendRequestToDiscord("DELETE", string.format("guilds/%s/roles/%s", Config.GuildId, roleId))

    return data
end
