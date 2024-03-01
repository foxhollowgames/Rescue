/// @description Enemy specific variables

// Inherit the parent event
event_inherited();

vel_x = global.scroll_speed;

attack_radius = 1000;
attack_speed = 10;

attack_counter = 60;
attack_frames = attack_counter;

radius_draw = true;

if (obj_player.extra_vulnerability)
{
	vulnerable_frames += 30;
	vulnerable_counter = vulnerable_frames;
}