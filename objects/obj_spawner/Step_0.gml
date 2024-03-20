/// @description Spawn in platforms, tribute, enemies, and hazards
if (global.paused)
{
	exit;
}

if (can_spawn)
{
	
// Decrement checkpoint timer
if (global.player.has_jumped)
{
	global.checkpoint_counter--;
}

if (global.checkpoint_counter <= 0)
{
	global.progress++;
	room_goto(rm_shrine);
}

if (global.progress == global.act_1_progress)
{
	room_goto(rm_to_be_continued);
}

if (random_counter == 0)
{
	random_spawn_number = irandom(100);
	random_counter = random_frames;
	spawn_enabled = true;
}
else
{
	random_counter--;
}


// PLATFORM AND TRIBUTE SPAWNING
var _platform_count = instance_number(obj_ground);

if (global.player.has_jumped)
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

	else if (_r <= bottom_chance)
	{
		spawn_y = bottom_third[random_range(0, array_length(bottom_third))];
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}
	
	//// Check if the player can actually jump to the next platform and if not, lower it down some. This needs refactoring eventually
	//if (most_recent.y - 300 > spawn_y)
	//{
	//	spawn_y += 400;
	//}

	if (instance_exists(most_recent))
	{
	
			var _r_offset = irandom(15);
			if (platform_counter_1 == 0)
			{
				sc_platform_spawn(_platform_make);				
				platform_counter_1 = platform_frames_1 + _r_offset;
			}
			
			if (platform_counter_2 == 0)
			{
				sc_platform_spawn(_platform_make);
				platform_counter_2 = platform_frames_2 + _r_offset;
			}
			
			if (platform_counter_3 == 0)
			{
				sc_platform_spawn(_platform_make);
				platform_counter_3 = platform_frames_3 + _r_offset;
			}
			
			if (platform_counter_4 == 0)
			{
				sc_platform_spawn(_platform_make);
				platform_counter_4 = platform_frames_4 + _r_offset;
			}
			
			platform_counter_1--;
			platform_counter_2--;
			platform_counter_3--;
			platform_counter_4--;
//}
	}
	else
	{
		most_recent = instance_create_layer((room_width * 1.1), spawn_y, "platform_layer", _platform_make);			
	}
	
	var _bounce_chance = irandom(100);
	if (global.platform_bounce_chance > _bounce_chance)
	{
		most_recent.bouncy = true;
	}
	
	// Spawn in tribute on top of the platform
	// If chance triggers
	if (random_spawn_number <= global.tribute_spawn_rate + (global.progress * tribute_scaler) && !most_recent.tribute_spawned)
	{
		
		most_recent.tribute_spawned = true;
		var _r = irandom(100);
		if (_r < global.huge_tribute_chance)
		{
			instance_create_layer(most_recent.x, most_recent.bbox_top - 75, "Instances", obj_tribute_huge);
		}
			
		else if (_r < global.large_tribute_chance)
		{
			instance_create_layer(most_recent.x, most_recent.bbox_top - 75, "Instances", obj_tribute_large);
		}
			
		else
		{
			instance_create_layer(most_recent.x, most_recent.bbox_top - 75, "Instances", obj_tribute_small);	
		}
		
	}

	
}

// SPEED RINGS SPAWNER
if (instance_exists(obj_player) && global.player.has_jumped)
{
	// Keep this so we can dynamically change which type of platform spawns based on god and progress %
	var _ring_make = obj_speed_ring;
	
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

	else if (_r <= bottom_chance)
	{
		spawn_y = bottom_third[random_range(0, array_length(bottom_third))];
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}
	
	
	if (random_spawn_number < global.speed_ring_chance)
	{
		while (collision_rectangle(room_width - (sprite_get_width(spr_speed_ring) / 2), spawn_y - (sprite_get_height(spr_speed_ring) / 2), room_width, spawn_y + ((sprite_get_height(spr_speed_ring) / 2)), all, false, true))
		{
			spawn_y++;
		}
		if (instance_exists(most_recent_ring))
		{
			if ((room_width - most_recent_ring.bbox_right) > global.min_distance)
			{
				most_recent_ring = instance_create_layer(room_width + sprite_width, spawn_y, "platform_layer", _ring_make);
			}
		}
		else
		{
			most_recent_ring = instance_create_layer(room_width + sprite_width, spawn_y, "platform_layer", _ring_make);			
		}
	}
}

// BARREL SPAWNER
if (instance_exists(obj_player) && global.player.has_jumped)
{
	// Keep this so we can dynamically change which type of platform spawns based on god and progress %
	var _barrel_make = obj_barrel;
	
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

	else if (_r <= bottom_chance)
	{
		spawn_y = bottom_third[random_range(0, array_length(bottom_third))];
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}

	if (global.barrel_chance > 0)
	{
		if (barrel_spawn_counter <= 0 )
		{
			if (random_spawn_number < global.barrel_chance)
			{
				while (place_meeting(room_width - 2, spawn_y, all))
				{
					spawn_y++;
				}
				if (instance_exists(most_recent_barrel))
				{
					if ((room_width - most_recent_barrel.bbox_right) > global.min_distance)
					{
						most_recent_barrel = instance_create_layer(room_width + sprite_width, spawn_y, "platform_layer", _barrel_make);
					}
				}
				else 
				{
					most_recent_barrel = instance_create_layer(room_width + sprite_width, spawn_y, "platform_layer", _barrel_make);
				}
				barrel_spawn_counter = barrel_spawn_frames;
			}
		} 
		else
		{
			barrel_spawn_counter--;
			//show_debug_message(barrel_spawn_counter);
		}
	}
}



// ENEMY SPAWNER
var _enemy_count = instance_number(obj_enemy_parent);
if (instance_exists(obj_player) && _enemy_count < 3 && global.player.has_jumped)
{
	var _enemy_primary = global.GOD1;
	var _enemy_secondary = global.GOD2;
	var _enemy_make = noone;
	for (var _i = 0; _i < array_length(global.pantheon); _i++)
	{
		if (global.pantheon[_i].relationship_total < _enemy_primary.relationship_total)
		{
			_enemy_secondary = _enemy_primary;
			_enemy_primary = global.pantheon[_i];
		}
	}
	
	// Enemy make = a random enemy between primary and secondary with the odds being in favor of primary
	var _enemy_chance = irandom(100);
	if (_enemy_chance <= 66)
	{
		var _random_enemy = irandom(array_length(_enemy_primary.enemies) - 1);
		_enemy_make = _enemy_primary.enemies[_random_enemy];	
	}
	
	else
	{
		var _random_enemy = irandom(array_length(_enemy_secondary.enemies) - 1);
		_enemy_make = _enemy_secondary.enemies[_random_enemy];
	}
	
	
	// Determine y spawn point
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

	else if (_r <= bottom_chance)
	{
		spawn_y = bottom_third[random_range(0, array_length(bottom_third))];
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}
	
	if (random_spawn_number <= global.spawn_chance * global.progress && spawn_enabled)
	{
		
		while (place_meeting(room_width - 2, spawn_y, all))
		{
			spawn_y++;
		}
		most_recent_enemy = instance_create_layer(room_width + sprite_width, spawn_y, "Instances", _enemy_make);
		spawn_enabled = false;
	}
	
}


// TODO: HAZARD SPAWNER

}