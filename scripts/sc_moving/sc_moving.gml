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
			
			if (y - vel_y <= 0)
			{
				vel_y = 0;
				vel_y++;
			}
			
			if (on_r_wall || on_l_wall)
			{
				vel_x = 0;

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
			move_and_collide(vel_x, vel_y, [ obj_collision ], 100);

			if (collision_line(bbox_left - 5, bbox_top, bbox_left - 5, bbox_bottom, [ obj_player ], false, false) != noone) 
			{
				obj_player.vel_x = 0;
				repeat (abs(vel_x)) {
					obj_player.x--;
				}
			}
		}
		
	}
	
	else x += global.scroll_speed;
	
	// Do we want the vel_y here or in the objects?

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

