function sc_moving() 
{
	
	// TODO: Prevent any movement outside of the top or right sides of the room
	
	// TODO: This flag is for platforms and tribute currently, should get refactored out
	if (state == STATES.IDLE)
	{
		vel_x = global.scroll_speed;
	}
	
	if (object_get_parent(object_index) != obj_tribute_parent)
	{
		if (object_get_parent(object_index) == obj_actor_parent)
		{
			if (x + vel_x >= room_width)
			{
				vel_x = 0;
			}
			
			if (y - vel_y <= 0)
			{
				vel_y = 0;
			}
			
			move_and_collide(vel_x, vel_y, [obj_collision]);
		}

		else
		{
			move_and_collide(vel_x, vel_y, [obj_ground, obj_player]);
		}
		
	}
	
	else x += global.scroll_speed;
	
	//if (object_get_name(object_index) == "obj_player")
	//{
	//	//show_debug_message(vel_y)
	//}
	
	// Do we want the vel_y here or in the objects?
	if (state == STATES.JUMPING)
	{
		vel_y += grav_speed/4;
	}
	
	else if (state != STATES.IDLE || !on_floor)
	{
		vel_y += grav_speed;
		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = fall_sprite;
		}
	}	
	
	else
	{
		vel_y = 0;
	}

}

