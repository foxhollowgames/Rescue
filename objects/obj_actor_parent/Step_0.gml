// Run the move function
if (global.player.has_jumped)
{
	sc_moving();
	//sc_gravity();
}

if (place_meeting(x, y+1, obj_collision))
{
	on_floor = true;
	if (object_get_parent(object_index) == obj_actor_parent)
	{
		sprite_index = idle_sprite;
		jump.current_count = 0;
		//can_rise = true;
	}
}

// Check for states, then set appropriate sprite and run relevant script
switch (state)
{
	case STATES.IDLE:
		if (vel_y < 0)
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
		if (damaged_frame_counter <= 0)
		{
			damaged_frame_counter = damaged_frames;
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
		else
		{
			damaged_frame_counter--;
		}
		break;
			
	case STATES.DEATH:
		// Run the animation, then destroy
		break;
			
	case STATES.MOVING:
		// Check if attacking, then move state
		break;	
}