private ["_cTarget","_isOk","_display"];
disableSerialization;
_isOk = false;
_display = (_this select 0);
_cTarget = cursorTarget;
if((vehicle player) != player) then {
	_cTarget = (vehicle player);
};
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} forEach ["LandVehicle","Air", "Ship"];

if((locked _cTarget) and _isOk and (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};
//safezone
if(!canbuild && (isPlayer cursorTarget)) then {
	if((alive cursorTarget) && ((vehicle cursorTarget) == cursorTarget)) then {
		_friendlies = player getVariable ["friendlyTo",[]];
		_ownerID = cursorTarget getVariable ["CharacterID", "0"];
		_friend = _ownerID in _friendlies;
		if(!_friend) then {
			cutText["\n\nBackpack access is restricted in trader areas except with those tagged as friendly", "PLAIN DOWN",0];
			_display closeDisplay 1;
		};
	};
};
