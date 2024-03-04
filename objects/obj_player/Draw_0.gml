draw_self();
draw_set_color(c_black);


var _state = 0;
if (state == STATES.IDLE)
{
	_state = "IDLE";
}
else if (state == STATES.ATTACKING)
{
	_state = "ATTACKING";
}
else if (state == STATES.DAMAGED)
{
	_state = "DAMAGED";
}
else if (state == STATES.DEATH)
{
	_state = "DEATH";
}
else if (state == STATES.FALLING)
{
	_state = "FALLING";
}
else if (state == STATES.JUMPING)
{
	_state = "JUMPING";
}
else if (state == STATES.VULNERABLE)
{
	_state = "VULNERABLE";
}
else if (state == STATES.MOVING)
{
	_state = "MOVING";
}

draw_text(x, y-50, _state);

//draw_text(x, y - 100, "Vel_y: " + string(vel_y));
//draw_text(x, y - 125, "Vel_x: " + string(vel_x));

draw_text(x, y - 75, "Tribute: " + string(global.player.tribute));

draw_text(x, y - 100, "on_floor: " + string(on_floor));

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, true);


// Draw health
for (var _health_count = 0; _health_count < health; _health_count++)
{
	draw_sprite(spr_dog_idle, 0, 50 + (_health_count * 100), 50);
}

// Visualize jumps left
draw_healthbar(x-20,y, x-20, y+40, round((jumpCount / jumpMax)*100), c_black,c_red,c_lime,3,true,true);

// Gravity well visualization
if (gravity_well)
{
	draw_set_color(c_purple);
	draw_circle(x, y, gravity_well_radius, false);
	draw_set_color(c_white);
}

// Shield visualizations
if (shield_boon)
{
	draw_set_color(c_blue);
	draw_circle(x, y, shield_radius, false);
	draw_set_color(c_white);
}

if (projectile_shield_boon)
{
	draw_set_color(c_teal);
	draw_circle(x, y, projectile_shield_radius, false);
	draw_set_color(c_white);
}