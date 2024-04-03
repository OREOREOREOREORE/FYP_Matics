extends ColorRect

@onready var itemName = $item_name
@onready var itemDescription = $item_description
@onready var itemLevel = $item_level
@onready var itemIcon = $ColorRect/ItemImg
@onready var button: TextureButton = %Button


var item = null
@onready var player = get_node("../")

func _ready():
	#connect("selected_upgrade",Callable(player,"upgrade_character"))
	itemName.text = UpgradeDb.UPGRADE[item]["displayname"] #.["displayname"]
	itemDescription.text = UpgradeDb.UPGRADE[item]["details"]
	itemLevel.text = UpgradeDb.UPGRADE[item]["level"]
	itemIcon.texture = load(UpgradeDb.UPGRADE[item]["icon"])


func _on_button_pressed():
	pass # Replace with function body.
