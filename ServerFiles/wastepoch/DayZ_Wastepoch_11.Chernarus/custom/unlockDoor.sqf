disableSerialization;
if ((!isNull dayz_selectedDoor) && (isNil "KeyCodeTry")) then {
	_obj = dayz_selectedDoor;
	_objectCharacterID 	= _obj getVariable ["CharacterID","0"];
	if (DZE_Lock_Door == _objectCharacterID) then {
		[player,"combo_unlock",0,false] call dayz_zombieSpeak;
		_display = findDisplay 41144;
		_display closeDisplay 3000;
		if(_obj animationPhase "Open_hinge" == 0) then {
			_obj animate ["Open_hinge", 1];
		};
		if(_obj animationPhase "Open_latch" == 0) then {
			_obj animate ["Open_latch", 1];
		};
	} else {
		DZE_Lock_Door = "";
		[player,"combo_locked",0,false] call dayz_zombieSpeak;
		[player,20,true,(getPosATL player)] spawn player_alertZombies;
		r_player_timeout = 1;
		r_player_unconscious = true;
		player setVariable["medForceUpdate",true,true];
		_display = findDisplay 41144;
		_display closeDisplay 3000;
		cutText ["WRONG CODE ENTERED - WAIT 45 SECONDS", "PLAIN DOWN"];
		KeyCodeTry = true;
		[] spawn {sleep 45; KeyCodeTry = nil;};
		[] spawn {disableSerialization; while {!isNil "KeyCodeTry"} do { _display = findDisplay 41144; _display closeDisplay 3000; sleep 0.001;};};
	};
} else {
	_display = findDisplay 41144;
	_display closeDisplay 3000;
};