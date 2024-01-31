extends Area2D

@onready var collistion = $CollisionShape2D
@onready var disableTimer = $DisableTimer

signal hurt(damage)




func _on_area_entered(area):
	pass
