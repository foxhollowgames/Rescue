function sc_gravity(){
	if (vel_y >= 0)
	{
		vel_y -= grav_speed;
	}
	
	else
	{
		vel_y = 0;
	}
}