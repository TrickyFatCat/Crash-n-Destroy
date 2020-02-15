/// @description WeaponShootingController

if (global.TimeFactor > 0)
{	
	var _shootKey;
	
	if (activeWeapon.isAuto == true)
	{
		_shootKey = sys_GameManager.keyShootAuto;
	}
	else
	{
		_shootKey = sys_GameManager.keyShootSemiAuto;
	}
	
	if (_shootKey && ultimateState == UltimateState.Idle)
	{
		activeWeapon.isShooting = true;
	}
	else
	{
		activeWeapon.isShooting = false;
	}
	
	var _secondaryShootKey;
	
	if (secondaryWeapon.isAuto == true)
	{
		_secondaryShootKey = sys_GameManager.keySecondaryShootAuto;
	}
	else
	{
		_secondaryShootKey = sys_GameManager.keySecondaryShootSemiAuto;
	}
	
	if (_secondaryShootKey && ultimateState == UltimateState.Idle)
	{
		secondaryWeapon.isShooting = true;
	}
	else
	{
		secondaryWeapon.isShooting = false;
	}
	
	if (sys_GameManager.keyUltimateActivation && ultimatePoints == maxUltimatePoints && ultimateState == UltimateState.Idle)
	{
		isInvulnerable = true;
		SpawnExplosion(x, y + 1, obj_PlayerUltimateExplosion, 1000, 128);
		ApplyShakeToCamera(true, 3);
		ultimateState = UltimateState.Activation;
	}
}