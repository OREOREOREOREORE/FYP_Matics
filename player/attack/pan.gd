extends Area2D
var ATK = 100
@onready var player = get_node("../")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("att")


func _on_animation_player_animation_finished(anim_name):
	player.melee_num = 0
	queue_free()
