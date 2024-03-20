draw_self();


// Visualize jumps left
for (var _i = 0; _i < jumpMax; _i++)
{
	draw_set_halign(fa_right);
	if (_i < jumpCount)
	{
		draw_sprite_ext(spr_arrow, 0, bbox_left - 25, bbox_top + (25 * _i), .3, .3, 90, c_blue, .3);
	}
	else
	{
		draw_sprite_ext(spr_arrow, 0, bbox_left - 25, bbox_top + (25 * _i), .3, .3, 90, c_blue, 1);	
	}
	
	if (_i + 1 = jumpMax)
	{
		if (jumpCount > jumpMax)
		{
			draw_sprite_ext(spr_arrow, 0, bbox_left - 25, bbox_top + (25 * _i), .3, .3, 270, c_red, .3);
		}
		else
		{
			draw_sprite_ext(spr_arrow, 0, bbox_left - 25, bbox_top + (25 * _i), .3, .3, 270, c_red, 1);
		}
	}
	//for (var _j = 0; _j < jumpMax; _j++)
	//{
	//	draw_sprite(bbox_left - 25, bbox_top + (25 * _i), _j);
	//}
	
	//for (var _j = 0; _j < jumpMax; _j++)
	//{
		//draw_sprite_ext(spr_arrow, 0, bbox_left - 25, bbox_top + (25 * _i), .3, .3, 90, c_blue, 1);
	//}

	draw_set_halign(fa_left);
	draw_set_alpha(1);
}

// Gravity well visualization
if (gravity_well)
{
	draw_set_color(c_purple);
	draw_set_alpha(0.3);
	draw_circle(x, y, gravity_well_radius, false);
	draw_set_color(c_black);
	draw_set_alpha(1);
}

// Shield visualizations
if (shield_boon && shield >= 1)
{
	draw_set_alpha(0.3);
	switch(shield_max)
	{
		// TODO: Future proof this. Either dynamically adjust color mathematically or make iterations for each possible step
		case 1:
			draw_set_color(c_blue);
			break;
		case 2:
			draw_set_color(c_aqua);
			break;
		case 3:
			draw_set_color(c_olive);
			break;
		case 4:
			draw_set_color(c_maroon);
			break;
	}
	draw_circle(x, y, shield_radius, false);
	draw_set_color(c_black);
	draw_set_alpha(1);
}

if (projectile_shield_boon && projectile_shield >= 1)
{
	draw_set_color(c_teal);
	draw_set_alpha(0.3);
	draw_circle(x, y, projectile_shield_radius, false);
	draw_set_color(c_black);
	draw_set_alpha(1);
}

if (!global.debug)
{
	exit;
}

draw_set_color(c_black);


var _state = 0;
if (state == STATES.IDLE)
{
	_state = "IDLE";
}
else if (state == STATES.ATTACKING)
{
	_state = "ATTACKING";
}
else if (state == STATES.DAMAGED)
{
	_state = "DAMAGED";
}
else if (state == STATES.DEATH)
{
	_state = "DEATH";
}
else if (state == STATES.FALLING)
{
	_state = "FALLING";
}
else if (state == STATES.JUMPING)
{
	_state = "JUMPING";
}
else if (state == STATES.VULNERABLE)
{
	_state = "VULNERABLE";
}
else if (state == STATES.MOVING)
{
	_state = "MOVING";
}

draw_text(x, y-50, _state);

//draw_text(x, y - 100, "Vel_y: " + string(vel_y));
//draw_text(x, y - 125, "Vel_x: " + string(vel_x));

draw_text(x, y - 75, "Tribute: " + string(global.player.tribute));

draw_text(x, y - 100, projectile_shield);

//draw_text(x, y - 100, "on_floor: " + string(on_floor));
//draw_text(x, y - 125, "on_r_wall: " + string(on_r_wall));
//draw_text(x, y - 150, "on_l_wall: " + string(on_l_wall));
//draw_text(x, y + 150, "jumpKeyPressed: " + string(jumpKeyPressed));
//draw_text(x, y + 175, "jumpCount: " + string(jumpCount));

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom, true);

if (instance_exists(closest_enemy))
{
	draw_line(x, y, closest_enemy.x, closest_enemy.y);
}