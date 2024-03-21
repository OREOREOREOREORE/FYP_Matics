extends Node


const UPGRADE = {
	
	"eraser1": {
		"displayname": "Eraser",
		"details": "thrown at a random enemy",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"eraser2": {
		"displayname": "Eraser",
		"details": "",
		"level": "Level: 2",
		"prerequisite": ["eraser1"],
		"type": "weapon"
	},
	"speed1":{
		"displayname": "Boot",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"speed2":{
		"displayname": "Boot",
		"details": "",
		"level": "Level: 2",
		"prerequisite": ["speed1"],
		"type": "upgrade"
	},
	
	"hp1":{
		"displayname": "HP",
		"details": "",
		"level": "Level: 2",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"defend1":{
		"displayname": "CANTHURTME",
		"details": "",
		"level": "Level: 2",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"damage1":{
		"displayname": "I AM STRONG",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"size1": {
		"displayname": "DreamBIG",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"atk_speed1": {
		"displayname": "JUSTDOIT!",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "upgrade"
	},
	
	"food1":{
		"displayname": "HELP!",
		"details": "",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "item"
	}
	
}
