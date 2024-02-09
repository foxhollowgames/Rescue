// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_state_falling() 
{
	sprite_index = jump.falling;
	
	
	// This adds the grav_speed value to the vel_y variable.
	// Doing so applies gravity to the character's vertical
	// velocity, pulling it down each frame to make it fall.
	vel_y += grav_speed;
	
	// If grounded, reset state to idle
	if(grounded == true)
	{
		state = STATES.IDLE;
	}
}