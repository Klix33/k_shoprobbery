for _, kasetka in ipairs(Config.kasetki) do
    exports.ox_target:addBoxZone({
        coords = kasetka.coords,
        size = vec3(1, 1, 3),
        rotation = 45,
        debug = Config.drawZones,
        drawSprite = true,
        options = {
            {
                name = 'Startrobbery',
                event = 'Start_robbery',
                icon = 'fa-sharp fa-solid fa-sack-dollar',
                label = 'Rozpocznij Napad',
            }
        }
    })
end

for _, sejf in ipairs(Config.Sejfy) do
    exports.ox_target:addBoxZone({
        coords = sejf.coords,
        size = vec3(1, 1, 3),
        rotation = 45,
        debug = Config.drawZones,
        drawSprite = true,
        options = {
            {
                name = 'Startrobbery',
                event = 'Start_robbery',
                icon = 'fa-sharp fa-solid fa-sack-dollar',
                label = 'Rozpocznij Napad',
            }
        }
    })
end

local lastRobberyTime = 0

RegisterNetEvent('Start_robbery', function()
    local currentTime = GetGameTimer()
    local playerPed = PlayerPedId()
    local playerhasweapon = GetSelectedPedWeapon(playerPed)

    

    if currentTime - lastRobberyTime < Config.cooldown then
        ESX.ShowNotification('To miejsce zostało niedawno obrabowane!')
        return 
    end

    local playerPed = PlayerPedId()

            local playerPosition = GetEntityCoords(playerPed)
            local isNearKasetka = false
            local playerPosition = GetEntityCoords(playerPed)
            for _, kasetka in ipairs(Config.kasetki) do
            local distance = #(playerPosition - kasetka.coords)
        
                if distance < 10 then 
                    isNearKasetka = true
                    break 
                end
            end
        

            if not isNearKasetka then
                TriggerServerEvent('cheater')
                return
            end

          

    ESX.TriggerServerCallback('checkpolice', function(policeOnline)
    if policeOnline then
        if playerhasweapon ~= GetHashKey("weapon_unarmed") then
        local success = lib.skillCheck('easy', {'1', '2', '3', '4'})
        if success then
            if lib.progressBar({ 
                duration = Config.durationprogbar,
                label = 'Kradniesz pieniądze...',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                    combat = true
                },
                anim = {
                    dict = 'oddjobs@shop_robbery@rob_till',
                    clip = 'loop'
                },
            }) then
                TriggerServerEvent('takemoney') 
                lastRobberyTime = currentTime
            end
        end
    else
        ESX.ShowNotification('Musisz mieć broń, aby rozpocząć napad!')
    end
else
    ESX.ShowNotification('Nie ma wystarczającej liczby funkcjonariuszy!') 
end
    end)
end)
