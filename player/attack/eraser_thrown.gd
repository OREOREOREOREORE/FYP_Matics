extends Area2D

func _physics_process(delta):
	var tween = create_tween()
	tween.tween_property($eraser, "rotation", deg_to_rad(360), 5)
