// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_ground_pound(){
	global.scroll_speed = 0;
	vel_y = 30;
	
	var _fx_tint = fx_create("_filter_tintfilter");
	layer_set_fx("Instances", _fx_tint);
}