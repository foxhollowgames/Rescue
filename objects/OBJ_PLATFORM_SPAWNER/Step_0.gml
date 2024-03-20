/// @description Insert description here
// You can write your code in this editor

var PLATFORM_COUNT = instance_number(OBJ_MOVING_PLATFORM_1)

if (instance_exists(OBJ_PLATFROM_TEST_PLAYER) && PLATFORM_COUNT < 100)
{
	//if PLATFORM_COUNT > 8
	//{exit;}
	var PLATFORM_MAKE = OBJ_MOVING_PLATFORM_1;
	
	
	var nex_x = random_range(220, room_width - 220);
	while point_distance(nex_x, 01, OBJ_PLATFROM_TEST_PLAYER.x,0) < 200
	{
		nex_x = random_range(220, room_width - 220);
	}
	repeat(random_range(20,50))
	{
	instance_create_layer(room_width + 2,y,"PLATFORM_LAYER", OBJ_MOVING_PLATFORM_1)
	}
}










