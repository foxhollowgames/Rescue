/// @description Spawn in platforms

var _platform_count = instance_number(obj_ground);

// Add in a way to check for the sprite height and adjust the available options accordingly
//var _spawn_y = choose(row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,row_9,row_10,row_11,row_12,row_13,row_14,row_15,row_16,row_17,row_18,row_19,row_20,row_21,row_22,row_23,row_24);



// most_recent is breaking after a long time. Platforms stop spawning, then it loses the reference to the object.
if (instance_exists(obj_player) && _platform_count < 8 && global.player.has_jumped && ((room_width - most_recent.bbox_right) > min_distance))
{
	// Keep this so we can dynamically change which type of platform spawns based on god and progress %
	var _platform_make = obj_ground;
	
	// Weight the platforms to change altitude more often instead of strings of them.
	// Possibly put this into a script and have it be the harder difficulty with the easier one being more linear?
	var _r = irandom(100);

	if (_r <= top_chance)
	{
		spawn_y = top_third[random_range(0, array_length(top_third))];
		top_chance = 15;
		middle_chance = 57;
		bottom_chance = 100;
	}

	else if (_r <= middle_chance)
	{
		spawn_y = middle_third[random_range(0, array_length(middle_third))];
		top_chance = 57;
		middle_chance = 15;
		bottom_chance = 100;
	}

	else if (_r <= top_chance)
	{
		spawn_y = bottom_third[random_range(0, array_length(bottom_third))];
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}
	
	// Check if the player can actually jump to the next platform and if not, lower it down some. This needs refactoring eventually
	if (most_recent.y - 300 > spawn_y)
	{
		spawn_y += 400;
	}
	
	most_recent = instance_create_layer(room_width + 2, spawn_y, "platform_layer", _platform_make);
}