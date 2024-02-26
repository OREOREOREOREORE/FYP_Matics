extends CharacterBody2D

#@onready var world = get_node("../")

func _on_mostter_box_area_entered(area):
	area.owner.HP +=10
	queue_free()
	get_node("../").hp_monster_num -= 1
