// Inherit the parent event
event_inherited();

global.player.has_jumped = false;


jump.height = 7;
jump.speed_x = 4;
jump.max_count = 1;
can_rise = true;

// Set sprites for states
moving_sprite = noone;
idle_sprite = spr_idle;
jump_sprite = spr_jump_sprite;
fall_sprite = spr_falling;