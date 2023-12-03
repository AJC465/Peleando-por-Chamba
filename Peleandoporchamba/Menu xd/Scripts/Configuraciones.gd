extends Control

@onready var configuraciones = $"."
@onready var video = $Video
@onready var audio = $Audio

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
 
func toggle():
	visible = !visible
	get_tree().paused = visible

func _on_volver_pressed():
	get_tree(). change_scene_to_file("res://Scenes/UI/menu_v_2.tscn")

func show_and_hide(first, second):
	first.show()
	second.hide()

func _on_video_pressed():
	show_and_hide(video,configuraciones)

func _on_audio_pressed():
	show_and_hide(audio,configuraciones)

#ConfiguracionesDeVideo

func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_window_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_v_sync_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func _on_volver_video_pressed():
	show_and_hide(configuraciones,video)

#ConfiguracionesDeAudio

func _on_master_value_changed(value):
	adjust_volume("Master",value)

func _on_music_value_changed(value):
	adjust_volume("Music",value)

func _on_sound_fx_value_changed(value):
	adjust_volume("SoundFX",value)

func adjust_volume(bus_name: String, linear_value: float):
	var db_value = linear2db(linear_value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_name),db_value)

func linear2db(linear_value: float) -> float:
	if linear_value == 0:
		return -80 
	else:
		var t =linear_value / 100.0
		return 20.0 * log(t) / log(10.0)

func _on_volver_audio_pressed():
	show_and_hide(configuraciones,audio)
