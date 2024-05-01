extends CharacterBody2D

var SPD = 100
var HP = 20
var DEF = 10
var ATK  = 10
var EXP = 100 #12

#@export var mob_scene: PackedScene
@onready var player = get_node("../Player")
@onready var word = get_node("../")
@onready var audio = $Dead_sound

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
	#audio.play()
	HP = HP - (ATK_O - DEF)	
	if HP <= 0:	
		player.exp_up(EXP)
		word.mob_number += 1
		print(player.EXP)
		audio.play()
		set_physics_process(false)
		
func _on_dead_sound_finished():
	queue_free()
