if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
[] execFSM "dayz_code\system\player_monitor.fsm";
[] execVM "\z\addons\dayz_code\external\R3F_Realism\R3F_Realism_Init.sqf";