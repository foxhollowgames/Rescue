if (global.player.has_jumped)
{
	sc_moving();
}

// Debug stuff
if keyboard_check_pressed(ord("V"))
{
	radius_draw = !radius_draw;
}

// Bomb destruction
if (obj_player.bomb_hazards_counter == 0)
{
	instance_destroy();
}