extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start_game_pressed():
	var err = get_tree().change_scene("res://src/game/game.tscn")
	if err != OK:
		print("There was a failure changing the scene")

func _on_load_options_pressed():
	var menu_options_res = load("res://src/menu_options/menu_options.tscn")
	var menu_options_ins = menu_options_res.instance()
	menu_options_ins.name = "menu_options"
	get_parent().add_child(menu_options_ins)

func _on_exit_program_pressed():
	get_tree().quit()
