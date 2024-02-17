// Inherit the parent event
event_inherited();

jumpKeyPressed = keyboard_check_pressed(vk_space);
jumpKeyHold = keyboard_check(vk_space);

///////// Jumping code

// Reset the jump if you are idle
if (state == STATES.IDLE || on_floor)
{
	jumpCount = 0;
	vel_x = global.scroll_speed;
	vel_y = 0;
	
	// Set the jump timer
	//jumpTimer = jumpHoldFrames;
}
// If you fall off of a platform somehow, use up a jump
else
{
	if (jumpCount == 0)
	{
		jumpCount = 1;
	}
}

// Start the jump to move into the jump state
if ((jumpKeyPressed) && state == STATES.IDLE)
{
	 vel_y = jumpSpd;
}

// Initiate our jump
// TODO: Understand state machines....
if (jumpKeyPressed && jumpCount < jumpMax) 
{
			
	// Set on_floor to false
	on_floor = false;
	
	// Increment your number of performed jumps
	jumpCount++;

	audio_play_sound(jump_1, 2, false);
	show_debug_message(jumpCount);
		
	// Set the jump timer
	jumpTimer = jumpHoldFrames;
	
}

// End the jump early by stopping the timer if the jump button is not being held
if ((state == STATES.JUMPING) && !jumpKeyHold)
{
	jumpTimer = 0;
	state = STATES.FALLING;
}

// Jump based on the timer
if (jumpTimer > 0)
{
	// Constantly set the vel_y to be the jumpSpd
	vel_y = jumpSpd;
	vel_x = 4;
	
	// Decrement the timer
	jumpTimer--;
}	