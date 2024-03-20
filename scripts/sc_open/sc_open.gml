function sc_open(){
	// check if the timer is complete
		// Increment tribute_total by value
		// Destroy the instance
		
	if (self.open_timer < self.open_timer_duration)
	{
		self.open_timer++;
		exit;
	}
	
	else
	{
		global.player.tribute += self.value;
		//show_debug_message(global.player.tribute);
				//show_debug_message(self.value);
		global.player.tribute_counter++;
		if (global.player.tribute_counter >= global.player.gather_rate && obj_player.gather_tribute)
		{
			global.player.tribute++;
			global.player.tribute_counter = 0;
		}
		instance_destroy();
	}
}