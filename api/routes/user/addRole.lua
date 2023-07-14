function API:AddRole(source, roleId)
    if Config.DebugPrints then
        print("(^5discord-api^0) > AddRole got Triggered!")
    end

    local userId = API:getDiscordID(source)

    local data = API:sendRequestToDiscord("PUT", string.format("guilds/%s/members/%s/roles/%s", Config.GuildId, userId,
        roleId))

    return data
end
