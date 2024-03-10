extends CharacterBody2D

@export var SPD = 500
@export var HP = 100
@export var DEF = 0
@export var ATK = 40
@export var EXP = 0
@export var Level = 0

@onready var player = $playerImg
@onready var healthbar = get_node("PlayerUI/MarginContainer/HealthBar")
var enemies = []

signal dead


#Attack
var eraser_thrown = preload("res://player/attack/eraser_thrown.tscn")

func _ready():
	_on_eraser_attack_timer_timeout()
	

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

func take_damage(ATK_0: int):
	HP -= clamp(ATK_0 - DEF, 0.0, 100.0)
	if HP <= 0:
		update_healthbar()
		set_physics_process(false)
		dead.emit()

func update_healthbar():
	healthbar.value = HP

func _on_eraser_attack_timer_timeout():
	if enemies.size() > 0:
		var eraser_attack = eraser_thrown.instantiate()
		eraser_attack.position = position
		eraser_attack.target = get_random_target()
		add_child(eraser_attack)

func _on_detection_area_body_entered(body):
	print("Eny detected")
	if body.is_in_group("Enemy") && not enemies.has(body):
		enemies.append(body)
		

func _on_detection_area_body_exited(body):
	print("eny exited")
	if body.is_in_group("Enemy"):
		enemies.erase(body)

func get_random_target():
	if enemies.size() > 0:
		return enemies.pick_random().global_position
	else: return Vector2.UP
	
func exp_up(exp):
	EXP += exp






