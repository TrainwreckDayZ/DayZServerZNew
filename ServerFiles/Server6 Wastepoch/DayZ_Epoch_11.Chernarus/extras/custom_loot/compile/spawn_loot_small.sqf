private ["_iItem","_iClass","_iPos","_radius","_item","_itemTypes","_index","_weights","_cntWeights","_canType","_dateNow"];
_iItem = 	_this select 0;
_iClass = 	_this select 1;
_iPos =		_this select 2;
_radius =	_this select 3;
switch (_iClass) do
{
	default
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_itemTypes = [] + ((getArray (missionConfigFile >> "CfgLootSmall" >> _iClass)) select 0);
		_index = dayzE_CLSBase find _iClass;
		if (_index >= 0) then {
			_weights = dayzE_CLSChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_canType = _itemTypes select _index;
			_item addMagazineCargoGlobal [_canType,1];
		};
	};
	case "single":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_itemTypes = [] + ((getArray (missionConfigFile >> "CfgLootSmall" >> _iItem)) select 0);
		_index = dayzE_CLSBase find _iItem;
		if (_index >= 0) then {
			_weights = dayzE_CLSChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_canType = _itemTypes select _index;
			_item addMagazineCargoGlobal [_canType,1];
		};
	};
	case "cfglootweapon":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];

		_itemTypes = [] + ((getArray (missionConfigFile >> "cfgLoot" >> _iItem)) select 0);
		_index = dayz_CLBase find _iItem;
		if (_index >= 0) then {
			_weights = dayz_CLChances select _index;
			_cntWeights = count _weights;
			_index = floor(random _cntWeights);
			_index = _weights select _index;
			_iItem = _itemTypes select _index;

			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item addWeaponCargoGlobal [_iItem,1];
		};
	};
	case "weapon":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_item addWeaponCargoGlobal [_iItem,1];
	};
	case "magazine":
	{
		_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
		_item addMagazineCargoGlobal [_iItem,1];
	};
	case "weaponnomags": {};
	case "backpack": {};
	case "object": {};
};
_dateNow = (DateToNumber date);
if (!isNil "_item") then {
	_item setVariable ["looted",_dateNow,true];
};
if (((count _iPos) > 2) && (!isNil "_item")) then 
{
	_item setPosATL _iPos;
};