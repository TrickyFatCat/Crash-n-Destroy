/// @description PlayerControlsOverseer

switch global.CurrentInput
{
	case InputMethod.Gamepad:
		var _gamepadButton = gp_shoulderrb;
		keyShootAuto = CheckGamepadButton(_gamepadButton);
		keyShootSemiAuto = CheckGamepadButtonPressed(_gamepadButton);
		keyInteract = CheckGamepadButtonPressed(gp_face1);
		keyShield = CheckGamepadButton(gp_shoulderlb);
		keyDash = CheckGamepadButton(gp_face1);
	break;
	
	case InputMethod.KeyboardMouse:
		var _mouseButton = mb_left;
		
		keyMoveUp = CheckKeyboardOrd("W");
		keyMoveLeft = CheckKeyboardOrd("A");
		keyMoveDown = CheckKeyboardOrd("S");
		keyMoveRight = CheckKeyboardOrd("D");
		keyShootAuto = mouse_check_button(_mouseButton);
		keyShootSemiAuto = mouse_check_button_pressed(_mouseButton);
		keyInteract = CheckKeyboardOrd("E");
		keyShield = mouse_check_button(mb_right);
		keyDash = keyboard_check_pressed(vk_space);
	break;
}