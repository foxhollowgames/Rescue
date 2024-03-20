/// @description Reset to the most_recent platform, lose a life, set damaged counter

//x = obj_spawner.most_recent.x;
//y = obj_spawner.most_recent.y - obj_spawner.most_recent.sprite_height/2 - sprite_height/2;

// Spawn in a static point near the left side of the screen
x = 200;
y = 300;
while (place_meeting(x, y, obj_ground))
{
	y++;
}

// Pause the game until jump
global.player.has_jumped = false;

// Give the player full jumps
//jumpCount = 0;

// Take damage
damaged_counter = damaged_frames;

health--;
