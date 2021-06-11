extends Control

func _on_options_menu_pressed():
	var menu_options_res = load("res://src/menu_options/menu_options.tscn")
	var menu_options_ins = menu_options_res.instance()
	menu_options_ins.name = "menu_options"
	get_parent().add_child(menu_options_ins)

func _on_exit_menu_pressed():
	self.hide()
	self.queue_free()

func _on_exit_program_pressed():
	self.hide()
	self.queue_free()
	var err = get_tree().change_scene("res://src/menu_main/menu_main.tscn")
	if err != OK:
		print("There was a failure changing the scene")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if !has_node("../menu_options"):
			# don't close game menu if there is an options menu
			self.hide()
			self.queue_free()