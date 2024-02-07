extends CharacterBody2D

var movement_speed = 200
var hp = 100

@onready var sprite = $Sprite2D
@onready var healthbar = get_node("PlayerUI/MarginContainer/HealthBar")

func _physics_process(delta):
	movement()
	update_healthbar()

func movement():
	var mov = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	
	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0:
		sprite.flip_h = true
	
	velocity = mov*movement_speed
	move_and_slide()

func take_damage(damage: int):
	hp -= damage
	if hp <= 0:
		hp = 0
		set_physics_process(false)

func update_healthbar():
	healthbar.value = hp
	
