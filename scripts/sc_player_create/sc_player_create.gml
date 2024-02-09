function sc_player_create() 
{
	
	// Define global struct for PLAYER
	global.player = 
	{
		player_state: STATES.IDLE,
		jump: 
		{
			height: 7,
			// speed_x is the boost given to x momentum
			speed_x: 10,
			jump_sprite: spr_jump_sprite,
			charge_length: 0
		},
		
		has_jumped: false,
	
		hp:
		{
			max_health: 3,
			current_health: 3
		},
	
		acquired_boons: [],
		tribute: 0,
	};
}