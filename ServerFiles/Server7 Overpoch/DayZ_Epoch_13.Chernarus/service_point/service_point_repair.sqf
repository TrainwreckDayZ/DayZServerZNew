// Vehicle Service Point (Repair) by Axe Cop
// Modified for TrainwreckDayZ by eraser1

private ["_vehicle","_args","_costs","_type","_name","_hitpoints"];

if (dayz_combat == 1) then {
	titleText ["You can't repair your vehicle while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_repair.sqf with non-local vehicle: %1", _vehicle] };

_args = _this select 3;
_costs = _args select 0;

if !([_costs] call player_checkAndRemoveItems) exitWith {};

_type = typeOf _vehicle;
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");

_vehicle engineOn false;
[_vehicle,"repair",0,false] call dayz_zombieSpeak;

_hitpoints = _vehicle call vehicle_getHitpoints;
{
	private ["_damage","_selection"];
	_damage = [_vehicle,_x] call object_getHit;
	if (_damage > 0) then {
		_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
		[_vehicle,_selection,0] call object_setFixServer;
	};
} count _hitpoints;

_vehicle setDamage 0;
_vehicle setVelocity [0,0,1];

titleText [format["%1 Repaired", _name], "PLAIN DOWN"];
};