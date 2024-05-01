extends Node


const UPGRADE = {
	
	"eraser": {
		"can_level_up": true,
		"displayname": "Eraser",
		"type": "weapon",
		"upgrade":
			[
				{
					"level": "Level: 1",
					"details": "thrown at a random enemy",
					"ATK": 5,
					"speed": 0.5
				},
				
				{
					"level": "Level: 2",
					"details": "thrown at a random enemy",
					"ATK": 5,
					"speed": 0.5
				},
				
				{
					"level": "Level: 3",
					"details": "thrown at a random enemy",
					"ATK": 8,
					"speed": 0.75
				}
				
			]
	},
	
	"pan": {
		"can_level_up": true,
		"displayname": "Pan",
		"type": "weapon",
		"upgrade":
			[
				{
					"ATK": 20,
					"deg": 30,
					"speed": 1
				},
				
				{
					"level": "Level: 1",
					"details": "test",
					"ATK": 30,
					"deg": 45,
					"speed": 0.3
				},
				
				{
					"level": "Level: 2",
					"details": "test",
					"ATK": 30,
					"deg": 60,
					"speed": 0.2
				},
				
				{
					"level": "Level: 3",
					"details": "test",
					"ATK": 40,
					"deg": 90,
					"speed": 0.2
				}
			]
	},
	
	"speed":{
		"can_level_up": true,
		"displayname": "Boot",
		"type": "upgrade",
		"upgrade":[
			{
				"value": 110
			},
			
			{
				"level": "Level: 1",
				"details": "",
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
		"can_level_up": true,
		"displayname": "HP",
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
		"can_level_up": true,
		"displayname": "CANTHURTME",
		"type": "upgrade",
		"upgrade":
			[
				{
					"value":10
				},
				
				{
				"level": "Level: 1",
				"details": "",
				"value": 15
				},
				
				{
					"level": "Level: 2",
					"details": "",
					"value": 20
				},
				
				{
					"level": "Level: 3",
					"details": "",
					"value": 25
				},
			]
	},
	
	"damage":{
		"can_level_up": true,
		"displayname": "I AM STRONG",
		"type": "upgrade",
		"upgrade":
			[
				{
				"level": "Level: 1",
				"details": "",
				"value": 15
				},
				
				{
					"level": "Level: 2",
					"details": "",
					"value": 20
				},
				
				{
					"level": "Level: 3",
					"details": "",
					"value": 25
				},
			]
	},
	
	"size": {
		"can_level_up": true,
		"displayname": "DreamBIG",
	},
	
	"nuts":{
		"can_level_up": true,
		"displayname": "nuts",
		"upgrade":
			[
				{
				"level": "Level: 1",
				"details": "+1",
				"additional_attack": 1
				},
				
				{
					"level": "Level: 2",
					"details": "+2",
					"additional_attack": 2
				},
				
				{
					"level": "Level: 3",
					"details": "+3",
					"additional_attack": 3
				},
			]
	},
	
	"food":{
		"can_level_up": false,
		"displayname": "HELP!",
		"type": "item",
		"upgrade":
			[
				{
				"value": 10
				}
			]
	}
	
}
