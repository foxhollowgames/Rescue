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

	global.scroll_rate = 3;
	global.scroll_speed =  abs(global.scroll_rate) * -1;
	
	// Set up variables for the shrine checkpoints
	global.checkpoint_frames = 3600;
	global.checkpoint_counter = 0;
	
	// Set up spawning
	global.tribute_spawn_rate = 10;
	global.large_tribute_chance = 25;
	global.min_distance = 150;
	
	// Speed Ring variables
	global.speed_ring_chance = 0;

	// Barrel variables
	global.barrel_chance = 0;

	// Enemy spawn variables
	global.spawn_chance =  5;
	
	// Bounce rate
	global.platform_bounce_chance = 0;
	
}