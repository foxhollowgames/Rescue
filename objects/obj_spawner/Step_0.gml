/// @description Spawn in platforms

// Decrement checkpoint timer
if (global.player.has_jumped)
{
	global.checkpoint_counter--;
}

if (global.checkpoint_counter <= 0)
{
	room_goto(rm_shrine);
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
// TODO: TRIBUTE SPAWNER
var _platform_count = instance_number(obj_ground);

// most_recent is breaking after a long time. Platforms stop spawning, then it loses the reference to the object.
if (instance_exists(obj_player) && global.player.has_jumped && ((room_width - most_recent.bbox_right) > global.min_distance))
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
	
	// Check if the player can actually jump to the next platform and if not, lower it down some. This needs refactoring eventually
	if (most_recent.y - 300 > spawn_y)
	{
		spawn_y += 400;
	}
	
	var _bounce_chance = irandom(100);
	if (global.platform_bounce_chance >= _bounce_chance)
	{
		_platform_make = obj_bouncy;
	}
		
	most_recent = instance_create_layer(room_width + 2, spawn_y, "platform_layer", _platform_make);
	
	// Spawn in tribute on top of the platform
	// If chance triggers
	if (random_spawn_number <= global.tribute_spawn_rate)
	{
		var _r = irandom(100);
		if (_r <= global.large_tribute_chance)
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
	
	if (random_spawn_number <= global.speed_ring_chance)
	{
		most_recent_ring = instance_create_layer(room_width + 2, spawn_y, "platform_layer", _ring_make);
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
	
	if (random_spawn_number <= global.barrel_chance)
	{
		most_recent_ring = instance_create_layer(room_width + 2, spawn_y, "platform_layer", _ring_make);
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
	
	if (random_spawn_number <= global.spawn_chance && spawn_enabled)
	{
		most_recent_enemy = instance_create_layer(room_width - 2, spawn_y, "Instances", _enemy_make);
		spawn_enabled = false;
	}
	
}


// TODO: HAZARD SPAWNER