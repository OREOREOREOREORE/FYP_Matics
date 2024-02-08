class_name HitBox
extends Area2D

var damage = 10

# Basic on the hurt box, the name of hit box of both player and mob should be the same 
@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

func hitBoxDisable():
	collision

func _on_disable_timer_timeout():
	pass # Replace with function body.

# We need more than one hitbox.gd for future weapon systen
