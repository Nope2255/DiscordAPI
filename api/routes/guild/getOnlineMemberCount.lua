function API:GetOnlineMemberCount()
    if Config.DebugPrints then
        print("(^5discord-api^0) > GetOnlineMemberCount got Triggered!")
    end

    local data = API:sendRequestToDiscord("GET", string.format("guilds/%s", API:getGuildId()))

    return data.approximate_presence_count
end
