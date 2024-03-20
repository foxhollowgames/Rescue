// Inherit the parent event
event_inherited();

global.player.has_jumped = false;

debug = false;

state = STATES.IDLE;

health = 30;
revives = 0;


//jump.frame_current = 0;
//can_rise = true;
on_floor = true;
on_r_wall = false;
on_l_wall = false;

// Set sprites for states
moving_sprite = noone;
idle_sprite = spr_dog_idle;
jump_sprite = spr_dog_idle;
fall_sprite = spr_dog_idle;
//jump_sprite = spr_jump_sprite;
//fall_sprite = spr_falling;

// Movement variables
x_boost = 0;
y_boost = 0;

moveSpd = 1;
grav_speed = .5;

// Tribute variables
gather_tribute = false;

// Dash variables
attack_speed_x = 10;
attack_speed_y = 15;
attack_frames = 30;
attack_counter = attack_frames;
attack_dir = noone;
closest_enemy = noone;
contact = false

// Jumping variables
jumpSpd = -5;
jump_x = 1;
jumpBoost = -2.5;
jumpMax = 2;
jumpCount = 0;
jumpHoldFrames = 15;
jumpTimer = 0;

jump.height = 24;
jump.speed_x = 2;
//jump.max_count = 1;
//jump.frame_max = 7;

// Boon variables
bomb_enemies = false;
bomb_enemies_frames = 1200;
bomb_enemies_counter = bomb_enemies_frames;

bomb_hazards = false;
bomb_hazards_frames = 1200;
bomb_hazards_counter = bomb_hazards_frames;

teleport_dash = false;

gravity_well = false;
gravity_well_radius = 500;
gravity_well_strength = 1.35;

dash_heal = false;
dash_counter = 0;
dash_count_trigger = 3;

shield_boon = false;
shield = 0;
shield_max = 0;
shield_frames = 450;
shield_timer = shield_frames;
shield_radius = 100;

projectile_shield_boon = false;
projectile_shield = 0;
projectile_shield_max = 0;
projectile_shield_frames = 900;
projectile_shield_timer = projectile_shield_frames;
projectile_shield_radius = 125;

extra_vulnerability = false;



// BOONS


// Transform the boons into actual effects
for (var _i = 0; _i < array_length(global.player.acquired_boons); _i++)
{

		if (global.player.acquired_boons[_i] == "Jump Height Up")
		{
			jump.height += 2;
		}
		else if (global.player.acquired_boons[_i] == "Dodge Window Up")
		{
			obj_actor_parent.vulnerable_frames += 12;
		}
		else if (global.player.acquired_boons[_i] == "Extra Jump")
		{
			jumpMax++;
		}
		else if (global.player.acquired_boons[_i] == "Jump Length")
		{
			jump.speed_x++;
		}
		else if (global.player.acquired_boons[_i] == "Heal")
		{
			revives++;
		}
		else if (global.player.acquired_boons[_i] == "Jump Boost Up")
		{
			jumpBoost += -2.5;
		}
		else if (global.player.acquired_boons[_i] == "Gather Tribute")
		{
			gather_tribute = true;
		}
		else if (global.player.acquired_boons[_i] == "More Frequent Tribute")
		{
			global.tribute_spawn_rate += 5;
		}
		else if (global.player.acquired_boons[_i] == "More Frequent Shrines")
		{
			global.checkpoint_frames -= 600;
		}
		else if (global.player.acquired_boons[_i] == "Platform Spawn Rate Up")
		{
			global.min_distance += -25;
		}
		else if (global.player.acquired_boons[_i] == "Enemy Spawn Rate Down")
		{
			global.spawn_chance--;
		}
		else if (global.player.acquired_boons[_i] == "Enemy Vulnerability Window")
		{
			extra_vulnerability = true;
		}
		else if (global.player.acquired_boons[_i] == "Jump Speed Up")
		{
			x_boost = 10;
		}
		else if (global.player.acquired_boons[_i] == "Dash Length")
		{
			attack_frames += 7;
		}
		else if (global.player.acquired_boons[_i] == "Gravity Down")
		{
			grav_speed -= .05
		}	
		else if (global.player.acquired_boons[_i] == "Extra Life")
		{
			health++;
		}
		
		// Powers
		else if (global.player.acquired_boons[_i] == "Bomb Enemies")
		{
			bomb_enemies = true;
		}
		else if (global.player.acquired_boons[_i] == "Bomb Hazards")
		{
			bomb_hazards = true;
		}
		else if (global.player.acquired_boons[_i] == "Teleport Dash")
		{
			teleport_dash = true;
		}
		else if (global.player.acquired_boons[_i] == "Gravity Well")
		{
			gravity_well = true;
			//show_debug_message(gravity_well);
		}
		else if (global.player.acquired_boons[_i] == "Every 3 Dashes, Heal")
		{
			dash_heal = true;
		}
		else if (global.player.acquired_boons[_i] == "Shield")
		{
			shield_boon = true;
			shield_max++;
			shield++;
		}
		
		// NOTE: NO projectiles exist in the game yet so functionality can't be verified
		else if (global.player.acquired_boons[_i] == "Projectile Shield")
		{
			projectile_shield_boon = true;
			projectile_shield_max++;
			projectile_shield++;
		}
		
		else if (global.player.acquired_boons[_i] == "Bouncy Platforms")
		{
			global.platform_bounce_chance += 5;
		}
		
		else if (global.player.acquired_boons[_i] == "Speed Rings")
		{
			global.speed_ring_chance += 1;
		}
		
		else if (global.player.acquired_boons[_i] == "Barrel")
		{
			global.barrel_chance += 1;
		}
		
		else if (global.player.acquired_boons[_i] == "Huge Tribute Chance")
		{
			global.huge_tribute_chance += 5;
		}
}



// Start the checkpoint timer
global.checkpoint_counter = global.checkpoint_frames;

// Set up jumping trails for easier debugging
//var _trail = part_type_create();
//part_type_color1(_trail, c_red);
//part_type_size(_trail, 1, 1, 0, 0);
//part_type_sprite(_trail, dog_sprite_v0_1, 0, 0, 1);