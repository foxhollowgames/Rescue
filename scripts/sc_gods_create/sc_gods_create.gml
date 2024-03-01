
function sc_gods_create() 
{

	// Declare Gods
	global.GOD1 =
	{
		name: "The Godinator",
		boons: ["Jump Height Up", "Dodge Window Up", "Double Jump"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_bird, obj_pinecones],
		state: 0,
		hazards: [obj_wall_pinecones],
		tribute_total: 0
	}

	global.GOD2 =
	{
		name: "Obliviatus",
		boons: ["Jump Length", "Heal", "Charge Duration Up"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_questions, obj_apathy],
		state: 0,
		hazards: [obj_stop],
		tribute_total: 0
	}

	global.GOD3 = 
	{
		name: "Slagathor",
		boons: ["Double Jump", "Max Health Up", "Jump Height Up"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_penguins, obj_energy_blast],
		state: 0,
		hazards: [obj_bullet_hell],
		tribute_total: 0
	}
	
	global.pantheon = [global.GOD1, global.GOD2, global.GOD3];

}