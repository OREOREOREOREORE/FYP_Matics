extends Control

func _ready():
	if(get_window().mode == 0):
		$setting_menu_Container/Fullscreen_switch.button_pressed = false
	else: if(get_window().mode == 3):
		$setting_menu_Container/Fullscreen_switch.button_pressed = true
	
func _on_fullscreen_switch_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_return_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")
