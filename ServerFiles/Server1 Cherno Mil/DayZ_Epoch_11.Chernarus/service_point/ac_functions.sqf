//by axCop
//_version = 1.0;
//diag_log format ["AC_functions version %1", _version];

AC_fnc_checkRequirements = {
	private ["_requirements","_inventory","_hasRequirements","_itemIn","_countIn","_qty","_missing","_missingQty","_textMissing"];
	_requirements = _this;
	_inventory = magazines player;
	_hasRequirements = true;
	{
		_itemIn = "";
		_countIn = 1;
		if ((typeName _x) == "ARRAY") then {
			if (count _x >= 2) then {
				_itemIn = _x select 0;
				_countIn = _x select 1;
			};
		} else {
			_itemIn = _x;
		};
		if (_itemIn != "") then {
			_qty = { (_x == _itemIn) || (configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _itemIn) } count _inventory;
		} else {
			_qty = _countIn;
		};
		if (_qty < _countIn) exitWith {
			_missing = _itemIn;
			_missingQty = (_countIn - _qty);
			_hasRequirements = false;
			_textMissing = getText(configFile >> "CfgMagazines" >> _missing >> "displayName");
			cutText [format["Missing %1 more of %2", _missingQty, _textMissing], "PLAIN DOWN"];
		};
	} forEach _requirements;
	_hasRequirements
};

AC_fnc_removeRequirements = {
	private ["_requirements","_inventory","_temp_removed_array","_removed_total","_tobe_removed_total","_removed","_itemIn","_countIn","_num_removed"];
	_requirements = _this;
	_inventory = magazines player;
	_temp_removed_array = [];
	_removed_total = 0;
	_tobe_removed_total = 0;
	{
		_removed = 0;
		_itemIn = "";
		_countIn = 1;
		if ((typeName _x) == "ARRAY") then {
			if (count _x >= 2) then {
				_itemIn = _x select 0;
				_countIn = _x select 1;
			};
		} else {
			_itemIn = _x;
		};
		if (_itemIn != "") then {
			_tobe_removed_total = _tobe_removed_total + _countIn;
			{
				if ((_removed < _countIn) && ((_x == _itemIn) || configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _itemIn)) then {
					_num_removed = ([player,_x] call BIS_fnc_invRemove);
					_removed = _removed + _num_removed;
					_removed_total = _removed_total + _num_removed;
					if (_num_removed >= 1) then {
						_temp_removed_array set [count _temp_removed_array, _x];
					};
				};
			} forEach _inventory;
		};
	} forEach _requirements;
	if (_tobe_removed_total == _removed_total) exitWith { true };
	{ player addMagazine _x; } forEach _temp_removed_array;
	cutText [format["Missing Parts after first check Item: %1 / %2", _removed_total, _tobe_removed_total], "PLAIN DOWN"];
	false
};

AC_fnc_checkAndRemoveRequirements = {
	private ["_requirements","_b"];
	_requirements = _this;
	_b = _requirements call AC_fnc_checkRequirements;
	if (_b) then {
		_b = _requirements call AC_fnc_removeRequirements;
	};
	_b
};