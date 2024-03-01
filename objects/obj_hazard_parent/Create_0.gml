/// @description Enemy specific variables

// Inherit the parent event
event_inherited();

vel_x = global.scroll_speed;

attack_radius = noone;
attack_speed = noone;

attack_counter = noone;
attack_frames = attack_counter;

state = STATES.IDLE;

radius_draw = false;