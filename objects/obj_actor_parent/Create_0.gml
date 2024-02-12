state = STATES.IDLE;

grounded = 0;

grounded_x = x;
grounded_y = y;

vel_x = 0;
vel_y = 0;

grav_speed = 1;

jump =  
{
	height: 3,
	// speed_x is the boost given to x momentum
	speed_x: 8,
	falling: spr_falling,
	charge_length: 0,
	current_count: 0,
	max_count: 1
};

moving_sprite = noone;
idle_sprite = noone;
jump_sprite = noone;
fall_sprite = noone;

// Easy utility variables
on_floor = 0;
on_ceiling = place_meeting(x, y - 1, obj_collision);