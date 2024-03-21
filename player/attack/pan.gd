extends Area2D
var ATK = 100
var mouse_position
@onready var player = get_node("../")

func _ready():
	
	mouse_position= global_position.direction_to(get_global_mouse_position()).angle() + deg_to_rad(270)

func _process(delta):
	rotation = mouse_position
	var animation: Animation = $AnimationPlayer.get_animation("att")
	var track_id = animation.find_track(".:rotation", Animation.TYPE_VALUE)
	var key_id: int = animation.track_find_key(track_id, 0.0)
	animation.track_set_key_value(track_id, key_id, rotation - + deg_to_rad(45))
	key_id = animation.track_find_key(track_id, 0.5)
	animation.track_set_key_value(track_id, key_id, rotation + deg_to_rad(45))
	
	print(key_id)
	
	
	$AnimationPlayer.play("att")


func _on_animation_player_animation_finished(anim_name):
	player.melee_num = 0
	queue_free()
