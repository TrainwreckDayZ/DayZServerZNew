private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText ["You can't select a spawn point while in combat.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	titleText ["Spawning at selected location...", "PLAIN DOWN", 3];
	_ebayrandomspawn = [[4582.06,6457.02,0.001], [4736.47,6376.42,0.002], [4537.43,6382.02,0.001], [4373.46,6221.47,0.002], [4785.58,6592.75,0.002]] call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	showCommandingMenu '';
	sleep 2;
	titleText ["Spawned!", "PLAIN DOWN", 3];
	sleep 2;
	titleFadeOut 1;
	execVM "newspawn\classes_execute.sqf";
};