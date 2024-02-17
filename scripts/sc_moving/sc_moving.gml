function sc_moving() 
{
	// This flag is for platforms and tribute currently, should get refactored out
	if (state == STATES.IDLE)
	{
		vel_x = global.scroll_speed;
	}
	
	if (object_get_parent(object_index) != obj_tribute_parent)
	{
		move_and_collide(vel_x, vel_y, [obj_collision, obj_player]);
	}
	
	else x += global.scroll_speed;
	
	//if (object_get_name(object_index) == "obj_player")
	//{
	//	//show_debug_message(vel_y)
	//}
	
	// Do we want the vel_y here or in the objects?
	if (state == STATES.JUMPING)
	{
		vel_y -= grav_speed/4;
	}
	
	else if (state != STATES.IDLE || !place_meeting(x, y+1, obj_collision))
	{
		vel_y -= grav_speed;
		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = fall_sprite;
		}
	}	

}

