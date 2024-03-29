private "_safezones";

_safezones = [
	[[6281.39,9404.28],100, "awols air vehilces"],
	[[4702.44,8925.58],100, "fry and phil's weapons/ammo"],
	[[4305.8,4779.58],100, "Brensk Neutral Camp"]
];

_safezoneZonePerm = {
	private ["_trigger", "_trigger_pos", "_trigger_area", "_angle", "_radius", "_count", "_step"];
	_trigger = _this;
	_trigger_pos = getPosATL _trigger;
	_trigger_area = triggerArea _trigger;
	_angle = _trigger_area select 2;
	_radius = _trigger_area select 0;
	_count = round((2 * pi * _radius) / 30);
	_step = 360/_count;

	for "_x" from 0 to _count do
	{
		_a = (_trigger_pos select 0) + (sin(_angle)*_radius);
		_b = (_trigger_pos select 1) + (cos(_angle)*_radius);

		_pos = [_a,_b,0];
		_angle = _angle + _step;
		diag_log format["Spawn sign at: %1", _pos];
		_sign = createVehicle ["SignM_FARP_Winchester_EP1", _pos, [], 0, "CAN_COLLIDE"];
		_sign setVehicleInit "this setObjectTexture [0, ""safezone\sign.paa""];";
		_sign setDir ([_pos, _trigger_pos] call BIS_fnc_DirTo);
	};
};

SafeZoneEnable = {
	inSafeZone = true;
	hintSilent "You have entered a safezone, you have godmode and your weapon has been deactivated!";
	fnc_usec_damageHandler = {};
	player_zombieCheck = {};
	player allowDamage false;
	player removeAllEventhandlers "handleDamage";
	player addEventhandler ["handleDamage", {false}];
	SafezoneFiredEvent = player addEventHandler ["Fired", {
		titleText ["You can not fire your weapon in a safe zone.","PLAIN DOWN"]; titleFadeOut 4;
		NearestObject [_this select 0,_this select 4] setPos[0,0,0];
	}];

	SafezoneSkinChange = [] spawn {
		_skin = typeOf player;
		waitUntil {typeOf player != _skin};
		terminate SafezoneVehicleSpeedLimit;
		SafezoneVehicle removeEventHandler ["Fired", SafezoneVehicleFiredEvent];
		SafezoneVehicleFiredEvent = nil;
		call SafeZoneEnable;
	};

	SafezoneVehicleSpeedLimit = [] spawn {
		_maxspeed = 25;
		while {1 == 1} do {
			waitUntil {(vehicle player != player) && !((vehicle player) isKindOf 'Air')};
			_vehicle = vehicle player;
			_curspeed = speed _vehicle;
			if (_curspeed > _maxspeed) then {
				_vel = velocity _vehicle;
				_dir = direction _vehicle;
				_speed = _curspeed - _maxspeed;
				_vehicle setVelocity [(_vel select 0)-((sin _dir)*_speed),(_vel select 1)- ((cos _dir)*_speed),(_vel select 2)];
			};
			sleep 0.1;
		};
	};
};

SafeZoneDisable = {
	inSafeZone = false;
	hintSilent "You have left a safezone, you no longer have god mode and your weapon has been enabled!";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	terminate SafezoneVehicleSpeedLimit;
	terminate SafezoneSkinChange;
	player allowDamage true;
	player removeAllEventHandlers 'HandleDamage';
	player addEventHandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
	player removeEventHandler ["Fired", SafezoneFiredEvent];
};

{
	_pos = _x select 0;
	_radius = _x select 1;
	_name = _x select 2;

	_trigger = createTrigger ["EmptyDetector", _pos];
	_trigger setTriggerArea [_radius, _radius, 0, false];
	_trigger setTriggerActivation ["ANY", "PRESENT", true];
	_trigger setTriggerType "SWITCH";

	if (isServer) then {
		_trigger spawn _safezoneZonePerm;
	} else {
		_trigger setTriggerStatements ["(vehicle player) in thisList", "call SafeZoneEnable", "call SafeZoneDisable"];
	};
} forEach _safezones;