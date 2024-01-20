extends CharacterBody2D


const SPEED = 300.0
var HP = 100
var def = 10
var art = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	pass
	
func _physics_process(delta):
	move_and_slide()
