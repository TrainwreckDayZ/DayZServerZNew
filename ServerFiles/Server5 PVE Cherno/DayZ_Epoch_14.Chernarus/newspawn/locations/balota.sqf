private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText ["You can't select a spawn point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Spawning at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[4388.23,2263.44,0.001], [5683.43,3004.63,0.001], [4517.41,2420.66,0.001], [5171.99,2070.86,0.001], [4253.29,2533.43,0.001]] call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
	titleText ["Spawned!", "PLAIN DOWN", 3];
	sleep 2;
	titleFadeOut 1;
	execVM "newspawn\classes_execute.sqf";
};