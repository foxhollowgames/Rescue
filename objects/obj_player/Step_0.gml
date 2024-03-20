// Inherit the parent event
event_inherited();

jumpKeyPressed = keyboard_check_pressed(vk_space);
jumpKeyHold = keyboard_check(vk_space);

///////// STATE MACHINE

// Check for states, then set appropriate sprite and run relevant script
switch (state)
{
	case STATES.IDLE:
		if (vel_y < 0)
		{
			state = STATES.JUMPING;
		}
		
		if (obj_player && vel_y > 0)
		{
			state = STATES.FALLING;
		}
		
		if (vulnerable_counter < vulnerable_frames && vulnerable_counter != 0)
		{
			state = STATES.VULNERABLE;
		}
		
		if (damaged_counter < damaged_frames && damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		break;
			
	case STATES.JUMPING:
		if (obj_player && vel_y >= 0)
		{
			state = STATES.FALLING;
		}
		
		if (damaged_counter < damaged_frames && damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		
		break;
		
	case STATES.FALLING:
		if (on_floor)
		{
			state = STATES.IDLE;
		}
		
		if (vel_y < 0)
		{
			state = STATES.JUMPING;
		}
		
		if (damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		
		break;
			
			
	case STATES.DAMAGED:
		// Run an animation, then reset state to idle
		if (damaged_counter <= 0)
		{
			if (on_floor)
			{
				state = STATES.IDLE;
			}
			
			else if (vel_y > 0)
			{
				state = STATES.JUMPING;
			}
			
			else
			{
				state = STATES.FALLING;
			}
		}
		
		break;
		
	case STATES.VULNERABLE:
		if (vulnerable_counter <= 0)
		{
			state = STATES.ATTACKING;
		}
		if (damaged_counter > 0)
		{
			state = STATES.DAMAGED;
		}
		
	case STATES.ATTACKING:
		if (on_floor)
		{
			state = STATES.IDLE;
		}
		else if (obj_player && attack_counter <= 0)
		{
			state = STATES.FALLING;
		}
			
	case STATES.DEATH:
		// Run the animation, then destroy
		break;
			
	case STATES.MOVING:
		// Check if attacking, then move state
		break;	
}


///////// Jumping code

	if (on_floor) {
		vel_y = 0;
		global.player.has_jumped = true;
	}

	// Reset the jump if you are idle
	if (state == STATES.IDLE || on_floor)
	{
		jumpCount = 0;
		vel_x = global.scroll_speed;
		//vel_y = 0;
	}
	// If you fall off of a platform somehow, use up a jump
	//else
	//{
	//	if (jumpCount == 0)
	//	{
	//		jumpCount = 1;
	//	}
	//}

	// Start the jump to move into the jump state
	if ((jumpKeyPressed) && state == STATES.IDLE)
	{
		vel_y = 0;
		vel_y = jumpBoost;

	}

	// Air jumping
	// TODO: Understand state machines....
	if (jumpKeyPressed && jumpCount < jumpMax) 
	{
		if (instance_exists(obj_barrel))
		{
			if (obj_barrel.active)
			{	
				if (jumpKeyPressed)
				{
					obj_barrel.shot = true;
					sc_resume_scroll();
					obj_barrel.arrow_angle = obj_arrow.image_angle;
					instance_destroy(obj_barrel.arrow);
					obj_player.image_alpha = 1;
					obj_barrel.active = false;
				}
				
				//show_debug_message("In barrel!");
				
				exit;
			}
		}
		vel_y = 0;
			
		if (instance_place(x, bbox_bottom +1, obj_collision))
		{
			if (instance_place(x, bbox_bottom +1, obj_collision).bouncy)
			{
				vel_y += jumpBoost;
			}
		}
		
		// Increment your number of performed jumps
		jumpCount++;

		audio_play_sound(jump_1, 2, false);
		
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
	if (jumpKeyHold && jumpTimer > 0)
	{
		// Constantly set the vel_y to be the jumpSpd
		vel_y = jumpSpd;
					
		if (instance_place(x, bbox_bottom +1, obj_collision))
		{
			if (instance_place(x, bbox_bottom +1, obj_collision).bouncy)
			{
				vel_y += jumpBoost;
			}
		}
		
	
		vel_x = jump_x + x_boost;
	
		// Decrement the timer
		jumpTimer--;
	}	

	else if (jumpKeyPressed && jumpCount >= jumpMax)
	{
		sc_ground_pound();
	}

	
	// Check if the player has hit ground after groundpounding and reset scroll speed	
	if (place_meeting(x, bbox_bottom + 1, obj_collision))
	{
		sc_clear_time_stop();
	}
	

////////// Attacking code


	// Check for and enter our attacking state
	if (instance_exists(obj_enemy_parent))
	{
		closest_enemy = instance_nearest(x, y, obj_enemy_parent);
		//if (distance_to_object(closest_enemy) < closest_enemy.attack_radius && closest_enemy.state == STATES.VULNERABLE && closest_enemy.x > x)
		if (closest_enemy.state == STATES.VULNERABLE)
		{
			image_blend = make_color_hsv(130, 255, 255);
			if (jumpKeyPressed && attack_counter > 0)
			{
				state = STATES.ATTACKING;
				dash_counter++;
				if (dash_heal && dash_counter == dash_count_trigger)
				{
					health++;
					dash_counter = 0;
				}
			}
		}
		
		else
		{
			image_blend = c_white;
		}
	}
	
	// Dash in the direction of the closest enemy
	if (state == STATES.ATTACKING && attack_counter > 0)
	{
		image_blend = c_white;
		
		if (attack_dir == noone)
		{
			attack_dir = point_direction(x, y, closest_enemy.x, closest_enemy.y);
		}

		vulnerable_counter = 0;
		
		// If not teleport dash, set velocity
		// TODO: gotta find how to speed up the early dash!
		if (!teleport_dash && !contact)
		{
			vel_x = lengthdir_x(attack_speed_x, attack_dir) * 4;
			vel_y = lengthdir_y(attack_speed_y, attack_dir) * 4;
			if (place_meeting(x, y, obj_enemy_parent))
			{
				contact = true;
			}
		}
		else if (!teleport_dash && contact)
		{
			vel_x = lengthdir_x(attack_speed_x, attack_dir) + x_boost;
			vel_y = lengthdir_y(attack_speed_y, attack_dir);
			instance_destroy(closest_enemy);

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
		
		if (instance_exists(obj_barrel))
		{
			if (!obj_barrel.active)
			{
				attack_counter--;
			}
		}
		else
		{
			attack_counter--;
		}
	}
					
	// End the attack
	else if (attack_counter <= 0)
	{
		vel_x = jump_x;
		vel_y = grav_speed;
		image_blend = c_white;
		attack_dir = noone;
		contact = false;
		attack_counter = attack_frames;
		//jumpCount = 0;
	}

	// Reset vuln counter so we are out of the attacking state
	if (state != STATES.ATTACKING)
	{
		vulnerable_counter = vulnerable_frames;
		attack_counter = attack_frames;
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
	if (shield < shield_max && shield_boon)
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
	
	//show_debug_message(bomb_enemies_counter);
	
	if (bomb_enemies_counter <= 0)
	{		
		sc_bomb_enemies();
		bomb_enemies_counter = bomb_enemies_frames;
	}
}

if (bomb_hazards == true)
{
	bomb_hazards_counter--;
	
	if (bomb_hazards_counter == 0)
	{
		sc_bomb_hazards();
		bomb_hazards_counter = bomb_hazards_frames;
	}
}



// Game loss
if (health == 0)
{
	room_goto(rm_main_menu);
}

if (keyboard_check(vk_lshift))
{
	room_goto(rm_shrine);
}


// Get out of platforms if stuck
if (place_meeting(x, y, obj_collision))
{
	y--;
}

// PAUSE
if (keyboard_check_pressed(vk_escape))
{
	global.paused = !global.paused;
	
}

if (global.paused)
{
	sc_pause_open();
}
else
{
	sc_pause_closed();
}

// CHECK FOR SCROLL BOSSTS
if (x >= room_width / 3)
{
	global.scroll_speed =  abs(global.scroll_rate) * -1 - 2;
	obj_player_progress.boost = 3;
}
else if (x >= room_width / 2.5)
{
	global.scroll_speed--;
	obj_player_progress.boost = 2;
}
else 
{
	global.scroll_speed =  abs(global.scroll_rate) * -1;
	obj_player_progress.boost = 1;
}

// DEBUG FLAG
if (keyboard_check_pressed(vk_down))
{
	global.debug = !global.debug;
}