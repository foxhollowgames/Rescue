	
	// Spawn in timeline and progress markers
	if (room == rm_level)
	{
		instance_create_layer(room_width / 2, 50, "Instances", obj_timeline);
		instance_create_layer(obj_timeline.bbox_left + (global.progress * global.checkpoint_frames), 75, "Instances", obj_player_progress);
	}