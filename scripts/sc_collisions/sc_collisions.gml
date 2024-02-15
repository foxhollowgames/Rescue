// This function checks if the instance is colliding
// with an object, or a tile, at the current
// position + the given movement values (_move_x and
// _move_y).
// The function returns true if a collision was found,
// or false if a collision was not found.
function check_collision(_move_x, _move_y) 
{
	
	// Check floor collision
	_obj_collision_check = place_meeting(x, y - _move_y, [obj_collision]);
	if ((_obj_collision_check > 0) && (vel_y <= 0))
	{
		on_floor = true;
		if (object_get_parent(object_index) == obj_actor_parent)
		{
			sprite_index = idle_sprite;
			jump.current_count = 0;
			can_rise = true;
		}
		return true;
	}
	
	return false;
	
}
