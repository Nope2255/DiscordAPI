function API:CreateInvite(maxAge, maxUsers)
    if Config.DebugPrints then
        print("(^5discord-api^0) > CreateInvite got Triggered!")
    end

    local data = API:sendRequestToDiscord("POST", string.format("channels/%s/invites", Config.ChannelId), {
        max_age = maxAge or 86400,
        max_uses = maxUsers or 0
    })

    return data
end
