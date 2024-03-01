// Inherit the parent event
event_inherited();

if (global.player.has_jumped)
{
	
	if (obj_player.gravity_well && distance_to_object(obj_player) <= obj_player.gravity_well_radius)
	{
		vel_x -= obj_player.gravity_well_strength;
		vel_y -= obj_player.gravity_well_strength;
	}
	
	sc_moving();
}

// Debug stuff
if keyboard_check_pressed(ord("V"))
{
	radius_draw = !radius_draw;
}

// Attack logic
if (distance_to_object(obj_player) <= attack_radius && cooldown_counter > 0)
{
	
	if (state = STATES.ATTACKING)
	{
		if (attack_counter > 0)
		{
			attack_counter--;
			move_towards_point(obj_player.x, obj_player.y, attack_speed);
		}
	}
	
	else
	{
		// This puts is into the vulnerable state, which will eventually trigger the attacking state
		vulnerable_counter--;
	}
}

if (cooldown_counter > 0)
{
	cooldown_counter--;
	vel_x = global.scroll_speed;
	vel_y = 0;
}

// Bomb destruction
if (obj_player.bomb_enemies_counter == 0)
{
	instance_destroy();
}