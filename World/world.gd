extends Node2D

var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mob_spawn_timer_timeout():
	var mob = preload("res://mob/mob.tscn").instantiate()
	mob.position = Vector2(randf_range(10,990),randf_range(10,590))
	add_child(mob)
