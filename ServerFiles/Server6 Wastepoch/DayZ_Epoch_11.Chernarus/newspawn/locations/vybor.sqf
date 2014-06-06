private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText ["You can't select a spawn point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Spawning at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[3625.72,8976.06,0.001], [3685.59,8564.4,0.001], [4197.1,8917.17,0.001], [3870.38,8997.64,0.001], [3729.86,8869.19,0.001]] call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
	titleText ["Spawned!", "PLAIN DOWN", 3];
	sleep 2;
	titleFadeOut 1;
	execVM "newspawn\classes_execute.sqf";
};