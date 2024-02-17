// Inherit the parent event
event_inherited();

global.player.has_jumped = false;


jump.height = 7;
jump.speed_x = 4;
jump.max_count = 1;
jump.frame_max = 7;
//jump.frame_current = 0;
//can_rise = true;
on_floor = true;

// Set sprites for states
moving_sprite = noone;
idle_sprite = dog_sprite_v0_1;
jump_sprite = spr_jump_sprite;
fall_sprite = spr_falling;

xSpd = 0;
ySpd = 0;

moveSpd = 2;
grav = .25;

// Jumping variables
jumpSpd = -2.5;

jumpMax = 2;
jumpCount = 0;

jumpHoldFrames = 15;
jumpTimer = 0;


// Set up jumping trails for easier debugging
//var _trail = part_type_create();
//part_type_color1(_trail, c_red);
//part_type_size(_trail, 1, 1, 0, 0);
//part_type_sprite(_trail, dog_sprite_v0_1, 0, 0, 1);