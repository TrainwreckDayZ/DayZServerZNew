//Rewritten by icomrade
private ["_magazines","_weaponName","_turretPath","_classMags","_vehicle","_args","_costs","_allInfo","_type","_name","_weaponNames","_classWeapons"];

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_rearm.sqf with non-local vehicle: %1", _vehicle] };
_args = _this select 3;
_costs = _args select 0;
_allInfo = _args select 1;

if !([_costs] call player_checkAndRemoveItems) exitWith {};
_type = typeOf _vehicle;
_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_weaponNames = [];
if (((count (assignedVehicleRole player)) > 1) && {(count _allInfo) > 0}) then {
	{
		_weaponName = _x select 0;
		_magazines = _x select 1;
		_turretPath = _x select 2;
		{
			_vehicle removeMagazineTurret [_x, _turretPath];
			_vehicle addMagazineTurret [_x, _turretPath];
		} forEach _magazines;
		_weaponNames set [(count _weaponNames), _weaponName];
	} forEach _allInfo;
};
_classWeapons = getArray(configFile >> "cfgVehicles" >> _type >> "weapons");
if (count _classWeapons > 0) then {
	_classMags = [_vehicle, true] call GetDZEMagazines;
	_classMags = getArray(configFile >> "cfgVehicles" >> _classMags >> "magazines");
	{
		_vehicle removeMagazineTurret [_x, [-1]];
		_vehicle addMagazineTurret [_x, [-1]];
		_weaponNames set [(count _weaponNames), (_classWeapons select _forEachIndex)];
	} forEach _classMags;
};
titleText [format["%1 of %2 Rearmed", _weaponNames, _name], "PLAIN DOWN"];
