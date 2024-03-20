scroll_rate_frames = 3;
scroll_rate_counter = scroll_rate_frames;

max_angle = 45;
min_angle = 45;

vel_x = 0;
vel_y = 0;

on_floor = false;
on_r_wall = false;
on_l_wall = false;

state = STATES.IDLE;

grav_speed = 0;

jump_key_pressed = keyboard_check_pressed(vk_space);

arrow = noone;
arrow_angle = noone;

active = false;
shot = false;


speed_boost = 10;
boost_frames = 45;
boost_counter = boost_frames;