// Run the move function
if (global.player.has_jumped)
{
	check_collision();
	sc_moving();
}


// Check for states, then set appropriate sprite and run relevant script
switch (state)
{
	case STATES.IDLE:
		if (vel_y < 0)
		{
			state = STATES.JUMPING;
		}
		
		if (vel_y > 0)
		{
			state = STATES.FALLING;
		}
		
		if (vulnerable_counter < vulnerable_frames && vulnerable_counter != 0)
		{
			state = STATES.VULNERABLE;
		}
		
		if (damaged_counter < damaged_frames && damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		break;
			
	case STATES.JUMPING:
		if (vel_y >= 0)
		{
			state = STATES.FALLING;
		}
		
		if (damaged_counter < damaged_frames && damaged_counter > 0)
		{
			state = STATES.DAMAGED;
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
		
		if (damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		
		break;
			
			
	case STATES.DAMAGED:
		// Run an animation, then reset state to idle
		if (damaged_counter <= 0)
		{
			if (on_floor)
			{
				state = STATES.IDLE;
			}
			
			else if (vel_y > 0)
			{
				state = STATES.JUMPING;
			}
			
			else
			{
				state = STATES.FALLING;
			}
		}
		
		break;
		
	case STATES.VULNERABLE:
		if (vulnerable_counter <= 0)
		{
			state = STATES.ATTACKING;
		}
		if (damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		
	case STATES.ATTACKING:
		if (vel_x == 0)
		{
			state = STATES.IDLE;
		}
			
	case STATES.DEATH:
		// Run the animation, then destroy
		break;
			
	case STATES.MOVING:
		// Check if attacking, then move state
		break;	
}

if (damaged_counter > 0)
{
	damaged_counter--;
}