extends ColorRect

@onready var itemName = $item_name
@onready var itemDescription = $item_description
@onready var itemLevel = $item_level
@onready var itemIcon = $ColorRect/ItemImg
@onready var button: TextureButton = $Button

var item = null
@onready var player = get_tree().get_first_node_in_group("Player")
signal selected_upgrade(upgrade)


func _ready():
	print(player)
	assert(selected_upgrade.connect(player.upgrade_character) == OK)
	assert(button.pressed.connect(click) == OK)
	if item == null:
		item = "food"
	#ATK = UpgradeDb.UPGRADE["pan"].upgrade[level].ATK
	#assert(button.pressed.connect(click) == OK)
	itemName.text = UpgradeDb.UPGRADE[item]["displayname"] #.["displayname"]
	#itemDescription.text = UpgradeDb.UPGRADE[item].upgrade[1]["details"]
	#itemLevel.text = UpgradeDb.UPGRADE[item].upgrade[1]["level"]
	#itemIcon.texture = load(UpgradeDb.UPGRADE[item]["icon"])


func click():
	print("clicked: " + item)
	emit_signal("selected_upgrade", item)
