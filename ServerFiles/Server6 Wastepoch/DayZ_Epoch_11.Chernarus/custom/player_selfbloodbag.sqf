/* Script writen by Krixes
Infection chance and some comments added by Player2
Combat check added by istealth
FFS YOU DON'T NEED TO EXPLAIN EVERY LINE OF CODE!
*/
private ["_bloodAmount","_humanityBool","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagLastUsedTime","_bloodbagTime","_bloodbagUseTime","_bloodbagUsageTime"];
_bloodAmount = 6000;
_bloodbagUseTime = 15;
_bloodbagLastUsedTime = 1800;

_infectionChance = 10;
_infectedLifeBool = false;
_infectedLifeLost = 500;

_humanityBool = false;
_humanityAmount = 50;
_invehicle = vehicle player != player;
_bloodbagTime = time - lastBloodbag;
_bloodbagUsageTime = time;

if(_bloodbagTime < _bloodbagLastUsedTime) exitWith {
	cutText [format["You may not use Self Bloodbag this soon please wait %1!",(_bloodbagTime - _bloodbagLastUsedTime)], "PLAIN DOWN"];
};

if (dayz_combat == 1) then {
    cutText [format["You are in Combat and cannot give yourself a Bloodbag"], "PLAIN DOWN"];
} else {
	if (!_invehicle) then {
		player playActionNow "Medic";
	};
	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;
	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic || _invehicle) then {
			_started = true;
		};
		if(!_invehicle && !_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then {
			player playActionNow "Medic";
			_isMedic = true;
		};
		if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then {
			r_doLoop = false;
			_finished = true;
			lastBloodbag = time;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};
	r_doLoop = false;
	if (_finished) then {
		player removeMagazine "ItemBloodbag";
		r_player_blood = r_player_blood + _bloodAmount;
		if(r_player_blood > 12000) then {
			r_player_blood = 12000;
		};
		if (random(_infectionChance) < 1) then {
			r_player_infected = true;
			player setVariable["USEC_infected",true,true];
			cutText [format["You have used a bloodbag on yourself but the bloodbag was infected!"], "PLAIN DOWN"];
			if(_infectedLifeBool) then {
				r_player_blood = r_player_blood - _infectedLifeLost;
				player setVariable["USEC_BloodQty",r_player_blood,true];
			} else {
				r_player_lowblood = false;
				10 fadeSound 1;
				"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
				player setVariable["USEC_BloodQty",r_player_blood,true];
			};
		} else {
			r_player_lowblood = false;
			10 fadeSound 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
			player setVariable["USEC_BloodQty",r_player_blood,true];
	 
			cutText [format["You have used a bloodbag on yourself!"], "PLAIN DOWN"];
		};
		if(_humanityBool) then {
			[player,_humanityAmount] call player_humanityChange;
		};
	} else {
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["You have interrupted giving yourself a bloodbag!"], "PLAIN DOWN"];
	};
};