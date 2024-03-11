extends CanvasLayer


@onready var player = get_node("../")
@onready var experience_bar = get_node("Control/HBoxContainer/VBoxContainer/ExperienceBar")
@onready var expreience_bar_lable = get_node("Control/HBoxContainer/VBoxContainer/ExperienceBar/EXP_percentage") as Label
@onready var expreience_levelLable = get_node("Control/HBoxContainer/Level") as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	expreience_levelLable.set_text(str(player.Level))
	SetExperiencebar()
	
func SetExperiencebar():
	experience_bar.max_value = player.EXP_required
	experience_bar.value = player.EXP
	expreience_bar_lable.set_text(str(float(player.EXP* 100)/player.EXP_required) + " %")

func UpdateExperiencebar(leveled):
	if leveled == true:
		experience_bar.max_value = player.EXP_required
		expreience_levelLable.set_text(str(player.Level))
		
