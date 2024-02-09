// This checks if 'grounded' is true. This means the character is
// standing on ground, so we can store a reset position in case they fall.
if(state == STATES.IDLE)
{
	grounded_x = x;
	grounded_y = y;
}

if (!global.player.has_jumped)
{
	global.player.has_jumped = true;
}

if (state == STATES.IDLE || state == STATES.JUMPING)
{
	if (vel_y == 0)
	{
		can_rise = true;
	}
	
	sc_jumping();
}