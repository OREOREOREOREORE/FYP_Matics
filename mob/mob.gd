extends CharacterBody2D

#@export var mob_scene: PackedScene
@onready var player = get_node("../Player")

var SPD = 100.0
var HP = 10
var DEF = 10
var ATK  = 50
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPD
	move_and_slide()
	
func take_damage(ATK: int):	
	HP = HP - (ATK - DEF)
	print(HP)
	if HP <= 0:
		queue_free()
