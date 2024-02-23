extends CharacterBody2D

@export var SPD = 200
@export var HP = 100
@export var DEF = 40
@export var ATK = 40

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
	
	velocity = SPD * mov
	move_and_slide()

func take_damage(ATK: int):
	
	HP = HP - (ATK - DEF)
	if HP <= 0:
		HP = 0
		update_healthbar()
		set_physics_process(false)
		dead.emit()

func update_healthbar():
	healthbar.value = HP


	
