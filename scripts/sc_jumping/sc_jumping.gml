// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//TODO: One advantage of defining the jump by distance rather than velocity, and then computing the velocity, is that it makes it easier to do map design. "Can the player reach this? Yes, it's 4 units up." "We need to give the player an upgrade so they can hit this cliff that is 6 units high, so we need to add +2 to height." Making traversal values explicit will make content creation much less trial and error.
function sc_jumping() 
{

	if (vel_x <= jump.speed_x)
	{
		if (vel_x <= 0)
		{
			vel_x += (jump.speed_x/6);
		}
		
		vel_x += 1;
	}
	
	//vel_x = jump.speed_x;
	
	if ((vel_y <= jump.height) && can_rise)
	{
		if (vel_y == 0)
		{
			vel_y += (jump.height/12);
		}
		
		show_debug_message(jump.height);
		vel_y += 2;
	}
	
	else 
	{
		can_rise = false;
	}


	// Swap sprite
	sprite_index = jump_sprite;
	on_floor = false;

}