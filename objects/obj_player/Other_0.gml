/// @description Reset to the most_recent platform, lose a life, set damaged counter

x = obj_spawner.most_recent.x;
y = obj_spawner.most_recent.y - obj_spawner.most_recent.sprite_height/2 - sprite_height/2;

damaged_counter = damaged_frames;

health--;
