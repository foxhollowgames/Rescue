/// @description Move in sync with the scroll speed
if (!global.player.has_jumped)
{
	exit;
}

speed_rate = (global.scroll_speed / 4) / 60;

x -= speed_rate;
//show_debug_message(x);
//progress / distance between checkpoint * scroll bar dist + left bbox