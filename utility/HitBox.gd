class_name HitBox
extends Area2D

var damage = 10
@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

func hitBoxDisable():
	collision

func _on_disable_timer_timeout():
	pass # Replace with function body.
