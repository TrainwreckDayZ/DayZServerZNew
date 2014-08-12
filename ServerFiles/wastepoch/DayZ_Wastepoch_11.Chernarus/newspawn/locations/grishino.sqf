private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText ["You can't select a spawn point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Spawning at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[5939.45,10195.3,0.001], [6194.16,10372.5,0.001], [6089.6,10558,0.002], [5865.1,10132,0.002], [5296.89,10556,0.002]] call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
	titleText ["Spawned!", "PLAIN DOWN", 3];
	sleep 2;
	titleFadeOut 1;
	execVM "newspawn\classes_execute.sqf";
};