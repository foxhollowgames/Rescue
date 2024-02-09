
function enemies_create() constructor 
{

	name = "Enemy";
	
	hp =
	{
		max_health: 1,
		current_health: 1
	};

	tribute_amount = 1;

	state = "Idle";
	
	movement = 
	{
		type: "fly",
		speed: 5,
		jump_cooldown: 10
	};
	
	attack = 
	{
		attack_options: ["collide"],
		
		// TODO = Dodge window structure
		dodge_window: [],// TODO Dodge start and end; multi-dimensional array?
		
		cooldown: [10]
	}

}