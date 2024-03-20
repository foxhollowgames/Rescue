/// @description Draw the name

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_self();
draw_set_font(Raleway);
if (collision_point(mouse_x, mouse_y, self, false, false))
{
	draw_sprite(spr_button_hover, 0, bbox_left - 26, y);
}
draw_text(x, y, name);
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_font(Raleway_small);

