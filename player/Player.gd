extends CharacterBody2D

@export var movement_speed = 200
@export var health = 100

@onready var player = $playerImg
@onready var healthbar = get_node("PlayerUI/MarginContainer/HealthBar")

signal dead

func _physics_process(delta):
	movement()
	update_healthbar()

func movement():
	var mov = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	
	if mov.x > 0:
		player.flip_h = false
	elif mov.x < 0:
		player.flip_h = true
	
	velocity = mov*movement_speed
	move_and_slide()

func take_damage(damage: int):
	health -= damage
	if health <= 0:
		health = 0
		update_healthbar()
		set_physics_process(false)
		dead.emit()

func update_healthbar():
	healthbar.value = health


	
