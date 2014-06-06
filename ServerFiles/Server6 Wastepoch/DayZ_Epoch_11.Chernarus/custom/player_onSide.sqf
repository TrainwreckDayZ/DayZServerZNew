//IMPORTANT NOTE: THIS IS CALLED FROM THE ANTIHACK!!!!
private "_cos";
disableSerialization;
if (isNil "DS_slap_them") then {
	DS_really_loud_sounds = {[60,15] call fnc_usec_pitchWhine;for "_i" from 1 to 15 do {playSound format ["%1",_this select 0];};};
	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	DS_slap_them = {private "_randomnr"; _randomnr = [2,-1] call BIS_fnc_selectRandom;(vehicle player) SetVelocity [(_randomnr * random (4) * (_this select 0)), (_randomnr * random (4) * (_this select 0)), random (4)];};
};
if ((time - Restrict_Wait) >= 5) then {
	if ((!isNull (findDisplay 63)) && ((_this select 1) in actionKeys "PushToTalk")) then  {
		Restrict_Wait = time;
		_chatChn = ctrlText ((findDisplay 63) displayCtrl 101);
		if ((_chatChn == (localize "STR_SIDE_CHANNEL")) || (_chatChn == (localize "STR_GLOBAL_CHANNEL"))) then {
			_cos = cos(getdir(vehicle player));
			[] spawn {
				if (isNil "reset_timer") then {reset_timer = 0;} else {reset_timer = reset_timer + 1;};
				if (reset_timer == 0) then {
					sleep 90;
					disconnect_me = nil;
					warn_one = nil;
					warn_two = nil;
					warn_three = nil;
					warn_last = nil;
					reset_timer = 0;
				};
			};
			if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
			if (disconnect_me == 0) then {
				if (isNil "warn_one") then {
					warn_one = true;
					systemChat ("Please do not use voice on sidechat, this is your first warning.");
					[_cos] call DS_slap_them;
					["beat04"] call DS_really_loud_sounds;
					["NO VOICE ON SIDE"] call DS_double_cut;
				};
			};
			if (disconnect_me == 1) then {
				if (isNil "warn_two") then {
					warn_two = true;
					systemChat ("Please do not use voice on sidechat, this is your second warning..");
					[_cos] call DS_slap_them;
					["beat04"] call DS_really_loud_sounds;
					["NO VOICE ON SIDE"] call DS_double_cut;
				};
			};
			if (disconnect_me == 2) then {
				if (isNil "warn_three") then {
					warn_three = true;
					systemChat ("PLEASE DO NOT USE VOICE ON SIDECHAT!! This is your LAST warning!");
					systemChat ("You will be frozen and then disconnected!");
					[_cos] call DS_slap_them;
					["beat04"] call DS_really_loud_sounds;
					["NO VOICE ON SIDE! This is your LAST warning!"] call DS_double_cut;
				};
			};
			if (disconnect_me >= 3) then {
				if (isNil "warn_last") then {
					warn_last = true;
					[_cos] spawn {
						playMusic ["PitchWhine",0];
						[(_this select 0)] call DS_slap_them;
						["beat04"] call DS_really_loud_sounds;
						["We warned you..."] call DS_double_cut;
						1 fademusic 10;
						1 fadesound 10;
						disableUserInput true;
						startLoadingScreen ["You are being disconnected", "DayZ_loadingScreen"];
						progressLoadingScreen 0.2;sleep 2;["All_Haha"] call DS_really_loud_sounds;
						progressLoadingScreen 0.4;sleep 2.25;
						progressLoadingScreen 0.6;sleep 2;["All_Haha"] call DS_really_loud_sounds;
						progressLoadingScreen 0.8;sleep 2.25;
						progressLoadingScreen 1.0;sleep 2;["All_Haha"] call DS_really_loud_sounds;
						endLoadingScreen;sleep 0.5;
						disableUserInput false;
						endMission "LOSER";
					};
				};
			};
		};
	};
};
false; //LEAVE THIS HERE!!