extends CharacterBody2D

#@export var mob_scene: PackedScene
@onready var player = get_node("../Player")

var speed = 100.0
var HP = 100
var def = 10
var atk = 10
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
