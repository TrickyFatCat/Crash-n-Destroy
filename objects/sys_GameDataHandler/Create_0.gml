global.GameData = id;

StorePlayerWeaponData();
StorePlayerAmmoData();
StorePartsData();
global.PartsData[PartType.Legs] = global.LegsData;
global.PartsData[PartType.Case] = global.CaseData;
global.PartsData[PartType.Weapon] = global.WeaponData;
StoreEnemyWeaponData();
StoreWaveData();