/// @description Visualize attack radius

draw_self();

if (radius_draw)
{
	draw_set_colour (c_red);
	draw_set_alpha(0.3);
	draw_circle(x, y, attack_radius, false);
	draw_set_alpha(1);
}

draw_set_color(c_black);

if (state == STATES.VULNERABLE)
{
	if (current_second % 2 == 0)
	{
		image_alpha = 0.3;
	}
	else
	{
		image_alpha = 1;
	}
	
	image_blend = make_colour_hsv(255, 255, c_white);
}

else if (state == STATES.ATTACKING)
{
	image_blend = make_colour_hsv(255, 255, c_black);
}



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

draw_text(x, y-75, vulnerable_counter);