custom_publish  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\custom_publishVehicle.sqf";
spawn_ammo_box  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ammobox.sqf";
spawn_ammo_boxsupply  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\ammoboxsupply.sqf";

clean_running_mission = False;

//load mission config
[] call (compile (preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\missionCfg.sqf"));
diag_log "WAI: Mission Config File Loaded";
[] spawn (compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\missions.sqf");
//Custom ammo boxes
//[] call (compile (preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\StaticAmmoBoxes.sqf"));