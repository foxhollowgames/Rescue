/// @ Start the jump script and increment jump count


if ((state == STATES.FALLING) && jump.current_count <= jump.max_count) 
{
	sc_jumping();
}
	
// Check if we have jump counts remaining and if we don't, exit the function
else if (jump.current_count > jump.max_count)
{
	sc_ground_pound();
	exit;
}	

if (jump.current_count <= jump.max_count)
{
	jump.current_count += 1;
}
