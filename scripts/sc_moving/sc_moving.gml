function sc_moving() 
{

	if (global.paused)
	{
		exit;
	}

	if (state == STATES.IDLE || state == STATES.VULNERABLE && object_get_parent(object_index) != obj_enemy_parent)
	{
		vel_x = global.scroll_speed;
	}
	
	
				
	if (object_get_parent(object_index) == obj_enemy_parent && obj_player.gravity_well && distance_to_object(obj_player) <= obj_player.gravity_well_radius)
	{
		vel_x /= obj_player.gravity_well_strength;
		vel_y /= obj_player.gravity_well_strength;
	}
		
	if (object_get_parent(object_index) != obj_tribute_parent && object_get_parent(object_index) != obj_speed_ring && object_get_parent(object_index) != obj_barrel)
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
				//vel_y = 0;
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
			// Sine movement
			if (movement_type == 1)
			{
				x += vel_x;
				y = sine_wave(current_time / 1000, period, amplitude, ini_y);
			}
			
			// Dash and explode movement
			else if (movement_type == 2)
			{
				// TODO: Make it actually move to the point. It's not moving or is yeeting to 0, 0 and I can't figure out why.
				move_towards_point(x_destination, y_destination, vel_x);
				x += vel_x;
				y += vel_y;
							
			}
			
			// Basic right to left movement
			else
			{
				x += vel_x;
				y += vel_y;
			}
		}
			
		// Platform movement
		else if ((object_get_parent(object_index) == obj_collision))
		{
			//move_and_collide(vel_x, vel_y, [ obj_collision ], 100);
			x += global.scroll_speed;
	
			// Push the player back so the platform doesn't move
			if (collision_line(bbox_left - 9, bbox_top, bbox_left - 9, bbox_bottom, [ obj_player ], false, false) != noone) 
			{
				obj_player.vel_x = 0;
				repeat (abs(vel_x)) {
					obj_player.x--;
				}
			}
		}
		
		else
		{
			 x += global.scroll_speed;
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

