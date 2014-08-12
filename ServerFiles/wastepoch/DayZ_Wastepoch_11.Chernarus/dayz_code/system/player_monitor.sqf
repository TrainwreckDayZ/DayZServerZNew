if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
[] execFSM "dayz_code\system\player_monitor.fsm";
