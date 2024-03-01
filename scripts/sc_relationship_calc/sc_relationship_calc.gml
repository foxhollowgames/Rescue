function sc_relationship_calc(){
	// Recaulculate relationships
	for (var _i = 0; _i < array_length(global.pantheon); _i++)
	{
		switch (global.pantheon[_i])
		{
			case global.GOD1:
				global.pantheon[_i].relationship_total = god.relationship[3] * global.GOD2.tribute_total;
				global.pantheon[_i].relationship_total += god.relationship[5] * global.GOD3.tribute_total;
				global.pantheon[_i].relationship_total += global.pantheon[_i].tribute_total;
				break;
	
			case global.GOD2:
				global.pantheon[_i].relationship_total = god.relationship[0] * global.GOD1.tribute_total;
				global.pantheon[_i].relationship_total += god.relationship[5] * global.GOD3.tribute_total;
				global.pantheon[_i].relationship_total += global.pantheon[_i].tribute_total;
				break;
		
			case global.GOD3:
				global.pantheon[_i].relationship_total = god.relationship[0] * global.GOD1.tribute_total;
				global.pantheon[_i].relationship_total += god.relationship[3] * global.GOD2.tribute_total;
				global.pantheon[_i].relationship_total += global.pantheon[_i].tribute_total;
				break;
		}
	}
}