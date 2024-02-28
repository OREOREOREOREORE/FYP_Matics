extends CharacterBody2D

@export var SPD = 200
@export var HP = 100
@export var DEF = 0
@export var ATK = 40

@onready var player = $playerImg
@onready var healthbar = get_node("PlayerUI/MarginContainer/HealthBar")
var enemies = []

signal dead

#Attack
var eraser_thrown = preload("res://player/attack/eraser_thrown.tscn")



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
	HP -= clamp(ATK - DEF, 0.0, 100.0)
	if HP <= 0:
		update_healthbar()
		set_physics_process(false)
		dead.emit()

func update_healthbar():
	healthbar.value = HP
	


func _on_detection_area_body_entered(body):
	if body.is_in_group("Enemy") && not enemies.has(body):
		enemies.append(body)
		

func _on_detection_area_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)

func get_random_target():
	if enemies.size() > 0:
		return enemies.pick_random().global_position
	else: return Vector2.UP






