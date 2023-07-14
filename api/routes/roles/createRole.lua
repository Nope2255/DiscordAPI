function API:CreateRole(name, permissions, color, hoist, icon, unicode_emoji, mentionable)
    if Config.DebugPrints then
        print("(^5discord-api^0) > CreateRole got Triggered!")
    end

    local data = API:sendRequestToDiscord("POST", string.format("guilds/%s/roles", Config.GuildId), json.encode({
        name = name or "No name provided.",
        permissions = permissions or 0,
        color = color or 0,
        hoist = hoist or false,
        icon = icon or nil,
        unicode_emoji = unicode_emoji or nil,
        mentionable = mentionable or false
    }))

    return data
end
