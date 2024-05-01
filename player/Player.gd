extends CharacterBody2D

@export var SPD = 110
@export var spd_level = 0
@export var HP = 100
@export var hp_level = 0
@export var DEF = 0
@export var def_level = 0
@export var ATK = 0

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
var collected_upgrades = []
var upgrade_options = []
var level_max = []


signal dead

#AttackTimer
@onready var eraserTimer = get_node("%eraser_Timer")
@onready var eraser_attackTimer = get_node("%eraser_attackTimer")

#Attack
var eraser_thrown = preload("res://player/attack/eraser_thrown.tscn")
var pan_o = preload("res://player/attack/pan.tscn")
var additional_attack = 0

#Eraser
var eraser_ammo = 0
var eraser_baseammo = 1
var eraser_attackspeed = 1.5
var eraser_limitammo = 3
var eraser_level = EraserThrown.level

#Pan

func _ready():
	attack()
	

func _physics_process(delta):
	movement()
	player_ui.update_healthbar()
	if Input.is_action_just_pressed("Melee") && melee_num == 0:
		var pan_att = pan_o.instantiate()
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
		eraser_ammo += eraser_baseammo + additional_attack # additionl
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
	var o_level
	var item_nam
	Level += 1
	levelPanel.visible = true
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var optionChoice = itemOptions.instantiate()
		optionChoice.item = pickRandom_item()
		
		print(optionChoice.item)
		upgradeOpts.add_child(optionChoice)
		options += 1
	get_tree().paused = true
		
func upgrade_character(upgrade):
	print("UPGRADED")
	match upgrade:
		"eraser":
			eraser_level +=1
			if eraser_level == 3:
				level_max.append(upgrade)	
		"hp":
			hp_level += 1
			HP = UpgradeDb.UPGRADE["hp"].upgrade[hp_level].value
			player_ui.update_healthbar()
		"defend":
			def_level += 1
			DEF = UpgradeDb.UPGRADE["defend"].upgrade[def_level].value
		"speed":
			spd_level += 1
			SPD = UpgradeDb.UPGRADE["speed"].upgrade[spd_level].value
			print(SPD)
		"food":
			player.HP += 20
			HP = clamp(HP,0,player.HP)
		"nuts":
			additional_attack +=  UpgradeDb.UPGRADE["nuts"].upgrade[additional_attack].additional_attack
	attack()
	var option_children = upgradeOpts.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	levelPanel.visible = false
	get_tree().paused = false
	exp_up(0)
	
	
	
func update_EXP_required():
	var exp_cap = 0
	if Level < 10:
		exp_cap = Level * 125
	elif Level < 20:
		exp_cap = 124 * (Level - 19) * 6
	else:
		exp_cap = 255 * (Level-39) * 12
		
	return exp_cap 

func pickRandom_item():
	var levelUp_list = []
	for i in UpgradeDb.UPGRADE:
		var item = UpgradeDb.UPGRADE[i]
		if(item.can_level_up and i not in level_max):
			levelUp_list.append(i)
		
	if levelUp_list.size() > 0:
		var random_item = levelUp_list.pick_random()
		upgrade_options.append(random_item) 
		print(random_item)
		return random_item
	else:
		return null;






