extends CanvasLayer


@onready var player = get_node("../Player")
@onready var experience_bar = get_node("ExperienceBar/VBoxContainer/ExperienceBar")
@onready var expreience_bar_lable = get_node("ExperienceBar/VBoxContainer/ExperienceBar/Label")
@onready var expreience_levelLable = get_node("ExperienceBar/VBoxContainer/Level") as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	SetExperiencebar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func SetExperiencebar():
	expreience_levelLable.set_text(str(player.Level))
	experience_bar.max_value = player.EXP_required
	experience_bar.value = player.EXP
	expreience_bar_lable.set_text(str(player.EXP/player.EXP_required * 100) + " %")

func UpdateExperiencebar(leveled):
	if leveled == true:
		experience_bar.max_value = player.EXP_required
