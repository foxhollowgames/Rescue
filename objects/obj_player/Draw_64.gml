/// @description Insert description here
// You can write your code in this editor

// Draw health
draw_set_alpha(.7);
for (var _health_count = 0; _health_count < health; _health_count++)
{
	draw_sprite(spr_dog_idle, 0, 100 + (_health_count * 100), 75);
}
draw_set_alpha(1);

// Draw tribute

draw_set_font(Raleway);
draw_set_color(make_color_hsv(25, 255, 100));
draw_text(50, 200, "Tribute: " + string(global.player.tribute));
draw_set_color(c_black);
draw_set_font(Raleway_small);