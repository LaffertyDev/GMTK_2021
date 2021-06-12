extends Node2D

const ResourceManager = preload("res://src/game/resource_manager.gd")
const PersonManager = preload("res://src/game/people/person_manager.gd")
const PairedTraitManager = preload("res://src/game/traits/paired_trait_manager.gd")

var current_cycle = 0

var resource_manager = ResourceManager.new()
var person_manager = PersonManager.new()
var paired_trait_manager = PairedTraitManager.new()

func _ready() -> void:
	add_to_group("game_root")
	var jobs = get_tree().get_nodes_in_group("jobs")
	for job in jobs:
		var _1 = job.connect("job_assignment_changed", self, "_on_job_assignment_changed")
	sync_ui(resource_manager)

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		# load menu and pause game
		if !has_node("../menu_game"):
			var menu_game_res = load("res://src/menu_game/menu_game.tscn")
			var menu_game_ins = menu_game_res.instance()
			menu_game_ins.name = "menu_game"
			get_parent().add_child(menu_game_ins)

func _on_next_cycle_button_pressed() -> void:
	sync_resources(resource_manager)
	sync_ui(resource_manager)
	handle_game_done(resource_manager)

func _on_job_assignment_changed() -> void:
	var jobs = get_tree().get_nodes_in_group("jobs")
	resource_manager.recompute_deltas(jobs)

	sync_ui(resource_manager)

func sync_resources(resourceManager: ResourceManager) -> void:
	current_cycle += 1

	var delta_ship = min(resourceManager.alien_power_delta, 0) + min(resourceManager.human_water_delta, 0)
	resourceManager.ship_hull = max(resourceManager.ship_hull + delta_ship, 0)

	var delta_alien = min(resourceManager.alien_power_delta, 0) + min(resourceManager.alien_stress_delta, 0) + min(resourceManager.alien_mguffin_delta, 0)
	resourceManager.alien_eggs = max(resourceManager.alien_eggs + delta_alien, 0)

	var delta_human = min(resourceManager.human_food_delta, 0) + min(resourceManager.human_water_delta, 0) + min(resourceManager.human_stress_delta, 0)
	resourceManager.human_lifepods = max(resourceManager.human_lifepods + delta_human, 0)

	get_tree().call_group_flags(2, "cyclables", "_on_cycle") # 2 is a magic enum for REAL TIME

func sync_ui(resourceManager: ResourceManager) -> void:
	$Game_GUI/cycle_info.set_text("Cycle: %d" % [current_cycle])
	$Game_GUI/stars_charted.set_text("Stars Charted: %d / %d" % [resourceManager.stars_charted, resourceManager.stars_charted_cap])

	$Game_GUI/resources/ship_resources/ship_hull.value = resourceManager.ship_hull
	$Game_GUI/resources/ship_resources/ship_power_label.set_text("Power: %d" % [resourceManager.alien_power_delta])
	$Game_GUI/resources/ship_resources/ship_water_label.set_text("Water: %d" % [resourceManager.human_water_delta])

	$Game_GUI/resources/alien_resources/alien_eggs.value = resourceManager.alien_eggs
	$Game_GUI/resources/alien_resources/alien_power_label.set_text("Power: %d" % [resourceManager.alien_power_delta])
	$Game_GUI/resources/alien_resources/alien_stress_label.set_text("Stress: %d" % [resourceManager.alien_stress_delta])
	$Game_GUI/resources/alien_resources/alien_resource_label.set_text("???: %d" % [resourceManager.alien_mguffin_delta])

	$Game_GUI/resources/human_resources/human_pods.value = resourceManager.human_lifepods
	$Game_GUI/resources/human_resources/human_food_label.set_text("Food: %d" % [resourceManager.human_food_delta])
	$Game_GUI/resources/human_resources/human_water_label.set_text("Water: %d" % [resourceManager.human_water_delta])
	$Game_GUI/resources/human_resources/human_stress_label.set_text("Stress: %d" % [resourceManager.human_stress_delta])

func handle_game_done(resourceManager: ResourceManager) -> void:
	if (resourceManager.stars_charted == resourceManager.stars_charted_cap):
		var err = get_tree().change_scene("res://src/game/menu_victory.tscn")
		if err != OK:
			print("There was a failure changing the scene")

	if (resourceManager.ship_hull == 0 || (resourceManager.human_lifepods == 0 && resourceManager.alien_eggs == 0)):
		var err = get_tree().change_scene("res://src/game/menu_defeat.tscn")
		if err != OK:
			print("There was a failure changing the scene")
