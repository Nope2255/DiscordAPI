function API:DeleteInvite(inviteCode)
    if Config.DebugPrints then
        print("(^5discord-api^0) > DeleteInvite got Triggered!")
    end

    local data = API:sendRequestToDiscord("DELETE", string.format("invites/%s", inviteCode))

    return data
end
