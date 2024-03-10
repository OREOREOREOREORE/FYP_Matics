extends Area2D

#@onready var world = get_node("../")


func _on_area_entered(area):
	area.owner.HP +=10
	queue_free()
	get_node("../").hp_monster_num -= 1
	print(get_node("../").hp_monster_num)
