
function sc_gods_create() 
{

	// Declare Gods
	global.GOD1 =
	{
		name: "The Veil",
		boons_common: ["Platform Spawn Rate Up", "Extra Life"],
		boons_rare: ["Revive"],
		boons_epic: ["Shield", "Projectile Shield"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_vulture, obj_pinecones],
		state: 0,
		hazards: [obj_wall_pinecones],
		tribute_spent: 0,
		tribute_total: 0
	}

	global.GOD2 =
	{
		name: "Shiny",
		boons_common: ["Gather Tribute", "More Frequent Tribute"],
		boons_rare: ["More Frequent Shrines"],
		boons_epic: ["Bomb Enemies", "Huge Tribute Chance"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_questions, obj_apathy],
		state: 0,
		hazards: [obj_stop],
		tribute_spent: 0,
		tribute_total: 0
	}

	global.GOD3 = 
	{
		name: "Speed",
		boons_common: ["Jump Length Up", "Jump Height Up"],
		boons_rare: ["Extra Jump"],
		boons_epic: ["Bomb Hazards", "Bouncy Platforms"],
		relationship: [0, 0, 1, -1, 2, -2],
		relationship_total: 0,
		enemies: [obj_penguins, obj_energy_blast],
		state: 0,
		hazards: [obj_bullet_hell],
		tribute_spent: 0,
		tribute_total: 0
	}

	global.pantheon_ini = [global.GOD1, global.GOD2, global.GOD3];
	global.pantheon = global.pantheon_ini;

}