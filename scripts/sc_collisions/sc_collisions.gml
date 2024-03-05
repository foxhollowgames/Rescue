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
		on_floor = true;

		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = idle_sprite;
			jump.current_count = 0;
		}
		return true;
	}
	
	if (on_r_wall)
	{
		//on_r_wall = true;
	}
	
	else
	{
		on_floor = false;
	}
	
}
