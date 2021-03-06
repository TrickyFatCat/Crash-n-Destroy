/// @description BattleStateSwitcher

switch (global.BattleState)
{
	case BattleState.Inactive:
	break;
			
	case BattleState.Start:
		battleStartTimer += global.TimeFactor;
		soundTimer += global.TimeFactor;
		battlePauseTimer = 0;
		
		var _soundTime = SetTime(1);
		var _checkStartTimer = CheckTimer(battleStartTimer, battleStartTime);
		var _playSound = CheckTimer(soundTimer, _soundTime)
	
		if (_playSound)
		{
			PlaySound(sfx_timer);
			soundTimer = 0;
		}
				
		if (_checkStartTimer)
		{
			battleStartTimer = 0;
			global.BattleState = BattleState.Active;
			randomPerk = noone;
			obj_SpawnController.isActive = true;
			ActivateTiles;
			PlaySound(sfx_start);
		}
	break;
			
	case BattleState.Active:
		if (!audio_is_playing(global.Music)) && !audio_is_playing(sfx_start) && global.Player.currentState < PlayerState.Transcendence
		{
			global.Music = choose(bgm_battleground, bgm_lightsOut, bgm_likeTotallyRad);
			audio_sound_gain(global.Music, 0, 0);
			audio_play_sound(global.Music, 1000, false);
			audio_sound_gain(global.Music, 0.5, 1500);
		}
		
		global.PlayTime += global.TimeFactor;
		var _waveTimeIsOver = CheckTimer(global.PlayTime, roundTime);
		
		if (_waveTimeIsOver)
		{
			obj_SpawnController.isActive = false;
			global.BattleState = BattleState.RoundEnd;
			global.PlayTime = 0;
			DectivateActiveTiles;
			instance_activate_object(destructionTile);
			destructionTile.currentState = TileState.Activation;
		}
	break;
	
	case BattleState.RoundEnd:
		if (global.TotalEnemies == 0)
		{
			global.BattleState = BattleState.Intermission;
			SetActivePerks();
			ActivateInteractiveObjects();
		}
	break;
	
	case BattleState.Intermission:
		battlePauseTimer += global.TimeFactor;
		var _timeIsOver = CheckTimer(battlePauseTimer, battlePauseTime);
		
		with (global.Player)
		{
			IncreaseHitPoints(1);
			IncreaseShieldPoints(1);
			for (var i = 0; i < ammoArrayLength; i++)
			{
				var _ammo = GetCurrentAmmo(i);
				var _maxAmmo = GetMaxAmmo(i);
	
				if (_ammo < _maxAmmo)
				{
					if (i == mainWeapon.ammoID)
					{
						ammo = RecoverAmmo(i);
					}
					else
					{
						RecoverAmmo(i);
					}
				}
			}
		}
			
		if (_timeIsOver)
		{
			global.BattleState = BattleState.Start;
			randomPerk = ActivateRandomPerk();
			DeactivateInteractiveObjects();
			CalculateDifficulty();
		}
	break;
			
	case BattleState.End:
		//if (!audio_is_playing(bgm_defeat))
		//{
		//	audio_play_sound(bgm_defeat, 0, false);
		//}
		//global.Round = 1;
		permanentTilesEnabled = false;
		temporaryTilesEnabled = false;
		gui_Base.currentState = InterfaceState.TransitionOut;
		global.BattleState = BattleState.Inactive;
	break;
}