class_name ResourceManager

const PersonManager = preload("res://src/game/people/person_manager.gd")
const Enums = preload("res://src/game/enums.gd")

var ship_hull = 100

var alien_power_delta = -3
var alien_stress_delta = -3
var alien_beatles_delta = -3
var alien_eggs = 100

var human_water_delta = -3
var human_stress_delta = -3
var human_food_delta = -3
var human_lifepods = 100

var current_cycle = 0
var stars_charted = 0
var stars_charted_cap = 6

func recompute_deltas(jobs: Array, people: Array) -> void:

	self.alien_power_delta = 0
	self.alien_stress_delta = 0
	self.alien_beatles_delta = 0
	self.human_water_delta = 0
	self.human_stress_delta = 0
	self.human_food_delta = 0

	for person in people:
		for need in person.get_needs():
			match(need.resource_affected):
				(Enums.ShipResources.WATER):
					self.human_water_delta += need.generative_effect
				(Enums.ShipResources.FOOD):
					self.human_food_delta += need.generative_effect
				(Enums.ShipResources.POWER):
					self.alien_power_delta += need.generative_effect
				(Enums.ShipResources.STRESS):
					if person.race == Enums.Race.Human:
						self.human_stress_delta += need.generative_effect
					else:
						self.alien_stress_delta += need.generative_effect
				(Enums.ShipResources.BEATLES):
					self.alien_beatles_delta += need.generative_effect

	for job in jobs:
		job.adjust_resources(self)
