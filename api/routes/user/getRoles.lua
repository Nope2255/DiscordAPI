function API:GetUserRoles(source)
  if Config.DebugPrints then
    print("(^5discord-api^0) > GetUserRoles got Triggered!")
  end

  local userId = API:getDiscordID(source)

  local data = API:sendRequestToDiscord("GET", string.format("guilds/%s/members/%s", Config.GuildId, userId))
  local resData = json.decode(data.resultData)

  return resData.roles
end
