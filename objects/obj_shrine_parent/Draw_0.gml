/// @description Display relationships, and status (opinion towards the player as well as total tribute spent)

draw_self();

draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text(x, y, god.name);
draw_text(x, y+75, relationship_level);
draw_text(bbox_right - 25, bbox_top + 25, god.tribute_total);

draw_text(bbox_left - 25, bbox_top - 25, god.relationship_total);

// Draw player's totasl tribute
draw_text(room_width / 2, room_height - 150, global.player.tribute);

// Show how much tribute is left, boons, and which levels they unlock at on hover
if (hover)
{
	draw_set_halign(fa_right);
	draw_rectangle_color(bbox_left - 300, bbox_top, bbox_left - 25, bbox_top + 300, c_black, c_dkgray, c_black, c_dkgray, false);
	if (god.tribute_total >= 5)
	{
		draw_set_color(c_yellow);
	}
	draw_text(bbox_left - 50, bbox_top + 25, "5: " + string(god.boons[0]));
	draw_set_color(c_white);

	if (god.tribute_total >= 10)
	{
		draw_set_color(c_yellow);	
	}
	draw_text(bbox_left - 50, bbox_top + 50, "10: " + string(god.boons[1]));
	draw_set_color(c_white);
		
	if (god.tribute_total >= 15)
	{
		draw_set_color(c_yellow);
	}
	draw_text(bbox_left - 50, bbox_top + 75, "15: " + string(god.boons[2]));
	draw_set_color(c_white);
}

draw_set_halign(fa_left);

draw_set_color(c_black);