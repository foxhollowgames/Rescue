function sc_open(){
	// check if the timer is complete
		// Increment tribute_total by value
		// Destroy the instance
		
	if (open_timer < open_timer_duration)
	{
		exit;
	}
	
	global.player.tribute += value;
	global.player.tribute_counter++;
	if (global.player.tribute_counter >= global.player.gather_rate && obj_player.gather_tribute)
	{
		global.player.tribute++;
		global.player.tribute_counter = 0;
	}
	instance_destroy(self);
}