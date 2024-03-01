// Set up rows

//row_1	=768;
//row_2	=736;
//row_3	=704;
//row_4	=672;
row_5	=640;
//row_6	=608;
row_7	=576;
//row_8	=544;
row_9	=512;
//row_10	=480;
row_11	=448;
//row_12	=416;
row_13	=384;
//row_14	=352;
row_15	=320;
//row_16	=288;
row_17	=256;
//row_18	=224;
row_19	=192;
//row_20	=160;
//row_21	=128;
//row_22	=96;
//row_23	=64;
//row_24	=32;

top_third = [row_5, row_7];
top_chance = 33;
middle_third = [row_9, row_11, row_13, row_15];
middle_chance = 66;
bottom_third = [row_17, row_19];
bottom_chance = 100;

spawn_y = noone;

most_recent = instance_create_layer(0, 0, "platform_layer", obj_ground);
most_recent_enemy = instance_create_layer(700, 200, "Instances", obj_enemy);

// Speed Ring variables
most_recent_ring = noone;

// Barrel variables


// Enemy spawn variables
random_spawn_number = irandom(100);
random_frames = 10;
random_counter = random_frames;
spawn_enabled = true;

//instance_create_layer(obj_player.x, obj_player.y + 700,"platform_layer", obj_ground);