extends CharacterBody2D

var SPD = 100.0
var HP = 10
var DEF = 10
var ATK  = 50

#@export var mob_scene: PackedScene
@onready var player = get_node("../Player")
	
func _physics_process(delta):
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPD
	
	move_and_slide()
	
func take_damage(ATK_O: int):
	HP = HP - (ATK_O - DEF)	
	if HP <= 0:
		queue_free()
