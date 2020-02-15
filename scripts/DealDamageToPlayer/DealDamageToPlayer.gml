/// @param damage

var _damage = argument0;

if (shieldIsActive)
{
	DecreaseShieldPoints(round(_damage * shieldFactor));
	EnableFlash(c_blue, 1);
	//PlaySound(sfx_impact);
}
else if (hitPoints > 0)
{
	DealDamage(_damage);
	EnableFlash(c_red, 1);
	ApplyShakeToCamera(true, 1);
	//PlaySound(sfx_impact);
}