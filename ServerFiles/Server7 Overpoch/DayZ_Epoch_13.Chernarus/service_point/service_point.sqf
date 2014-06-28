private ["_folder","_servicePointClasses","_maxDistance","_actionTitleFormat","_actionCostsFormat","_costsFree","_message","_messageShown","_refuel_enable","_refuel_costs","_refuel_updateInterval","_refuel_amount","_repair_enable","_repair_costs","_repair_repairTime","_rearm_enable","_rearm_costs","_rearm_magazineCount","_lastVehicle","_lastRole","_fnc_removeActions","_fnc_getCosts","_fnc_actionTitle","_fnc_isArmed","_fnc_getWeapons"];
// ---------------- CONFIG START ----------------

// general settings
_folder = "service_point\"; // folder where the service point scripts are saved, relative to the mission file
_servicePointClasses = ["Land_A_FuelStation_Feed","Land_Ind_TankSmall","Land_Ind_TankSmall2","Land_Fuel_tank_big","Land_A_FuelStation_Build","Land_Ind_TankSmall2_EP1","Land_Fuel_tank_stairs","Land_benzina_schnell","Land_fuelstation_army","Land_Ind_TankSmall","Land_Ind_TankSmall2","land_fuelstation_w"]; // service point classes (add "FuelPump_DZ" to use the dynamic Epoch fuel pumps)

_maxDistance = 30; // maximum distance from a service point for the options to be shown
_actionTitleFormat = "%1 (%2)"; // text of the vehicle menu, %1 = action name (Refuel, Repair, Rearm), %2 = costs (see format below)
_actionCostsFormat = "%2 %1"; // %1 = item name, %2 = item count
_costsFree = "free"; // text for no costs

// refuel settings
_refuel_enable = true; // enable or disable the refuel option
_refuel_costs = []; // free
_refuel_updateInterval = 1; // update interval in seconds
_refuel_amount = 0.5; // amount of fuel to add with every update (in percent)

// repair settings
_repair_enable = true; // enable or disable the repair option
_repair_costs = []; // free

// rearm settings
_rearm_enable = true; // enable or disable the rearm option
_rearm_costs = []; // 1 briefcase
_rearm_magazineCount = 1; // amount of magazines to be added to the vehicle weapon

// ----------------- CONFIG END -----------------

call compile preprocessFileLineNumbers (_folder + "ac_functions.sqf");

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

while {true} do {
	private ["_vehicle","_inVehicle"];
	_vehicle = vehicle player;
	_inVehicle = _vehicle != player;
	if (local _vehicle && _inVehicle) then {
		private ["_pos","_objects","_inRange"];
		_pos = position _vehicle;
		_objects = nearestObjects [_pos, _servicePointClasses, _maxDistance];
		_inRange = count _objects > 0;
		if (_inRange) then {
			private ["_role","_actionCondition","_actionTitle"];
			_role = assignedVehicleRole player;
			if (((str _role) != (str _lastRole)) || (_vehicle != _lastVehicle)) then {
				// vehicle or seat changed
				call _fnc_removeActions;
			};
			_lastVehicle = _vehicle;
			_lastRole = _role;
			_actionCondition = "vehicle _this == _target && local _target";
			if (s_player_refuel_action < 0 && _refuel_enable) then {
				_actionTitle = ["Refuel", _refuel_costs] call _fnc_actionTitle;
				s_player_refuel_action = _vehicle addAction [_actionTitle, _folder + "service_point_refuel.sqf", [_refuel_costs, _refuel_updateInterval, _refuel_amount], -1, false, true, "", _actionCondition];
			};
			if (s_player_repair_action < 0 && _repair_enable) then {
				_actionTitle = ["Repair", _repair_costs] call _fnc_actionTitle;
				s_player_repair_action = _vehicle addAction [_actionTitle, _folder + "service_point_repair.sqf", [_repair_costs], -1, false, true, "", _actionCondition];
			};
			if ((_role call _fnc_isArmed) && (count s_player_rearm_actions == 0) && _rearm_enable) then {
				private ["_weapons"];
				_weapons = [_vehicle, _role] call _fnc_getWeapons;
				{
					private ["_weaponName","s_player_rearm_action"];
					_weaponName = _x select 1;
					_actionTitle = [format["Rearm %1", _weaponName], _rearm_costs] call _fnc_actionTitle;
					s_player_rearm_action = _vehicle addAction [_actionTitle, _folder + "service_point_rearm.sqf", [_rearm_costs, _rearm_magazineCount, _x], -1, false, true, "", _actionCondition];
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