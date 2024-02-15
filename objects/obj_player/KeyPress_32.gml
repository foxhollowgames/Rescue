/// @ Start the jump script and increment jump count
var _can_ground_pound = false;

if(state == STATES.IDLE)
{
	grounded_x = x;
	grounded_y = y;
	vel_x = 0;
	vel_y = 0;
	jump.current_count = 0;
}

if (jump.current_count <= jump.max_count)
{
	jump.current_count += 1;
	vel_y = 0;
	can_rise = true;
	audio_play_sound(jump_1, 2, false);
	sc_jumping();
}

else 
{
	sc_ground_pound();
}
