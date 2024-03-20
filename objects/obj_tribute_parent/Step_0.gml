if (global.paused)
{
	exit;
}

if (global.player.has_jumped)
{
	check_collision();
	sc_moving();
	sc_out_of_bounds();
}