Config = {}

Config.kasetki = {
    {coords = vec3(25.7, -1347.3, 29.49)},
    {coords = vec3(-3038.71, 585.9, 7.9)},
    {coords = vec3(-3241.47, 1001.14, 12.83)},
    {coords = vec3(1697.99, 4924.4, 42.06),},
    {coords = vec3(1961.48, 3739.96, 32.34),},
    {coords = vec3(547.79, 2671.79, 42.15),},
    {coords = vec3(2679.25, 3280.12, 55.24),},
    {coords = vec3(25.1075, -1347.2733, 30.8940)},
    {coords = vec3(2557.94, 382.05, 108.62),},
    {coords = vec3(373.55, 325.56, 103.56)}
} -- koordynaty rozpoczecia napadu na kasetke

Config.drawZones = false -- nie zmieniac

Config.Sejfy = {
    {coords = vec3(28.1853, -1338.5732, 29.9569)},
    {coords = vec3(378.0649, 333.4218, 103.5664)},
    {coords = vec3(-3048.7336, 585.3096, 8.3734)},
    {coords = vec3(2548.6318, 384.8353, 109.0550)}
} -- -- koordynaty rozpoczecia napadu na sejf

Config.reward = math.random(500, 1500) -- wysokosc kwoty uzyskanej z napadu

Config.secondjob = 'Sheriff' -- nazwa drugiej pracy np. szeryfów. Pierwsza domyslnie jest police

Config.cooldown = 300000 -- odstęp między napadami w ms (teraz 5 minut)

Config.durationprogbar = 7500 -- czas trwania proggresbara po udanej minigierce w ms (teraz 7,5s)



