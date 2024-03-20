enum STATES {
		IDLE,
		JUMPING,
		FALLING,
		DAMAGED,
		DEATH,
		DOUBLE_JUMP,
		ATTACKING,
		VULNERABLE,
		GROUND_POUND_START,
		GROUND_POUND_END,
		MOVING
}


function sc_world_create() 
{
	sc_boons_create();
	sc_gods_create();
	sc_player_create();
	
	audio_play_sound(mus_reflections, 1, true);
	
	global.debug = false;

	global.scroll_rate_ini = 4;
	global.scroll_rate = global.scroll_rate_ini;
	global.scroll_speed =  abs(global.scroll_rate) * -1;
	
	// Set up variables for the shrine checkpoints
	global.checkpoint_frames = 3600;
	global.checkpoint_counter = 0;
	
	// Checkpoints for the different acts
	global.progress = 0;
	global.act_1_progress = 3;
	global.act_2_progress = 6;
	global.act_3_progress = 9;
	
	// Set up spawning
	global.tribute_spawn_rate = 5;
	global.large_tribute_chance = 12;
	global.huge_tribute_chance = 0;
	global.min_distance = 300;
	
	// Speed Ring variables
	global.speed_ring_chance = 0;

	// Barrel variables
	global.barrel_chance = 0;

	// Enemy spawn variables
	global.spawn_chance =  1;
	
	// Bounce rate
	global.platform_bounce_chance = 0;
	
	// Pause state
	global.paused = false;

	
}