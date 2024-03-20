/// @description Pick a god to represent out of the pool and establish relationship thresholds

shuffled_pantheon = array_shuffle(global.pantheon);
god = array_pop(shuffled_pantheon);
global.pantheon = shuffled_pantheon;

god.tribute_spent = 0;

relationship_level_vengeful = -10;
relationship_level_jealous = -5;
relationship_level_neutral = 0;
relationship_level_chosen = 5;
relationship_level_champion = 10;

relationship_level = noone;

common_shuffled = array_shuffle(god.boons_common);
rare_shuffled = array_shuffle(god.boons_rare);
epic_shuffled = array_shuffle(god.boons_epic);
boon_1 = common_shuffled[0];
boon_2 = rare_shuffled[0];
boon_3 = epic_shuffled[0];
boon_1_acquired = false;
boon_2_acquired = false
boon_3_acquired = false;

hover = false;