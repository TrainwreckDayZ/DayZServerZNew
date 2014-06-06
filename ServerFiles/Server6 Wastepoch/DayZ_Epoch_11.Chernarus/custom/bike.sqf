private ["_finished","_finishedTime","_posplr","_dirplr","_object"];

if (dayz_combat == 1) exitWith {cutText [format["You are in Combat and cannot build a bike."], "PLAIN DOWN"];};
player removeAction s_player_deploybike;
player removeWeapon "ItemToolbox";
player playActionNow "Medic";
[player,"repair",0,false,10] call dayz_zombieSpeak;
[player,10,true,(getPosATL player)] spawn player_alertZombies;

r_interrupt = false;
r_doLoop = true;
_finished = false;
_finishedTime = diag_tickTime + 3;

while {r_doLoop} do {
	if (diag_tickTime >= _finishedTime) then {
		r_doLoop = false;
		_finished = true;
	};
	if (r_interrupt) then {
		r_doLoop = false;
	};
	sleep 0.1;
};

if (_finished) then {
	_pos = getPosATL player;
	_posplr = [(_pos select 0) + 0.5, (_pos select 1) + 0.5, 0];
	_dirplr = getDir player;
	_object = createVehicle ["MMT_Civ", _posplr, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["ObjectID", "1", true];
	_object setVariable ["ObjectUID", "1", true];
	_object setVariable ["SpawnedBike",1,true];
	_object setVariable ["Sarge",1,true];
	player reveal _object;

	cutText [format["You've spawned a bike."], "PLAIN DOWN"];
	sleep 10;
	cutText [format["Warning: Spawned Bikes DO NOT SAVE after server restart!"], "PLAIN DOWN"];
} else {
	r_interrupt = false;
	player switchMove "";
	player playActionNow "stop";
	player addWeapon "ItemToolbox";
	cutText ["\n\nCanceled building a bike.", "PLAIN DOWN"];
};