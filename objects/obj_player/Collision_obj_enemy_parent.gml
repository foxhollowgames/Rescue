/// @description Enter hurt state

if (state == STATES.DAMAGED || state == STATES.ATTACKING)
{
	exit;
}

else if (shield <= 0)
{
	damaged_counter = damaged_frames;
	health--;
	
	state = STATES.DAMAGED;
}

else
{
	damaged_counter = damaged_frames;
	shield--;

	state = STATES.DAMAGED;
}