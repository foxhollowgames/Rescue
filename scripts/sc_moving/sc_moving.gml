function sc_moving() 
{
	
	if ((state == STATES.IDLE) && (vel_x != global.scroll_speed))
	{
		vel_x += global.scroll_speed;
	}

	if (state == STATES.JUMPING)
	{
		vel_y -= grav_speed/4;
	}
	
	else if (state == STATES.FALLING)
	{
		vel_y -= grav_speed;
		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = fall_sprite;
		}
	}	
	
	// The section below handles pixel-perfect collision checking.
	// It does collision checking twice, first on the X axis, and
	// then on the Y axis.
	// On each axis, it moves the character pixel-by-pixel
	// until its velocity for that axis is covered, or a
	// collision is found.
	// '_move_count' is how many total pixels the character
	// needs to move this frame. It is the absolute value
	// of the velocity on an axis.
	// '_move_once' is the amount of pixels it needs to move
	// once, before checking for a collision. It is 1, 0, or -1.
	var _move_count = abs(vel_x);
	var _move_once = sign(vel_x);

	// This runs a loop, which runs '_move_count' times. All actions
	// attached to this are repeated that many amount of times.
	repeat(_move_count)
	{
		// This calls the check_collision function to check
		// for collisions on the X axis, if moved by the
		// _move_once value on that dimension. The Y argument
		// is set to 0, so for this collision there is no
		// Y movement.
		// The result of the function, either true or false,
		// is stored in the 'collision_found' variable, which
		// is temporary.
		var _collision_found = check_collision(_move_once, 0);
		
		x += _move_once;
	}

	// We now repeat all of the previous steps to check for collisions
	// on the Y axis.
	// Everything is the same, but vel_x is replaced by vel_y, and the
	// check_collision function takes a Y value (its second argument).
	_move_count = abs(vel_y);
	_move_once = sign(vel_y);

	// This runs a loop, which runs '_move_count' times. All actions
	// attached to this are repeated that many amount of times.
	repeat(_move_count)
	{
		// This calls the check_collision function to check
		// for collisions on the Y axis, if moved by the
		// _move_once value.
		// The result of the function, either true or false,
		// is stored in the 'collision_found' variable, which
		// is temporary.
		var _collision_found = check_collision(0, _move_once);

		// This checks if collision_found is equal to false,
		// meaning a collision was not found, and the player
		// is free to move once on the Y axis.
		if(_collision_found == false)
		{
			// In that case, _move_once is added to the Y coordinate
			// of the character.
			y -= _move_once;
		}

		// This 'Else' block runs if a collision was found.
		else
		{
			// In that case, we reset the Y velocity to 0,
			// so the character stops its movement on that
			// axis.
			vel_y = 0;
	
			// Then we break out of the Repeat loop, as no more
			// collision checks are required.
			break;
		}
	}

}

