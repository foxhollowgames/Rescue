/// @ Start the jump script and increment jump count
var _can_ground_pound = false;

if(state == STATES.IDLE)
{
	grounded_x = x;
	grounded_y = y;
	vel_x = 0;
}

if (jump.current_count <= jump.max_count)
{
	jump.current_count += 1;
	vel_y = 0;
}

else 
{
	_can_ground_pound = true;
}


if ((state == STATES.FALLING)) 
{
	sc_jumping();
}
	
// Check if we have jump counts remaining and if we don't, exit the function
else if (_can_ground_pound)
{
	sc_ground_pound();
	_can_ground_pound = false;
	exit;
}	
