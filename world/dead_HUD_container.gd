extends VBoxContainer

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")

func _on_quit_pressed():
	get_tree().quit()
