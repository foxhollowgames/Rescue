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
if (distance_to_object(obj_player) <= attack_radius && cooldown_counter >= 0)
{
	
	// TODO: Get enemies pushing past the player. Right now, they stop exactly at them.
	if (state == STATES.ATTACKING && attack_counter > 0)
	{
		if (attack_dir == noone)
		{
			attack_dir = point_direction(x, y, obj_player.x, obj_player.y);
			show_debug_message(attack_dir);
		}
			
		vel_x = lengthdir_x(attack_speed_x, attack_dir);
		vel_y = lengthdir_y(attack_speed_y, attack_dir);
		
		attack_counter--;
	}
	
	// End the attack
	else if (state == STATES.ATTACKING && attack_counter <= 0)
	{
		vel_x = 0;
		vel_y = 0;
		attack_counter = attack_frames;
		image_blend = make_color_hsv(255, 255, c_white);
		attack_dir = noone;
		cooldown_counter = cooldown_frames;
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
	attack_dir = noone;
}

// Bomb destruction
if (obj_player.bomb_enemies_counter == 0)
{
	instance_destroy();
}