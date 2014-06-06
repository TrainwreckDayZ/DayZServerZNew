private ["_servicePointClasses","_maxDistance","_actionTitleFormat","_actionCostsFormat","_costsFree","_message","_messageShown","_refuel_enable","_refuel_costs","_refuel_updateInterval","_refuel_amount","_repair_enable","_repair_costs","_repair_repairTime","_rearm_enable","_rearm_costs","_rearm_magazineCount","_lastVehicle","_lastRole"];
_servicePointClasses = ["Land_A_FuelStation_Feed","Land_Ind_TankSmall","Land_Ind_TankSmall2","Land_Fuel_tank_big","Land_A_FuelStation_Build","Land_Ind_TankSmall2_EP1","Land_Fuel_tank_stairs","Land_benzina_schnell","Land_fuelstation_army","Land_Ind_TankSmall","Land_Ind_TankSmall2","land_fuelstation_w"];
_maxDistance = 30;
_actionTitleFormat = "%1 (%2)";
_actionCostsFormat = "%2 %1";
_costsFree = "free";
_refuel_enable = true;
_refuel_costs = [];
_refuel_updateInterval = 1;
_refuel_amount = 0.5;
_repair_enable = true;
_repair_costs = [];
_rearm_enable = true;
_rearm_costs = []; //"ItemBriefcase100oz",1
_rearm_magazineCount = 1;

call compile preprocessFileLineNumbers ("service_point\ac_functions.sqf");

_lastVehicle = objNull;
_lastRole = [];

s_player_refuel_action = -1;
s_player_repair_action = -1;
s_player_rearm_actions = [];

_fnc_removeActions = {
	if (isNull _lastVehicle) exitWith {};
	_lastVehicle removeAction s_player_refuel_action;
	s_player_refuel_action = -1;
	_lastVehicle removeAction s_player_repair_action;
	s_player_repair_action = -1;
	{
		_lastVehicle removeAction _x;
	} forEach s_player_rearm_actions;
	s_player_rearm_actions = [];
	_lastVehicle = objNull;
	_lastRole = [];
};

_fnc_actionTitle = {
	private ["_actionName","_costs","_costsText","_actionTitle"];
	_actionName = _this select 0;
	_costs = _this select 1;
	_costsText = _costsFree;
	if (count _costs == 2) then {
		private ["_itemName","_itemCount","_displayName"];
		_itemName = _costs select 0;
		_itemCount = _costs select 1;
		_displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
		_costsText = format [_actionCostsFormat, _displayName, _itemCount];
	};
	_actionTitle = format [_actionTitleFormat, _actionName, _costsText];
	_actionTitle
};

_fnc_isArmed = {
	private ["_role","_armed"];
	_role = _this;
	_armed = count _role > 1;
	_armed
};

_fnc_getWeapons = {
	private ["_vehicle","_role","_weapons"];
	_vehicle = _this select 0;
	_role = _this select 1;
	_weapons = [];
	if (count _role > 1) then {
		private ["_turret","_weaponsTurret"];
		_turret = _role select 1;
		_weaponsTurret = _vehicle weaponsTurret _turret;
		{
			private "_weaponName";
			_weaponName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
			_weapons set [count _weapons, [_x, _weaponName, _turret]];
		} forEach _weaponsTurret;
	};
	_weapons
};

while {1 == 1} do {
	private ["_vehicle","_inVehicle"];
	_vehicle = vehicle player;
	_inVehicle = _vehicle != player;
	if (local _vehicle && _inVehicle) then {
		private ["_pos","_objects","_inRange"];
		_pos = [_vehicle] call FNC_GetPos;
		_objects = nearestObjects [_pos, _servicePointClasses, _maxDistance];
		_inRange = count _objects > 0;
		if (_inRange) then {
			private ["_role","_actionCondition","_actionTitle"];
			_role = assignedVehicleRole player;
			if (((str _role) != (str _lastRole)) || (_vehicle != _lastVehicle)) then {
				call _fnc_removeActions;
			};
			_lastVehicle = _vehicle;
			_lastRole = _role;
			_actionCondition = "vehicle _this == _target && local _target";
			if (s_player_refuel_action < 0 && _refuel_enable) then {
				_actionTitle = ["Refuel", _refuel_costs] call _fnc_actionTitle;
				s_player_refuel_action = _vehicle addAction [_actionTitle, "service_point\service_point_refuel.sqf", [_refuel_costs, _refuel_updateInterval, _refuel_amount], -1, false, true, "", _actionCondition];
			};
			if (s_player_repair_action < 0 && _repair_enable) then {
				_actionTitle = ["Repair", _repair_costs] call _fnc_actionTitle;
				s_player_repair_action = _vehicle addAction [_actionTitle, "service_point\service_point_repair.sqf", [_repair_costs], -1, false, true, "", _actionCondition];
			};
			if ((_role call _fnc_isArmed) && (count s_player_rearm_actions == 0) && _rearm_enable) then {
				private ["_weapons"];
				_weapons = [_vehicle, _role] call _fnc_getWeapons;
				{
					private "_weaponName";
					_weaponName = _x select 1;
					_actionTitle = [format["Rearm %1", _weaponName], _rearm_costs] call _fnc_actionTitle;
					s_player_rearm_action = _vehicle addAction [_actionTitle, "service_point\service_point_rearm.sqf", [_rearm_costs, _rearm_magazineCount, _x], -1, false, true, "", _actionCondition];
					s_player_rearm_actions set [count s_player_rearm_actions, s_player_rearm_action];
				} forEach _weapons;
			};
		} else {
			call _fnc_removeActions;
		};
	} else {
		call _fnc_removeActions;
	};
	sleep 2;
};
