extends Control

var screen_size
signal start_game
var window_mod

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	window_mod = get_window().mode
	if(window_mod == 0):
		$VBoxContainer/Fullscreen_switch.button_pressed = false
	else: if(window_mod == 3):
		$VBoxContainer/Fullscreen_switch.button_pressed = true
	
func _on_fullscreen_switch_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_return_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")
