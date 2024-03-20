// Inherit the parent event
event_inherited();
// TODO: This is an extra pause that shouldn't need to exist but is needed to stop the attack counter from decrementing
if (global.paused)
{
	exit;
}

if (global.player.has_jumped)
{
	sc_moving();
}
else
{
	exit;
}

// Debug stuff
if keyboard_check_pressed(ord("V"))
{
	radius_draw = !radius_draw;
}

if (movement_type = 0)
{
// Attack logic
if (distance_to_object(obj_player) <= attack_radius && cooldown_counter >= 0 && vulnerable_counter == vulnerable_frames)
{
	//show_debug_message("distance_to_object: " + string(distance_to_object(obj_player)));
	//show_debug_message("attack_radius: " + string(attack_radius));
	state = STATES.VULNERABLE;
}

if (state == STATES.VULNERABLE)
{
	vulnerable_counter--;
	
	if (vulnerable_counter <= 0)
	{
		state = STATES.ATTACKING;
	}
}

if (state == STATES.ATTACKING && attack_counter > 0)
{
	if (attack_dir == noone)
	{
		attack_dir = point_direction(x, y, obj_player.x, obj_player.y);
	}
			
	vel_x = lengthdir_x(attack_speed_x, attack_dir);
	vel_y = lengthdir_y(attack_speed_y, attack_dir);
		
	attack_counter--;
}
	
// End the attack
else if (state == STATES.ATTACKING && attack_counter <= 0)
{
	vel_x = global.scroll_speed;
	vel_y = 0;
	attack_counter = attack_frames;
	image_blend = make_color_hsv(255, 255, c_white);
	attack_dir = noone;
	cooldown_counter = cooldown_frames;
	
	state = STATES.IDLE;
}

if (cooldown_counter > 0)
{
	cooldown_counter--;
	vel_x = global.scroll_speed;
	vel_y = 0;
	attack_dir = noone;
}

}