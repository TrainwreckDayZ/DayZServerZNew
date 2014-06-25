private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};
// IN SAFE ZONE
if( !canbuild ) then
{
	if( isPlayer cursorTarget and alive cursorTarget and vehicle cursorTarget == cursorTarget ) then
	{
		_friendlies = player getVariable ["friendlyTo",[]];
		_ownerID = cursorTarget getVariable ["CharacterID", "0"];

		_friend = _ownerID in _friendlies;

		// check if friendly to owner
		if( !_friend ) then {
			cutText["\n\nBackpack access is restricted in trader areas except with those tagged as friendly", "PLAIN DOWN",0];
			_display closeDisplay 1;
		};
	};
};
