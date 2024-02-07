extends VBoxContainer

func _on_start_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")


func _on_setting_pressed():
	get_tree().change_scene_to_file("res://main/setting_menu.tscn")


func _on_credit_pressed():
	get_tree().change_scene_to_file("res://main/creit_scene.tscn")


func _on_quit_pressed():
	get_tree().quit()
