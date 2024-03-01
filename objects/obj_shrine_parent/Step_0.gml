/// @description Calculate relationships



if (god.relationship_total <= relationship_level_vengeful)
{
	relationship_level = "Vengeful";	
}
else if (god.relationship_total <= relationship_level_jealous)
{
	relationship_level = "Jealous";
}
else if (god.relationship_total <= relationship_level_neutral)
{
	relationship_level = "Neutral";
}
else if (god.relationship_total <= relationship_level_chosen)
{
	relationship_level = "Favored";
}
else
{
	relationship_level = "Champion";
}





