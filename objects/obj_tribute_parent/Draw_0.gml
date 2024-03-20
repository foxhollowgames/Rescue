draw_self();

draw_healthbar(bbox_left, bbox_top, bbox_right, bbox_top - 15, open_timer, make_color_rgb(0, 0, 0), c_aqua, c_aqua, 0, false, false);

if (!global.debug)
{
	exit;
}


draw_text(x, y - 50, open_timer)