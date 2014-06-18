//by Axe Cop (Mostly)

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
	} count _requirements;
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
	{ player addMagazine _x; } count _temp_removed_array;
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
		_NormalizedName = toString(_toArray);
	};
	_classMags = _NormalizedName call funcGetTurretsWeapons;
	if (_this select 1) then {_classMags = _NormalizedName;};
	_classMags
};