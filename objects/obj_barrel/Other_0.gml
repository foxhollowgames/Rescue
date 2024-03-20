//show_debug_message(string(instance_id) + " == " + string(obj_spawner.most_recent_barrel));

if (instance_id == obj_spawner.most_recent_barrel)
{
	obj_spawner.most_recent_barrel = noone;
}

instance_destroy();