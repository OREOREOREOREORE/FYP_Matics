extends CharacterBody2D

@export var SPD = 110
@export var HP = 100
@export var DEF = 0
@export var ATK = 40

@export var Level = 1
@export var EXP = 0
@export var EXP_required = 100

@onready var player = $playerImg
@onready var player_ui = get_node("PlayerUI")
@onready var levelPanel = get_node("PlayerUI/Control/Levelup")
@onready var upgradeOpts = get_node("PlayerUI/Control/Levelup/ItemOptions")
@onready var sndLevelup = get_node("PlayerUI/Control/Levelup/snd_levelup")
@onready var itemOptions = preload("res://utility/ItemOption.tscn")



var melee_num = 0
var enemies = []

signal dead

#AttackTimer
@onready var eraserTimer = get_node("%eraser_Timer")
@onready var eraser_attackTimer = get_node("%eraser_attackTimer")

#Attack
var eraser_thrown = preload("res://player/attack/eraser_thrown.tscn")
var pan = preload("res://player/attack/pan.tscn")

#Eraser
var eraser_ammo = 0
var eraser_baseammo = 1
var eraser_attackspeed = 1.5
var eraser_limitammo = 3
var eraser_level = 1

func _ready():
	attack()
	

func _physics_process(delta):
	movement()
	player_ui.update_healthbar()
	if Input.is_action_just_pressed("Melee") && melee_num == 0:
		var pan_att = pan.instantiate()
		add_child(pan_att)
		melee_num += 1
	

func movement():
	var mov = Input.get_vector("Left", "Right", "Up", "Down").normalized()
	
	if mov.x > 0:
		player.flip_h = false
	elif mov.x < 0:
		player.flip_h = true
	
	velocity = SPD * mov
	move_and_slide()
	
func attack():
	if eraser_level > 0:
		print("Shoot")
		eraserTimer.wait_time = eraser_attackspeed
		if eraserTimer.is_stopped():
			eraserTimer.start()
	
func take_damage(ATK_0: int):
	HP -= clamp(ATK_0 - DEF, 0.0, 100.0)
	if HP <= 0:
		player_ui.update_healthbar()
		set_physics_process(false)
		dead.emit()
		
		
func _on_eraser_timer_timeout():
	if (eraser_ammo < eraser_limitammo):
		eraser_ammo += eraser_baseammo + 2 # additionl
		eraser_attackTimer.start()

func _on_eraser_attack_timer_timeout():
	if enemies.size() > 0 and eraser_ammo > 0:
		var eraser_attack = eraser_thrown.instantiate()
		eraser_attack.position = position
		eraser_attack.target = get_random_target()
		add_child(eraser_attack)
		eraser_ammo -= 1
		if eraser_ammo > 0:
			eraser_attackTimer.start()
		elif (eraser_ammo <= 0):
			eraser_attackTimer.stop()
		

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
	
func exp_up(exp_gained):
	var leveled = false
	EXP += exp_gained
	while EXP >= EXP_required:
		EXP -= EXP_required
		EXP_required = update_EXP_required()
		level_up()
		leveled = true
	player_ui.SetExperiencebar()
	player_ui.UpdateExperiencebar(leveled)
	

func level_up():
	Level += 1
	levelPanel.visible = true
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var optionChoice = itemOptions.instantiate()
		upgradeOpts.add_child(optionChoice)
		options += 1
	get_tree().paused = true
		
func upgrade_character():
	pass

func update_EXP_required():
	var exp_cap = 0
	if Level < 10:
		exp_cap = Level * 125
	elif Level < 20:
		exp_cap = 124 * (Level - 19) * 6
	else:
		exp_cap = 255 * (Level-39) * 12
		
	return exp_cap 

func pick_randomItem():
	pass

	
	
	





