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
	assert(selected_upgrade.connect(player.upgrade_character) == OK)
	assert(button.pressed.connect(click) == OK)
	
	#ATK = UpgradeDb.UPGRADE["pan"].upgrade[level].ATKa
	#assert(button.pressed.connect(click) == OK)
	print(item)
	itemName.text = UpgradeDb.UPGRADE[item]["displayname"] #.["displayname"]
	#itemLevel.text = UpgradeDb.UPGRADE[item].upgrade[level].details
	#itemDescription.text = UpgradeDb.UPGRADE[item].upgrade[level].details
	
	#itemIcon.texture = load(UpgradeDb.UPGRADE[item]["icon"])

func update_UI(item, level):
	pass

func click():
	print("clicked: " + item)
	emit_signal("selected_upgrade", item)
