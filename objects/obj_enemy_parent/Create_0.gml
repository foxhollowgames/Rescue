/// @description Enemy specific variables

// Inherit the parent event
event_inherited();

vel_x = global.scroll_speed;

attack_radius = 200;
attack_speed = 10;

// Attack variables
attack_speed_x = 10;
attack_speed_y = 15;
attack_frames = 60;
attack_counter = attack_frames;
attack_dir = noone;
closest_enemy = noone;

radius_draw = true;

if (obj_player.extra_vulnerability)
{
	vulnerable_frames += 30;
	vulnerable_counter = vulnerable_frames;
}