if (global.paused)
{
	exit;
}

if (global.player.has_jumped)
{
	sc_moving();
	sc_out_of_bounds();
}