// Parameters
enum PlayerAmmo
{
	Weapon
}

#macro TestAmmo global.PlayerAmmoData[PlayerAmmo.Weapon]

// Ammo Data
global.PlayerAmmoData[PlayerAmmo.Weapon] = ds_map_create();
ds_map_add(TestAmmo, "ammoCurrent",	200);
ds_map_add(TestAmmo, "ammoCurrentMax",	200);