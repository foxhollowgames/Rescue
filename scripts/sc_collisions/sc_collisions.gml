// This function checks if the instance is colliding
// with an object, or a tile, at the current
// position + the given movement values (_move_x and
// _move_y).
// The function returns true if a collision was found,
// or false if a collision was not found.
function check_collision() 
{
	
	// Check floor collision
	
	on_floor = collision_line(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, [ obj_collision ], false, false) != noone;
	on_r_wall = collision_line(bbox_right + 1, bbox_top, bbox_right + 1, bbox_bottom, [ obj_collision ], false, false) != noone;
	on_l_wall = collision_line(bbox_left - 1, bbox_top, bbox_left - 1, bbox_bottom, [ obj_collision ], false, false) != noone;
	

	if (on_floor)
	{	
		//on_floor = true;

		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = idle_sprite;
			jump.current_count = 0;
		}
		return true;
	}
	
	else
	{
		on_floor = false;
	}
	
	// Check for player collisions with enemies
	if (object_index == obj_player && place_meeting(x, y, obj_enemy_parent))
	{
		/// Enter hurt state
		// TODO: Refactor into a switch statement?
		if (state == STATES.DAMAGED || state == STATES.ATTACKING)
		{
			exit;
		}
		
		else if (instance_exists(obj_barrel))
		{
			if (obj_barrel.active == true)
			{
				exit;
			}
		}

		else if (shield <= 0)
		{
			damaged_counter = damaged_frames;
			health--;
	
			state = STATES.DAMAGED;
		}

		else
		{
			damaged_counter = damaged_frames;
			shield--;

			state = STATES.DAMAGED;
		}
	}
	
	// Check for player collisions with speed rings
	if (object_index == obj_player && place_meeting(x, y, obj_speed_ring))
	{
		vel_x += obj_speed_ring.speed_boost;
	}
	
	// Check for player collisions with tribute
	if (object_get_parent(object_index) == obj_tribute_parent && place_meeting(x, y, obj_player))
	{
		sc_open();

		open_timer += 1;
	}
	
	// Check for player collisions with platforms
	if (object_index == obj_player && place_meeting(x, y, obj_collision))
	{
		while (place_meeting(x, y, obj_collision))
		{
			y++;
		}
	}
	
}
