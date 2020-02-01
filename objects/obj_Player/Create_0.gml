// Inherit the parent event
event_inherited();

#macro playerX global.Player.x
#macro playerY global.Player.y

//User events
#macro RespondToControls	event_user(0)
#macro MovePlayer			event_user(1)
#macro ChangeSprite			event_user(2)
#macro PullPickups			event_user(3)
#macro RotateWeapon			event_user(4)
#macro ShootWeapon		    event_user(5)
#macro ChekPlayerHP		    event_user(6)
#macro ExecutePlayerDeath	event_user(8)

//Set shadow
var _shadowScale = 1;
SetShadowParameters(true, _shadowScale);

//Movement parameters
directionX = 0;
directionY = 0;

//Player states
enum PlayerState
{
	Spawn,
	Idle,
	Run,
	Jump,
	Dash,
	Transcendence,
	Death
}

currentState = PlayerState.Idle;
previousState = currentState;
sprite_index = spriteIdle;

// PickUp magnet paramentrs
pullDistance = 64;
pullVelocityMax = 8;
pullAcceleration = 0.25;
pickupList = ds_list_create();

// Set player weapon
var _lastIndex = array_length_1d(global.PlayerWeaponData) - 1;
weaponID = irandom_range(0, _lastIndex);
activeWeapon = instance_create_layer(x, y, layer, obj_PlayerWeapon);
SetPlayerWeapon(activeWeapon, weaponID);

// Set player weapon ammo
SetAmmoParameters(activeWeapon.ammoID, global.PlayerAmmoData);

// Wrap
spawnX = 0;
spawnY = 0;

// Scrap
global.Scrap = 0;

// Legs
var _initialLegs = PlayerPart.Legs0;
legsLevel = GetPartLevel(_initialLegs);
legsHitPoints = GetPartMaxHp(_initialLegs);
legsMaxHitPoints = GetPartMaxHp(_initialLegs);
legsRepairCost = GetPartRepairCost(_initialLegs);
legsFactor = GetPartEffectivness(_initialLegs);

// Case
var _initialCase = PlayerPart.Case0;
caseLevel = GetPartLevel(_initialCase);
caseHitPoints = GetPartMaxHp(_initialCase);
caseMaxHitPoints = GetPartMaxHp(_initialCase);
caseRepairCost = GetPartRepairCost(_initialCase);
caseFactor = GetPartEffectivness(_initialCase);

// Case
var _initialCase = PlayerPart.Weapon0;
weaponLevel = GetPartLevel(_initialCase);
weaponHitPoints = GetPartMaxHp(_initialCase);
weaponMaxHitPoints = GetPartMaxHp(_initialCase);
weaponRepairCost = GetPartRepairCost(_initialCase);
weaponFactor = GetPartEffectivness(_initialCase);

UpdateMaxHitPoints();

// Energy
maxEnergy = 100;
defaultMaxEnergy = maxEnergy;
energy = 1;
energyRestoreRate = 10;
energyRestoreFactor = 2;
energyDefaultRestoreRate = energyRestoreRate;
energyRestoreTimer = 0;

canRestore = true;
energyPenaltyTime = SetTime(4);
energyPenaltyTimer = 0;

ammoCurrent = energy;
ammoCurrentMax = maxEnergy;
ds_map_replace(global.PlayerAmmoData[activeWeapon.ammoID],"ammoCurrent",energy);
ds_map_replace(global.PlayerAmmoData[activeWeapon.ammoID],"ammoCurrentMax",maxEnergy);

// Shield
shieldIsActive = false;

// Dash
deafaultDashVelocity = dashVelocity;
dashCost = 25;
defaultDashCost = dashCost;