// This function checks if the instance is colliding
// with an object, or a tile, at the current
// position + the given movement values (_move_x and
// _move_y).
// The function returns true if a collision was found,
// or false if a collision was not found.
function check_collision() 
{
	
	// Check floor collision
	
	if (place_meeting(x, bbox_bottom + 1, obj_collision))
	{
		
		on_floor = true;

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
	
}
