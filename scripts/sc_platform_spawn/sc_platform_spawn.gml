// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_platform_spawn(_platform_make){
	var _r_sprite = irandom(7) + 1;
	switch (_r_sprite)
	{
		case 1:
			_r_sprite = spr_platform_1;
			break;
		case 2:
			_r_sprite = spr_platform_2;
			break;
		case 3:
			_r_sprite = spr_platform_3;
			break;
		case 4:
			_r_sprite = spr_platform_4;
			break;
		case 5:
			_r_sprite = spr_platform_5;
			break;
		case 6:
			_r_sprite = spr_platform_6;
			break;
		case 7:
			_r_sprite = spr_platform_7;
			break;
		case 8:
			_r_sprite = spr_platform_8;
			break;
						
	}
	
	var _r = irandom(100);
	if (_r <= top_chance)
	{
		spawn_y = irandom_range(top_third[0], top_third[1]);
		top_chance = 15;
		middle_chance = 57;
		bottom_chance = 100;
	}
	else if (_r <= middle_chance)
	{
		spawn_y = irandom_range(middle_third[0], middle_third[1]);
		top_chance = 57;
		middle_chance = 15;
		bottom_chance = 100;
	}
	else 
	{
		spawn_y = irandom_range(bottom_third[0], bottom_third[1]);
		top_chance = 57;
		middle_chance = 100;
		bottom_chance = 15;
	}
	
	var _can_spawn = 70;
	var _buffer = 50;
	var _sprite = object_get_sprite(_platform_make);
	var _sprite_halved_h = sprite_get_height(_sprite) / 2 + _buffer;
	var _sprite_halved_w = sprite_get_width(_sprite) / 2 + _buffer;

	var _platform_collides = collision_rectangle(room_width - 100 - _sprite_halved_w, spawn_y - _sprite_halved_h, room_width - 100 + _sprite_halved_w, spawn_y + _sprite_halved_h, obj_ground, false, false);

	show_debug_message(_platform_collides);
	if ((_r <= _can_spawn || point_distance(room_width, room_height / 2, most_recent.x, room_height / 2) >= 300) && _platform_collides == -4)
	{
		//show_debug_message(spawn_y);
		//while (spawn_y >= most_recent.y - 250 && spawn_y <= most_recent.bbox_top)
		//{
		//	spawn_y--;
		//	show_debug_message("Decrement!");
		//}
		//while (spawn_y <= most_recent.y + 250 && spawn_y >= most_recent.bbox_bottom)
		//{
		//	spawn_y++;
		//	show_debug_message("Increment!");
		//}
		//show_debug_message(spawn_y);
		most_recent = instance_create_layer((room_width - 100), spawn_y, "platform_layer", _platform_make);
		most_recent.sprite_index = _r_sprite;
	}
}