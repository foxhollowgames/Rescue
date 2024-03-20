function sc_resume_scroll(){
	global.scroll_speed =  abs(global.scroll_rate) * -1;
	obj_spawner.can_spawn = true;
}