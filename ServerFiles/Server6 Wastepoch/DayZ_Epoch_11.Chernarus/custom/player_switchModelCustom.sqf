private ["_backpackWpn","_currentWpn","_weapons","_class","_countMags","_position","_dir","_currentAnim","_tagSetting","_playerUID","_magazines","_newBackpackType","_muzzles","_oldUnit","_group","_newUnit","_playerObjName","_wpnType","_ismelee"];
_class 			= _this select 0;
_countMags		= _this select 1;
_position 		= getPosATL player;
_dir 			= getDir player;
_currentAnim 	= animationState player;
_tagSetting		= player getVariable["DZE_display_name",false];
_playerUID		= getPlayerUID player;
_weapons		= _countMags select 0;
_magazines		= _countMags select 1;
_newBackpackType = dayz_myBackpack;
if(_newBackpackType != "") then {
	_backpackWpn = getWeaponCargo unitBackpack player;
};
_currentWpn = currentWeapon player;
_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then {
	_currentWpn = currentMuzzle player;
};
player setPosATL dayz_spawnPos;
_oldUnit = player;
_group 		= createGroup west;
_newUnit 	= _group createUnit [_class,dayz_spawnPos,[],0,"NONE"];
_newUnit 	setPosATL _position;
_newUnit 	setDir _dir;
{_newUnit removeMagazine _x;} forEach  magazines _newUnit;
removeAllWeapons _newUnit;	
{
	if (typeName _x == "ARRAY") then {
		if ((count _x) > 0) then {
			for "_i" from 1 to (_x select 1) do {
				_newUnit addMagazine (_x select 0);
			};
		};
	} else {
		_newUnit addMagazine _x;
	};
} forEach _magazines;
{
	_newUnit addWeapon _x;
} forEach _weapons;
if(str(_weapons) != str(weapons _newUnit)) then {
	{
		_weapons = _weapons - [_x];
	} forEach (weapons _newUnit);
	{
		_newUnit addWeapon _x;
	} forEach _weapons;
};
if (!isNil "_newBackpackType") then {
	if (_newBackpackType != "") then {
		_newUnit addBackpack _newBackpackType;
		dayz_myBackpack = unitBackpack _newUnit;
	};
};
addSwitchableUnit _newUnit;
setPlayable _newUnit;
selectPlayer _newUnit;
removeAllWeapons _oldUnit;
{_oldUnit removeMagazine _x;} forEach  magazines _oldUnit;
deleteVehicle _oldUnit;
if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};
[objNull, player, rSwitchMove,_currentAnim] call RE;
player disableConversation true;
if (_tagSetting) then {
	DZE_ForceNameTags = true;
};
_playerUID = getPlayerUID player;
_playerObjName = format["PVDZE_player%1",_playerUID];
call compile format["%1 = player;",_playerObjName];
publicVariableServer _playerObjName;
_wpnType = primaryWeapon player;
_ismelee = (gettext (configFile >> "CfgWeapons" >> _wpnType >> "melee"));
if (_ismelee == "true") then {
	call dayz_meleeMagazineCheck; 
};
{player reveal _x} forEach (nearestObjects [getPosATL player, dayz_reveal, 50]);