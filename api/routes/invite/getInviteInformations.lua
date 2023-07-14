function API:GetInviteInformations(inviteCode)
    if Config.DebugPrints then
        print("(^5discord-api^0) > GetInvite got Triggered!")
    end

    local data = API:sendRequestToDiscord("GET", string.format("invites/%s", inviteCode))

    return data
end
