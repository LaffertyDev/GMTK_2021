class_name ResourceManager

const PersonManager = preload("res://src/game/person_manager.gd")
const Enums = preload("res://src/game/enums.gd")

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

func recompute_deltas(jobs: Array) -> void:
	self.alien_power_delta = -3
	self.alien_stress_delta = -3
	self.alien_mguffin_delta = -3
	self.human_water_delta = -3
	self.human_stress_delta = -3
	self.human_food_delta = -3

	for job in jobs:
		job.adjust_resources(self)