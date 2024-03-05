function sc_moving() 
{

	if (state == STATES.IDLE)
	{
		vel_x = global.scroll_speed;
	}
	
	if (object_get_parent(object_index) != obj_tribute_parent)
	{
		// Player movement
		if (object_index == obj_player)
		{
			// Don't let the player leave the top or right sides of the room
			if (x + vel_x >= room_width)
			{
				vel_x = 0;
			}
			
			if (y - vel_y <= sprite_height)
			{
				vel_y = 0;
			}
	
			// Move and collide
			move_and_collide(vel_x, vel_y, [obj_collision], 100);
		}
		
		//  Enemy movement
		else if (object_get_parent(object_index) == obj_enemy_parent)
		{
			x += vel_x;
			y += vel_y;
		}
			
		// Platform movement
		else if ((object_get_parent(object_index) == obj_collision))
		{
			move_and_collide(vel_x, vel_y, [ obj_collision ]);
			
			if (collision_line(bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, [ obj_player ], false, false) != noone) {
				repeat (abs(vel_x)) {
					obj_player.x--;
				}
			}
		}
		
	}
	
	else x += global.scroll_speed;
	
	//if (object_get_name(object_index) == "obj_player")
	//{
	//	//show_debug_message(vel_y)
	//}
	
	// Do we want the vel_y here or in the objects?
	
	// TODO: Investigate why the player is not landing on the platform
	// Gravity
	if (state == STATES.JUMPING)
	{
		vel_y += grav_speed/4;
	}
	
	else if (state != STATES.IDLE)
	{
		vel_y += grav_speed;
		if (object_get_parent(object_index) == obj_actor_parent && state == STATES.FALLING)
		{
			sprite_index = fall_sprite;
		}
	}	


}

