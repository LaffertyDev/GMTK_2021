class ResourceManager:
    var ship_power_delta = -3
    var ship_water_delta = -3
    var ship_fuel_delta = -3
    var ship_hull = 100

    var alien_power_delta = -3
    var alien_stress_delta = -3
    var alien_mguffin_delta = -3
    var alien_eggs = 100

    var human_water_delta = -3
    var human_stress_delta = -3
    var human_food_delta = -3
    var human_lifepods = 100

    var current_cycle = 0
    var stars_charted = 0
    var stars_charted_cap = 10
    var planets_visited = 0
    var planets_visited_cap = 10