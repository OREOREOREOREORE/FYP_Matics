extends Node

const Weapon_Path = "res://Image/WeaponImg/"

const UPGRADE = {
	"eraser": {
		"icon": Weapon_Path + "Eraser.png",
		"can_level_up": true,
		"level": 1,
		"displayname": "Eraser",
		"details": "Thrown eraser at a random enemy",
		"type": "weapon",
		"upgrade":
			[
				{
					"ATK": 20,
					"speed": 0.5
				},
				
				{
					"ATK": 20,
					"speed": 0.5
				},
				
				{
					"ATK": 30,
					"speed": 0.75
				}
				
			]
	},
	
	"pan": {
		"icon": Weapon_Path + "pan.png",
		"can_level_up": true,
		"displayname": "Pan",
		"level": 1,
		"type": "weapon",
		"details": "A forceful pen slash toward to the mouse position",
		"upgrade":
			[
				{
					"ATK": 20,
					"deg": 30,
					"speed": 1
				},
				
				{
					"level": "Level: 1",
					"ATK": 30,
					"deg": 45,
					"speed": 0.3
				},
				
				{
					"level": "Level: 2",
					"ATK": 30,
					"deg": 60,
					"speed": 0.2
				},
				
				{
					"level": "Level: 3",
					"details": "test",
					"ATK": 40,
					"deg": 90,
					"speed": 0.1
				}
			]
	},
	
	"speed":{
		"icon": Weapon_Path + "skateboard.png",
		"can_level_up": true,
		"displayname": "SkateBoard",
		"level": 1,
		"details": "Movement Speed Increased by an additional 50% of base speed",
		"type": "upgrade",
		"upgrade":[
			{
				"value": 110
			},
			
			{
				"level": "Level: 1",
				"value": 120
			},
			
			{
				"level": "Level: 2",
				"details": "",
				"value": 130
			},
			
			{
				"level": "Level: 3",
				"details": "",
				"value": 130
			}
		]
	},
	
	"hp":{
		"icon": Weapon_Path + "red_bull.png",
		"can_level_up": true,
		"displayname": "HP",
		"level": 1,
		"details": "Increase HP by 10",
		"type": "upgrade",
		"upgrade":
			[
				{
					"value":100
				},
				
				{
				"level": "Level: 1",
				"details": "",
				"value": 110
				},
				
				{
					"level": "Level: 2",
					"details": "",
					"value": 120
				},
				
				{
					"level": "Level: 3",
					"details": "",
					"value": 130
				},
			]
	},
	
	"defend":{
		"icon": Weapon_Path + "helmet.png",
		"can_level_up": true,
		"level": 1,
		"displayname": "CANTHURTME",
		"details": "Reduces Damage by 5",
		"type": "upgrade",
		"upgrade":
			[
				{
					"value":10
				},
				
				{
				"details": "",
				"value": 15
				},
				
				{
					"details": "",
					"value": 20
				},
				
				{
					"details": "",
					"value": 25
				},
			]
	},
	
	
	"nuts":{
		"icon": Weapon_Path + "pencil_case.png",
		"can_level_up": true,
		"level": 1,
		"displayname": "nuts",
		"details": "Your spells now spawn 1 more additional attack",
		"upgrade":
			[
				{
				"additional_attack": 1
				},
				
				{
					"additional_attack": 2
				},
				
				{
					"level": "Level: 3",
					"additional_attack": 3
				},
			]
	},
	
	"food":{
		"icon": Weapon_Path + "monster.png",
		"can_level_up": false,
		"level": 1,
		"displayname": "HEAL",
		"details":"Heals you for 10 health",
		"type": "item",
		"upgrade":
			[
				{
				"value": 10
				}
			]
	}
	
}
