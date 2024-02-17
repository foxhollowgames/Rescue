draw_self();
draw_set_color(c_black);

draw_text(x, y-50, state);

draw_text(x, y - 100, "Vel_y: " + string(vel_y));
draw_text(x, y - 125, "Vel_x: " + string(vel_x));

draw_text(x, y - 150, "Tribute: " + string(global.player.tribute));

// Visualize jumps left
//draw_healthbar(x-20,y, x-15, y+40, round((jump.current_count/jump.max_count)*100),c_black,c_red,c_lime,3,true,true);