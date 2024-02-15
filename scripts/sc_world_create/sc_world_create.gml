enum STATES {
		IDLE,
		JUMPING,
		FALLING,
		DAMAGED,
		DEATH,
		DOUBLE_JUMP,
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

	scroll_rate = 3;
	global.scroll_speed =  abs(scroll_rate) * -1;
}