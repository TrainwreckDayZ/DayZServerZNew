private ["_position","_unitcount","_skill","_wpRadius","_xpos","_ypos","_unitGroup","_aiskin","_unit","_weapon","_magazine","_wppos1","_wppos2","_wppos3","_wppos4","_wp1","_wp2","_wp3","_wp4","_wpfin","_unitArrayName","_unitMissionCount"];
_position = _this select 0;
_unitcount = _this select 1;
_skill = _this select 2;
_unitArrayName = _this select 3;


_wpRadius = 20;

_xpos = _position select 0;
_ypos = _position select 1;

_unitGroup = createGroup east;

if (!isServer) exitWith {};

for "_x" from 1 to _unitcount do {

	_aiskin = DZMSBanditSkins call BIS_fnc_selectRandom;
	
	_unit = _unitGroup createUnit [_aiskin, [(_position select 0),(_position select 1),(_position select 2)], [], 10, "PRIVATE"];
	
	[_unit] joinSilent _unitGroup;
	
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setCombatMode "YELLOW";
	_unit setBehaviour "COMBAT";
	
	removeAllWeapons _unit;
	removeAllItems _unit;
	
	//Now we need to figure out their loadout, and assign it
	
	_weaponArray = [_skill] call DZMSGetWeapon;
	
	_weapon = _weaponArray select 0;
	_magazine = _weaponArray select 1;
	
	//diag_log text format ["[DZMS]: AI Weapon:%1 / AI Magazine:%2",_weapon,_magazine];
	
	_aigearArray = [DZMSGear0,DZMSGear1,DZMSGear2,DZMSGear3,DZMSGear4];
	_aigear = _aigearArray call BIS_fnc_selectRandom;
	_gearmagazines = _aigear select 0;
	_geartools = _aigear select 1;
	
	_aipack = DZMSPacklist call BIS_fnc_selectRandom;

	for "_i" from 1 to 3 do {
		_unit addMagazine _magazine;
	};
	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	
	_unit addBackpack _aipack;
	
	if (DZMSUseNVG) then {
		_unit addWeapon "NVGoggles";
	};
	
	{
		_unit addMagazine _x
	} count _gearmagazines;
	
	{
		_unit addWeapon _x
	} count _geartools;
	
	_aicskill = DZMSSkills1;
	
	switch (_skill) do {
		case 0: {_aicskill = DZMSSkills0;};
		case 1: {_aicskill = DZMSSkills1;};
		case 2: {_aicskill = DZMSSkills2;};
		case 3: {_aicskill = DZMSSkills3;};
	};
	
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} count _aicskill;
	
	_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] ExecVM DZMSAIKilled; }];
	_unit setVariable ["DZMSAI", true];
};

if (DZMSUseRPG) then {
	_unit addWeapon "SMAW";
	_unit addMagazine "SMAW_HEAA";
	_unit addMagazine "SMAW_HEAA";
};

_wppos1 = [_xpos, _ypos+20, 0];
_wppos2 = [_xpos+20, _ypos, 0];
_wppos3 = [_xpos, _ypos-20, 0];
_wppos4 = [_xpos-20, _ypos, 0];

_wp1 = _unitGroup addWaypoint [_wppos1, _wpRadius];
_wp1 setWaypointType "MOVE";
_wp2 = _unitGroup addWaypoint [_wppos2, _wpRadius];
_wp2 setWaypointType "MOVE";
_wp3 = _unitGroup addWaypoint [_wppos3, _wpRadius];
_wp3 setWaypointType "MOVE";
_wp4 = _unitGroup addWaypoint [_wppos4, _wpRadius];
_wp4 setWaypointType "MOVE";

_wpfin = _unitGroup addWaypoint [[_xpos,_ypos, 0], _wpRadius];
_wpfin setWaypointType "CYCLE";

//diag_log text format ["[DZMS]: Spawned %1 AI at %2",_unitcount,_position];

call compile format["
%1 = %1 + (units _unitGroup); 
_unitMissionCount = count %1;
",_unitArrayName];

diag_log text format["[DZMS]: (%3) %1 AI Spawned, %2 units in mission.",count (units _unitGroup),_unitMissionCount,_unitArrayName];