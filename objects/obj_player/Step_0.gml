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
	
		 //Set the jump timer
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
		vel_y = 0;
		vel_y = jumpBoost;
		if (place_meeting(x, bbox_bottom +1, obj_bouncy))
		{
			vel_y += jumpBoost;
		}
	}

	// Initiate our jump
	// TODO: Understand state machines....
	if (jumpKeyPressed && jumpCount < jumpMax) 
	{
		vel_y = 0;
			
		// Set on_floor to false
		//on_floor = false;
	
		// Increment your number of performed jumps
		jumpCount++;

		audio_play_sound(jump_1, 2, false);
		//show_debug_message(jumpCount);
		
		// Set the jump timer
		jumpTimer = jumpHoldFrames;
	
	}

	// End the jump early by stopping the timer if the jump button is not being held
	if ((state == STATES.JUMPING) && !jumpKeyHold)
	{
		jumpTimer = 0;
		vel_y = 0;
		state = STATES.FALLING;
	}

	// Jump based on the timer
	if (jumpTimer > 0)
	{
		// Constantly set the vel_y to be the jumpSpd
		vel_y = jumpSpd;
		vel_x = jump_x + x_boost;
	
		// Decrement the timer
		jumpTimer--;
	}	

	else if (jumpKeyPressed && jumpTimer <= 0)
	{
		sc_ground_pound();
	}

	
	// Check if the player has hit ground after groundpounding and reset scroll speed	
	if (place_meeting(x, y+ (sprite_height / 2) + 1, obj_collision))
	{
		sc_clear_time_stop();
	}
	

////////// Attacking code


	// Check for and enter our attacking state
	if (instance_exists(obj_enemy_parent))
	{
		closest_enemy = instance_nearest(x, y, obj_enemy_parent);
		if (distance_to_object(closest_enemy) < closest_enemy.attack_radius && closest_enemy.state == STATES.VULNERABLE && closest_enemy.x > x)
		{
			image_blend = make_color_hsv(255, 255, c_green);
			if (jumpKeyPressed && attack_counter > 0)
			{
				state = STATES.ATTACKING;
				dash_counter++;
				if (dash_heal && dash_counter == dash_count_trigger)
				{
					lives++;
					dash_counter = 0;
				}
			}
		}
	}
	
	// Dash in the direction of the closest enemy
	if (state == STATES.ATTACKING && attack_counter > 0)
	{
		if (attack_dir == noone)
		{
			attack_dir = point_direction(x, y, closest_enemy.x, closest_enemy.y);
		}
		
		vulnerable_counter = 0;
		
		// If not teleport dash, set velocity
		if (!teleport_dash)
		{
			vel_x = lengthdir_x(attack_speed_x, attack_dir) + x_boost;
			vel_y = lengthdir_y(attack_speed_y, attack_dir);
		}
		
		// Else, teleport to furthest enemy on screen
		else
		{
			if (obj_spawner.most_recent_enemy.x + 100 <= room_width)
			{
				x = obj_spawner.most_recent_enemy.x + 100;
			}
			else
			{
				x = room_width - (sprite_width / 2);
			}
		}
		
		attack_counter--;
	}
					
	// End the attack
	else if (state == STATES.ATTACKING && attack_counter <= 0)
	{
		vel_x = 0;
		vel_y = 0;
		attack_counter = attack_frames;
		image_blend = make_color_hsv(255, 255, c_white);
		attack_dir = noone;
	}

	// Reset vuln counter so we are out of the attacking state
	if (state != STATES.ATTACKING)
	{
		vulnerable_counter = vulnerable_frames;
	}

//show_debug_message(attack_counter);

// Revive boon code
if (health == 0 && revives > 0)
{
	health = 1;
}



// Shield boons code
if (shield_boon)
{
	if (shield <= 0 && shield_boon)
	{
		
		if (shield_timer <= 0)
		{
			shield_timer = shield_frames;
			shield++;
		}
		else
		{
			shield_timer--;
		}
	}
}

if (projectile_shield_boon)
{
	if (projectile_shield <= 0 && projectile_shield_boon)
	{
		
		if (projectile_shield_timer <= 0)
		{
			projectile_shield_timer = projectile_shield_frames;
			projectile_shield++;
		}
		else
		{
			projectile_shield_timer--;
		}
	}
}

// Bomb boons code
if (bomb_enemies == true)
{
	bomb_enemies_counter--;
	
	if (bomb_enemies_counter == 0)
	{
		bomb_enemies_counter = bomb_enemies_frames;
	}
}

if (bomb_hazards == true)
{
	bomb_hazards_counter--;
	
	if (bomb_hazards_counter == 0)
	{
		bomb_hazards_counter = bomb_hazards_frames;
	}
}



// Game loss
if (health == 0)
{
	room_restart();
}

if (keyboard_check(vk_lshift))
{
	room_goto(rm_shrine);
}