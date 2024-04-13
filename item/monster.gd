extends Area2D
var level = 0
var recovery: int = UpgradeDb.UPGRADE["food"].upgrade[level].value
#@onready var world = get_node("../")


func _on_area_entered(area):
	area.owner.HP += recovery
	queue_free()
	get_node("../").hp_monster_num -= 1
	print(get_node("../").hp_monster_num)
