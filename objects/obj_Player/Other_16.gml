/// @description PlayerHealthPointsReader

UpdateHitPoints();

if (hitPoints <= 0)
{
	switch (currentState)
	{
		case PlayerState.Idle:
		case PlayerState.Run:
		case PlayerState.Dash:
			scaleSign = sign(drawScaleX);
			currentState = PlayerState.Transcendence;
			SwitchSprite(spriteIdle);
		break;
	}
}