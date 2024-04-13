extends ColorRect

@onready var itemName = $item_name
@onready var itemDescription = $item_description
@onready var itemLevel = $item_level
@onready var itemIcon = $ColorRect/ItemImg
@onready var button: TextureButton = $Button

var item = null
@onready var player = get_node("../")

signal selected_upgrade(upgrade)


func _ready():
	#connect("selected_upgrade",Callable(player,"upgrade_character"))
	# 	assert(selected_upgrade.connect(player.upgrade_character) == OK)
	#assert(button.pressed.connect(click) == OK)
	itemName.text = UpgradeDb.UPGRADE["pan"]["displayname"] #.["displayname"]
	#itemDescription.text = UpgradeDb.UPGRADE[item]["details"]
	#itemLevel.text = UpgradeDb.UPGRADE[item]["level"]
	#itemIcon.texture = load(UpgradeDb.UPGRADE[item]["icon"])


func click():
	selected_upgrade.emit(item)
