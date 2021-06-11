extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		# load menu and pause game
		if !has_node("../menu_game"):
			var menu_game_res = load("res://src/menu_game/menu_game.tscn")
			var menu_game_ins = menu_game_res.instance()
			menu_game_ins.name = "menu_game"
			get_parent().add_child(menu_game_ins)
