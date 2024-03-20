/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
			
if (x <= room_width / 2)
{
	if (explosion_counter <= 0)
	{
		image_xscale++;
		image_yscale++;
		vel_x = 0;
		vel_y = 0;
		explosion_counter = explosion_frames;
	}
	else
	{
		explosion_counter--;
	}
	
	if (image_xscale >= 5)
	{
		instance_destroy();
	}
}