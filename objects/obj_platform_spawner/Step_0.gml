/// @description Spawn in platforms

var _platform_count = instance_number(obj_ground);

// Add in a way to check for the sprite height and adjust the available options accordingly
//var _spawn_y = choose(row_1,row_2,row_3,row_4,row_5,row_6,row_7,row_8,row_9,row_10,row_11,row_12,row_13,row_14,row_15,row_16,row_17,row_18,row_19,row_20,row_21,row_22,row_23,row_24);

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


if (instance_exists(obj_player) && _platform_count < 8 && global.player.has_jumped && ((room_width - most_recent.bbox_right) > min_distance))
{
	if _platform_count > 8
	{
		exit;
	}
	
	var _platform_make = obj_ground;
	
	var _nex_x = random_range(220, room_width - 220);
	while (point_distance(_nex_x, 01, obj_player.x, 0) < 200)
	{
		_nex_x = random_range(220, room_width - 220);
	}
	
	most_recent = instance_create_layer(room_width + 2, spawn_y, "platform_layer", _platform_make);
}