extends Control



func _on_jugar_pressed():
	get_tree(). change_scene_to_file("res://Scenes/nodess_2d.tscn")


func _on_salir_pressed():
	get_tree(). quit()


func _on_config_pressed():
	get_tree(). change_scene_to_file("res://Scenes/UI/configuraciones.tscn")
