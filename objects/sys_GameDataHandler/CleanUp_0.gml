ClearNestedData(global.PlayerWeaponData);
ClearNestedData(global.PlayerAmmoData);
ClearNestedData(global.EnemyWeaponData);
ClearNestedData(global.PerksData);
ClearNestedData(global.EnemyData);
ds_list_destroy(global.ChosenPerks);
ds_list_destroy(global.ActivePerks);
ClearWaveData();
ds_map_destroy(global.EnemyCountData);