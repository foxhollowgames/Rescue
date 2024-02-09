function sc_open(){
	// check if the timer is complete
		// Increment tribute_total by value
		// Destroy the instance
		
	if (open_timer < open_timer_duration)
	{
		exit;
	}
	
	global.player.tribute += value;
	instance_destroy(self);
}