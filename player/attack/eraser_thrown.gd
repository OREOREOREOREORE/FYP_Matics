extends Area2D

var HP = 1
var SPD = 300
var ATK = 100
var KB = 100
var ATK_Size = 1.0


@onready var player = get_node("../")


var target = Vector2.ZERO
var angle = Vector2.ZERO

func _ready():
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(90)
	var tween = create_tween()
	tween.tween_property(self,"scale",Vector2(1,1)*ATK_Size,1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()



func _physics_process(delta):
	position += angle*SPD*delta


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
