ESX.RegisterServerCallback('checkpolice', function(source, cb)
    local players = GetPlayers() 
    local policeOnline = false

    for _, playerId in ipairs(players) do
    local xPlayer = ESX.GetPlayerFromId(source) 
    if xPlayer and (xPlayer.job.name == "police" or xPlayer.job.name == Config.secondjob) then
        policeOnline = true
        TriggerClientEvent('Start_robbery', policeOnline)
        break
        end
    end
    cb(policeOnline)
end)

RegisterNetEvent('takemoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local randommoney = Config.reward
    if xPlayer then
        xPlayer.addMoney(randommoney)
    end
end)

RegisterNetEvent('cheater', function()
    local webhook = 'twojwebhook'
    DropPlayer(source, 'Nie uzywaj cheatów!')
    sendwebhook(webhook, 7471541, 'k_shoprobbery', "**Gracz:**  " .. GetPlayerName(source) .. "\nPrawdopodobnie używa cheatów!")
end)

function sendwebhook(webhook, color, name, message)
    local currentDate = os.date("%Y-%m-%d")
    local currentTime = os.date("%H:%M:%S")
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = currentTime.." "..currentDate,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end
