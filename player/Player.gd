extends CharacterBody2D

var movement_speed = 200
var hp = 10

@onready var sprite = $Sprite2D

func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	var y_mov = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	var mov = Vector2(x_mov, y_mov)
	
	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0:
		sprite.flip_h = true
	
	velocity = mov.normalized()*movement_speed
	move_and_slide()
