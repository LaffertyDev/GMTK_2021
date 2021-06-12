extends Control

func _on_quit_game_pressed():
	var err = get_tree().change_scene("res://src/menu_main/menu_main.tscn")
	if err != OK:
		print("There was a failure changing the scene")