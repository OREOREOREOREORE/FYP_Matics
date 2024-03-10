extends CharacterBody2D

var SPD = 100.0
var HP = 10
var DEF = 10
var ATK  = 10
var EXP = 50

#@export var mob_scene: PackedScene
@onready var player = get_node("../Player")
	
func _physics_process(delta):
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPD
	
	if position.x > player.global_position.x :
		$mob_img.flip_h = true
		$mob_collision.scale.x = -1
	
	elif position.x < player.global_position.x:
		$mob_img.flip_h = false
		$mob_collision.scale.x = 1
	
	move_and_slide()
	
func take_damage(ATK_O: int):
	HP = HP - (ATK_O - DEF)	
	if HP <= 0:
		player.exp_up(EXP)
		print(player.EXP)
		queue_free()
