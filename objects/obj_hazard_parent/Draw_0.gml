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
