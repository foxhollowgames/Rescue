// Run the move function
if (global.player.has_jumped)
{
	sc_moving();
}

// Check for states, then set appropriate sprite and run relevant script
switch (state)
{
	case STATES.IDLE:
		if (vel_y > 0)
		{
			state = STATES.JUMPING;
		}
		break;
			
	case STATES.JUMPING:
		if (vel_y <= 0)
		{
			state = STATES.FALLING;
		}
		break;
		
	case STATES.FALLING:
		if (on_floor)
		{
			state = STATES.IDLE;
		}
		
		if (vel_y < 0)
		{
			state = STATES.JUMPING;
		}
		break;
			
			
	case STATES.DAMAGED:
		// Run an animation, then reset state to idle
		break;
			
	case STATES.DEATH:
		// Run the animation, then destroy
		break;
			
	case STATES.MOVING:
		// Check if attacking, then move state
		break;	
}