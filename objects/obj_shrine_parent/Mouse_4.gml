/// @description Add tribute to the God. On crossing thresholds, append the appropriate boon to the player's acquired array.

if (global.player.tribute > 0)
{
	god.tribute_total++;
	god.relationship_total++;
	global.player.tribute--;
}

// Change it so that the pools of boons are randomly picked from their teir, and reset every load
if (god.tribute_total == 5)
{
	array_push(global.player.acquired_boons, god.boons[0]);
	boon_1 = true;
}
else if (god.tribute_total == 10)
{
	array_push(global.player.acquired_boons, god.boons[1]);
	boon_2 = true;
}
else if (god.tribute_total >= 15)
{
	array_push(global.player.acquired_boons, god.boons[2]);
	boon_3 = true;
}

// TODO: The script is running each frame, but we need it to run on click but for EVERY shrine object. Probably move to Left Pressed and loop through all instances and call the script?
sc_relationship_calc();