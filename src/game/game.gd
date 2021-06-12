extends Node2D

const ResourceManager = preload("res://src/game/resource_manager.gd")

var current_cycle = 0

var resource_manager = ResourceManager.ResourceManager.new()

func _ready() -> void:
	var _asdf = self.connect("next_cycle", $Game_GUI/jobs/chart_stars_job, "_on_next_cycle")
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
	sync_resources()
	sync_ui(resource_manager)
	handle_game_done(resource_manager)

func sync_resources() -> void:
	current_cycle += 1

	var new_stars_charted = $Game_GUI/jobs/chart_stars_job.current_occupancy
	resource_manager.stars_charted = min(resource_manager.stars_charted + new_stars_charted, resource_manager.stars_charted_cap)

	var new_planets_explored = $Game_GUI/jobs/power_engines.current_occupancy
	resource_manager.planets_visited = min(resource_manager.planets_visited + new_planets_explored, resource_manager.planets_visited_cap)

	resource_manager.ship_hull -= 5

func sync_ui(resourceManager: ResourceManager.ResourceManager) -> void:
	$Game_GUI/cycle_info.set_text("Cycle: %d" % [current_cycle])
	$Game_GUI/stars_charted.set_text("Stars Charted: %d / %d" % [resourceManager.stars_charted, resourceManager.stars_charted_cap])
	$Game_GUI/planets_visited.set_text("Planets Visited: %d / %d" % [resourceManager.planets_visited, resourceManager.planets_visited_cap])

	$Game_GUI/resources/ship_resources/ship_hull.value = resourceManager.ship_hull
	$Game_GUI/resources/ship_resources/ship_power.value = resourceManager.ship_power
	$Game_GUI/resources/ship_resources/ship_fuel.value = resourceManager.ship_fuel
	$Game_GUI/resources/ship_resources/ship_water.value = resourceManager.ship_water

	$Game_GUI/resources/alien_resources/alien_power.value = resourceManager.alien_power
	$Game_GUI/resources/alien_resources/alien_stress.value = resourceManager.alien_stress
	$Game_GUI/resources/alien_resources/alien_resource.value = resourceManager.alien_mguffin
	$Game_GUI/resources/alien_resources/alien_eggs.value = resourceManager.alien_eggs

	$Game_GUI/resources/human_resources/human_food.value = resourceManager.human_food
	$Game_GUI/resources/human_resources/human_water.value = resourceManager.human_water
	$Game_GUI/resources/human_resources/human_stress.value = resourceManager.human_stress
	$Game_GUI/resources/human_resources/human_pods.value = resourceManager.human_lifepods

func handle_game_done(resourceManager: ResourceManager.ResourceManager) -> void:
	if (resourceManager.planets_visited == resourceManager.planets_visited_cap):
		var err = get_tree().change_scene("res://src/game/menu_victory.tscn")
		if err != OK:
			print("There was a failure changing the scene")

	if (resourceManager.ship_hull == 0):
		var err = get_tree().change_scene("res://src/game/menu_defeat.tscn")
		if err != OK:
			print("There was a failure changing the scene")
