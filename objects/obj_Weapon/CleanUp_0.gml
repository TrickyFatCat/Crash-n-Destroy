// Inherit the parent event
event_inherited();

if (laserObjects != noone)
{
	ds_list_destroy(laserObjects);
}

if (hitscanObjects != noone)
{
	ds_list_destroy(hitscanObjects);
}