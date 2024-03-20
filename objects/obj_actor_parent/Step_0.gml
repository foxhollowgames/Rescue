// Run the move function

if (global.paused)
{
	image_speed = 0;
	exit;
}
else
{
	image_speed = 1;
}

if (global.player.has_jumped)
{
	check_collision();
	sc_moving();
	sc_out_of_bounds();
}
else if (object_index == obj_player && obj_player.jumpCount >= obj_player.jumpMax)
{
	check_collision();
	sc_moving();
	sc_out_of_bounds();
}

if (damaged_counter > 0)
{
	damaged_counter--;
}