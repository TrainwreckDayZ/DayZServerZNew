private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText ["You can't select a spawn point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Spawning at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[11052.5,12361.2,0.002], [11764.1,12147.6,0.002], [12086,11991,0.001], [10804.7,12483.5,0.001], [11073.3,12468.8,0.001]] call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
	titleText ["Spawned!", "PLAIN DOWN", 3];
	sleep 2;
	titleFadeOut 1;
	execVM "newspawn\classes_execute.sqf";
};