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
_rearm_costs = ["ItemBriefcase100oz",1];
_rearm_magazineCount = 1;

funcGetTurretsWeapons = {
	//By denvdmj (probably, I found it on the biki)
	private ["_result", "_getAnyMagazines", "_findRecurse", "_class"];
	_result = [];
	_getAnyMagazines = {
	    private ["_class","_weapon", "_mags"];
		_weapon = configFile >> "CfgWeapons" >> (_this select 0);
		_class = _this select 1;
		_thing = _this select 2;
		_mags = getArray(_class >> "magazines");
		_mags
	};
	_findRecurse = {
	    private ["_root", "_class", "_path", "_currentPath", "_thisThis"];
	    _root = (_this select 0);
	    _path = +(_this select 1);
		_thisThis = _this select 2;
	    for "_i" from 0 to count _root -1 do {
		   _class = _root select _i;
		   if (isClass _class) then {
			  _currentPath = _path + [_i];
			  {
				 _result set [count _result, [_x, [_x, _class, _thisThis] call _getAnyMagazines, _currentPath]];
			  } count getArray (_class >> "weapons");
			  _class = _class >> "turrets";
			  if (isClass _class) then {
				 [_class, _currentPath, _thisThis] call _findRecurse;
			  };
		   };
	    };
	};
	_class = (
	    configFile >> "CfgVehicles" >> (
		   switch (typeName _this) do {
			  case "STRING" : {_this};
			  case "OBJECT" : {typeOf _this};
			  default {nil}
		   }
	    ) >> "turrets"
	);
	[_class, [], _this] call _findRecurse;
	//if (_this isKindOf "pook_H13_gunship") then {_result = [["pook_M60_dual",["pook_1300Rnd_762x51_M60"], [-1], ""],["pook_H13Grenades", ["pook_12Rnd_Grenade_Camel"], [-1], ""]]};
	_result
};
GetDZEMagazines = { //By icomrade
	private ["_classMags","_toArray","_NormalizedName","_count","_uA","_isDZE","_type"];
	_type = typeOf (_this select 0);
	_NormalizedName = _type;
	_toArray = toArray(_type);
	_count = count _toArray;
	_uA = [["69","101"],["90","122"],["68","100"]];
	_isDZE = (((str(_toArray select (_count - 1))) in (_uA select 0)) && {(str(_toArray select (_count - 2))) in (_uA select 1)} && {(str(_toArray select (_count - 3))) in (_uA select 2)});
	if (_isDZE) then {
		_toArray set [(_count - 1), -1];
		_toArray = _toArray - [-1];
		if (isClass (configFile >> "CfgVehicles" >> (toString(_toArray)))) then {
			_NormalizedName = toString(_toArray);
		};
	};
	_classMags = _NormalizedName call funcGetTurretsWeapons;
	if (_this select 1) then {_classMags = _NormalizedName;};
	_classMags
};

_lastVehicle = objNull;
_lastRole = [];

s_player_refuel_action = -1;
s_player_repair_action = -1;
s_player_rearm_action = -1;
_testMyReturn = {
	_result = _this;
	{
		if (_x in ["CarHorn","MiniCarHorn","SportCarHorn","BikeHorn","TruckHorn","TruckHorn2"]) then {
			_result set [_forEachIndex, -1];
			_result = _result - [-1];
		};
	} forEach _result;
	_result
};
_fnc_removeActions = {
	if (!isNull _lastVehicle) then {
		_lastVehicle removeAction s_player_refuel_action;
		s_player_refuel_action = -1;
		_lastVehicle removeAction s_player_repair_action;
		s_player_repair_action = -1;
		_lastVehicle removeAction s_player_rearm_action;
		s_player_rearm_action = -1;
		_lastVehicle = objNull;
		_lastRole = [];
	};
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
			if ((((count _role) > 1) || ((driver _vehicle) == player)) && _rearm_enable && s_player_rearm_action < 0) then {
				_allInfo = [_vehicle, false] call GetDZEMagazines;
				if ((count _allInfo > 0) || ((driver _vehicle) == player)) then {
					if ((driver _vehicle) == player) then {
						_vehWep = getArray(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "weapons");
						_testReturn = _vehWep call _testMyReturn;
							if ((Count _testReturn) > 0) then {
								s_player_rearm_action = _vehicle addAction [format["Rearm %1 (free)", (typeOf _vehicle)], "service_point\service_point_rearm.sqf", [_rearm_costs, _allInfo], -1, false, true, "", _actionCondition];
							};
						} else {
						s_player_rearm_action = _vehicle addAction [format["Rearm %1 (free)", (typeOf _vehicle)], "service_point\service_point_rearm.sqf", [_rearm_costs, _allInfo], -1, false, true, "", _actionCondition];
					};
				};
			};
		} else {
			call _fnc_removeActions;
		};
	} else {
		call _fnc_removeActions;
	};
	sleep 0.5;
};
