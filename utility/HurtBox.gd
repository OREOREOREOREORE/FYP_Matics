class_name HurtBox
extends Area2D

@onready var collistion = $PlayerHurtBoxCollision as CollisionShape2D
@onready var disableTimer = $DisableTimer as Timer




func _on_area_entered(area: HitBox) -> void:
	if area == null:
		return
	if owner.has_method("take_damage"):
		owner.take_damage(50)
		collistion.set_deferred("disabled", true)
		disableTimer.start()



func _on_disable_timer_timeout():
	collistion.set_deferred("disabled", false)
