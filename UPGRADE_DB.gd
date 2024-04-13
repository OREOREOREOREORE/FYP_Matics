extends Node


const UPGRADE = {
	
	"eraser": {
		"displayname": "Eraser",
		"type": "weapon",
		"upgrade":
			[
				{
					"level": "Level: 1",
					"details": "thrown at a random enemy",
					"ATK": 20,
					"speed": 0.5
				},
				
				{
					"level": "Level: 2",
					"details": "thrown at a random enemy",
					"ATK": 20,
					"speed": 0.5
				},
				
				{
					"level": "Level: 3",
					"details": "thrown at a random enemy",
					"ATK": 20,
					"speed": 0.5
				}
				
			]
	},
	
	"pan": {
		"displayname": "Pan",
		"type": "weapon",
		"upgrade":
			[
				{
					"ATK": 20,
					"deg": 30,
					"speed": 0.5
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
					"speed": 0.1
				}
			]
	},
	
	"speed":{
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
		"displayname": "DreamBIG",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"food":{
		"displayname": "HELP!",
		"type": "item",
		"upgrade":
			[
				{
				"value": 10
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
	}
	
}
