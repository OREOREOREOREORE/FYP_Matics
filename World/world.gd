extends Node2D

var screen_size
var mob_number = 10
var mob_x_position
var mob_y_position
var vpr

func _ready():
	$dead_HUD.set_visible(false) # Make sure the HUD is not visible at the game start

func _on_mob_spawn_timer_timeout():
	
	if mob_number > 0:
		vpr = get_viewport_rect().size * randf_range(1.5,2)
		
		var mob = preload("res://mob/mob.tscn").instantiate()
		
		if(randf( ) >= 0.5):
			mob_x_position = $Player.global_position.x + vpr.x/2
		else:
			mob_x_position = $Player.global_position.x - vpr.x/2
		if(randf( ) >= 0.5):
			mob_y_position = $Player.global_position.y + vpr.y/2
		else:
			mob_y_position = $Player.global_position.y - vpr.y/2
			
		mob.position = Vector2(mob_x_position, mob_y_position)
		add_child(mob)
		mob_number -= 1

func _on_player_dead():
	$dead_HUD.set_visible(true)
