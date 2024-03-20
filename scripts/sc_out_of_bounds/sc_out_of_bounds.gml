// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_out_of_bounds() 
{
if (x < 0 - sprite_width || y < 0 - sprite_height || y > room_height + sprite_height)
{
	instance_destroy();
}

}