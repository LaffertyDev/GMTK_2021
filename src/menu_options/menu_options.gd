extends Control

func _ready():	
	var global_audio = get_node("/root/GlobalAudio")
	$HBoxContainer/VBoxContainer/volume_master_slider.value = global_audio.MasterLoudness
	$HBoxContainer/VBoxContainer/volume_music_slider.value = global_audio.MusicLoudness
	$HBoxContainer/VBoxContainer/volume_sound_slider.value = global_audio.SoundLoudness

func _on_volume_master_slider_value_changed(value):
	var global_audio = get_node("/root/GlobalAudio")
	global_audio.set_master_percentage(value)

func _on_volume_music_slider_value_changed(value):
	var global_audio = get_node("/root/GlobalAudio")
	global_audio.set_music_percentage(value)

func _on_volume_sound_slider_value_changed(value):	
	var global_audio = get_node("/root/GlobalAudio")
	global_audio.set_sound_percentage(value)

func _on_exit_menu_pressed():
	hide()
	queue_free()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		hide()
		queue_free()
