/// @param perkId

var _perkId = argument0;

var _weaponId = PlayerWeapon.Icicles;

switch (_perkId)
{
	case Perk.IciclesBullets:
		IncreaseBullets(_perkId, _weaponId);
	break;
	
	case Perk.IciclesMaxAmmo:
		IncreaseMaxAmmo(_perkId, _weaponId);
	break;
	
	case Perk.IciclesRecoveryRate:
		IncreaseRecoveryRate(_perkId, _weaponId);
	break;
}