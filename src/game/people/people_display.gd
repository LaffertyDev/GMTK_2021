extends Control

func _ready():
	var personManager = get_tree().get_nodes_in_group("game_root")[0].person_manager
	var person_display_res = load("res://src/game/people/person_display.tscn")
	for person in personManager.persons:
		var person_display = person_display_res.instance()
		person_display.person = person
		$people_to_display.add_child(person_display)