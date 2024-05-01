
extends Area2D

# The name of hurt box node and collosion should named as same
# If not it will have error that mob can't find hurt box collosion
# Using get_node function will be better
@onready var collistion = get_node("../HurtBox/HurtBoxCollision")as CollisionShape2D
#@onready var collistion = $PlayerHurtBoxCollision as HurtBoxCollisio
@onready var disableTimer = $DisableTimer as Timer

func _on_area_entered(area) -> void:

	if area == null:
		return
		
	if area.is_in_group("player_weapon_attack"):
		owner.take_damage(area.ATK)
		print("hitted!")
	else: #has method
		owner.take_damage(area.owner.ATK)
		collistion.set_deferred("disabled", true)
		disableTimer.start()

func _on_disable_timer_timeout():
	collistion.set_deferred("disabled", false)

# We need more than one hitbox.gd for future weapon systen
# Also we need more function to identify is the player or mob take damage
# Think: Is the mob need _on_disable_timer_timeout? If yse disabled time is as same as player?
