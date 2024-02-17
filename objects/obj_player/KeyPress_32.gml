/// @ Start the jump script and increment jump count
//var _can_ground_pound = false;


if (!global.player.has_jumped)
{
	global.player.has_jumped = true;
}

if(state == STATES.IDLE)
{
	// We need to reset to the most_recent platform instead
	//grounded_x = x;
	//grounded_y = y;
	
	vel_x = 0;
	vel_y = 0;
	jump.current_count = 0;
}

if (jump.current_count <= jump.max_count)
{
	//jump.frame_current++;
	jump.current_count += 1;
	vel_y = 0;
	//can_rise = true;
	audio_play_sound(jump_1, 2, false);
	//sc_jumping();
}

else 
{
	sc_ground_pound();
}
