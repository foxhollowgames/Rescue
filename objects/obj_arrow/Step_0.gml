/// @description Rotate up and down until the player jumps, then give speed boost

if (global.paused)
{
	exit;
}

if (obj_barrel.scroll_rate_counter <= 0)
{
	image_angle += angle_sign;
	obj_barrel.scroll_rate_counter = obj_barrel.scroll_rate_frames;
}
else
{
	obj_barrel.scroll_rate_counter--;
}
	
	
if (image_angle >= 45)
{
	angle_sign = -1;
}

else if (image_angle <= -45)
{
	angle_sign = 1;
}
