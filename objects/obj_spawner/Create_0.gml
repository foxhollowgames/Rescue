// Set spawning bool flag
can_spawn = true;

tribute_spawned = false;

platform_frames_1 = 60;
platform_counter_1 = platform_frames_1;
platform_frames_2 = platform_frames_1 * 1.75;
platform_counter_2 = platform_frames_2;
platform_frames_3 = platform_frames_1 * 2.4;
platform_counter_3 = platform_frames_3;
platform_frames_4 = platform_frames_1 * 3.2;
platform_counter_4 = platform_frames_4;

spawn_frequency = 4;


#region // ARCHIVE: Set up rows

//row_1	=768;
////row_2	=736;
//row_3	=704;
////row_4	=672;
//row_5	=640;
////row_6	=608;
//row_7	=576;
////row_8	=544;
//row_9	=512;
////row_10	=480;
//row_11	=448;
////row_12	=416;
//row_13	=384;
////row_14	=352;
////row_15	=320;
////row_16	=288;
////row_17	=256;
////row_18	=224;
////row_19	=192;
////row_20	=160;
////row_21	=128;
////row_22	=96;
////row_23	=64;
////row_24	=32;
#endregion


top_third = [250, 493];
top_chance = 33;
middle_third = [494, room_height - 344];
middle_chance = 66;
bottom_third = [room_height - 343, room_height - 100];
bottom_chance = 100;

spawn_y = noone;

most_recent = noone;
most_recent_enemy = noone;

// Speed Ring variables
most_recent_ring = noone;

// Barrel variables
most_recent_barrel = noone;
barrel_spawn_frames = 2000;
barrel_spawn_counter = barrel_spawn_frames;

// Enemy spawn variables
random_spawn_number = irandom(100);
random_frames = 10;
random_counter = random_frames;
spawn_enabled = true;

// Scaler variables
tribute_scaler = 4;
enemy_scaler = 3;
platform_scaler = 40;

//instance_create_layer(obj_player.x, obj_player.y + 700,"platform_layer", obj_ground);