private ["_unit","_player","_humanity","_banditkills"];
_unit = _this select 0;
_player = _this select 1;


if (isPlayer _player) then {
	private ["_banditkills","_humanity"];
	
	//diag_log text format ["[DZMS]: Debug: Unit killed by %1 at %2", _player, mapGridPosition _unit];
	
	_humanity = _player getVariable ["humanity",0];
	_banditkills = _player getVariable ["banditKills",0];
	
	if (DZMSMissHumanity) then {
		_player setVariable ["humanity",(_humanity + DZMSCntHumanity),true];
	};
	
	if (DZMSCntBanditKls) then {
		_player setVariable ["banditKills",(_banditkills + 1),true];
	};
	
	{
		if (((position _x) distance (position _unit)) <= 300) then {
			_x reveal [_player, 4.0];
		}
	} count allUnits;
	
} else {

	//diag_log text format ["[DZMS]: Debug: Unit killed by %1 at %2", _player, mapGridPosition _unit];

	if (DZMSRunGear) then {
		removeBackpack _unit;
		removeAllWeapons _unit;
		{
			_unit removeMagazine _x
		} count magazines _unit;
	};
	
};

if (DZMSCleanDeath) then {
	_unit call DZMSPurgeObject;
	if (DZMSCleanDeath) exitWith {};
};

if (DZMSUseNVG) then {
	_unit removeWeapon "NVGoggles";
};

//if (DZMSUseRPG AND ("RPG7V" in (weapons _unit))) then {
//	_unit removeWeapon "RPG7V";
//	_unit removeMagazines "PG7V";
//};

[DZMSBodyTime,10] call DZMSSleep;
_unit call DZMSPurgeObject;