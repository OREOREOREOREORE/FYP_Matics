extends CharacterBody2D

var movement_speed = 200
var hp = 100

@onready var sprite = $Sprite2D
@onready var healthbar = get_node("PlayerUI/MarginContainer/HealthBar")

func _physics_process(delta):
	movement()
	update_health()

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
	print(hp)

func update_health():
	healthbar.value = hp
	
