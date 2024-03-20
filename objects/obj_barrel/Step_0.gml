if (global.paused)
{
	exit;
}

if (global.player.has_jumped)
{
	sc_moving();
}

jump_key_pressed = keyboard_check_pressed(vk_space);

if (active)
{
	
	obj_player.vel_x = 0;
	obj_player.vel_y = 0;

}


else if (place_meeting(x, y, obj_player))
{
	sc_stop_scroll();
	
	active = true;
	
	obj_player.image_alpha = 0;
	
	obj_player.vel_x = 0;
	obj_player.vel_y = 0;
	obj_player.x = bbox_right + obj_player.sprite_width;
	obj_player.y = y;

	arrow = instance_create_layer(bbox_right, y, "Instances", obj_arrow);
}

if (shot)
{

		obj_player.vel_x = lengthdir_x(speed_boost, arrow_angle);
		obj_player.vel_y = lengthdir_y(speed_boost, arrow_angle);
		obj_player.image_alpha = 1;
		obj_player.image_blend = c_white;

		boost_counter--;
		
		if (boost_counter <= 0)
		{
			shot = false;
		}
}