extends Area2D
var level = 0
var ATK
var deg
var att_speed
# UpgradeDb.UPGRADE["pan1"].upgrade[0].ATK
# UpgradeDb.UPGRADE["pan1"].ATK

var animation: Animation
var track_id 
var key_id: int 

var mouse_position
@onready var player = get_node("../")

func _ready():
	
	ATK = UpgradeDb.UPGRADE["pan"].upgrade[level].ATK
	deg = UpgradeDb.UPGRADE["pan"].upgrade[level].deg
	att_speed = UpgradeDb.UPGRADE["pan"].upgrade[level].speed
	
	rotation= global_position.direction_to(get_global_mouse_position()).angle() + deg_to_rad(270)
	animation = $AnimationPlayer.get_animation("att")
	track_id = animation.find_track(".:rotation", Animation.TYPE_VALUE)
	
	animation.length = att_speed
	animation.track_insert_key(track_id, 0, rotation -  deg_to_rad(deg/2))
	animation.track_insert_key(track_id, animation.length, rotation + deg_to_rad(deg/2))

func _process(delta):
	
	#animation.track_set_key_time(track_id, key_id, 1)
	#animation.track_set_key_value(track_id, key_id, rotation + deg_to_rad(45))
	$AnimationPlayer.play("att")


func _on_animation_player_animation_finished(anim_name):
	player.melee_num = 0
	queue_free()
