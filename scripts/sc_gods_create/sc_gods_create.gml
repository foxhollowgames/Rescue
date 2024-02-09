
function sc_gods_create() 
{

	// Declare Gods
	global.GOD1 =
	{
		name: "The Godinator",
		boons: ["Jump Height Up", "Dodge Window Up", "Double Jump"],
		relationship: [0, 0, 1, -1, 2, -2],
		enemies: ["Bird", "Pinecones"],
		state: 0,
		interruptions: ["Wall of pinecones"]
	}

	global.GOD2 =
	{
		name: "Obliviatus",
		boons: ["Jump Height Down", "Heal", "Charge Duration Up"],
		relationship: [0, 0, 1, -1, 2, -2],
		enemies: ["???", "Apathy"],
		state: 0,
		interruptions: ["Stop"]
	}

	global.GOD3 = 
	{
		name: "Slagathor",
		boons: ["Double Jump", "Max Health Up", "Jump Height Up"],
		relationship: [0, 0, 1, -1, 2, -2],
		enemies: ["Penguins", "Energy Blast"],
		state: 0,
		interruptions: ["Bullet Hell"]
	}

}