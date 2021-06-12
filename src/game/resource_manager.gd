const PersonManager = preload("res://src/game/person_manager.gd")

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

    func recompute_deltas(persons) -> void:
        self.ship_power_delta = -3
        self.ship_water_delta = -3
        self.ship_fuel_delta = -3
        self.alien_power_delta = -3
        self.alien_stress_delta = -3
        self.alien_mguffin_delta = -3
        self.human_water_delta = -3
        self.human_stress_delta = -3
        self.human_food_delta = -3

        for person in persons:
            match(person.assignment):
                (-1):
                    pass
                (0):
                    pass
                (1):
                    pass
                (2):
                    self.ship_power_delta += 10
                    self.alien_power_delta += 10
                (3):
                    self.human_food_delta += 10
                (4):
                    self.human_stress_delta += 10
                    self.alien_stress_delta += 10
                (5):
                    self.ship_water_delta += 10
                    self.human_water_delta += 10
                _:
                    print("UNKNOWN JOB TYPE")
                    print(person.name)
                    print(person.assignment)