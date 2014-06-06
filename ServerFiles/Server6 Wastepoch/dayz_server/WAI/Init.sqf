spawn_group = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\SpawnGroup.sqf";
group_waypoints = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\patrol.sqf";
spawn_static  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\SpawnStatic.sqf";
heli_para  = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_para.sqf";
heli_patrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\heli_patrol.sqf";
vehicle_patrol = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_patrol.sqf";
markers_compile = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
on_kill = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\ai_killed.sqf";

ai_monitor = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\AImonitor.sqf";
veh_monitor = compile preprocessFileLineNumbers "\z\addons\dayz_server\WAI\compile\vehicle_monitor.sqf";
WAI_AI_Array = []; //use this instead of allDead/allunits
//WAI_AI_GroupArray = []; //used for group cleanup
createCenter east;
WEST setFriend [EAST,0];
EAST setFriend [WEST,0];

ai_ground_units = 0;
ai_emplacement_units = 0;
ai_air_units = 0;
ai_vehicle_units = 0;

//Load config
[] call (compile (preprocessFileLineNumbers "\z\addons\dayz_server\WAI\AIconfig.sqf"));
diag_log "WAI: AI Config File Loaded";
[] spawn ai_monitor;
//Load custom spawns
[] call (compile (preprocessFileLineNumbers "\z\addons\dayz_server\WAI\customSpawns.sqf"));
if (ai_mission_sysyem) then {
	//Load AI mission system
	[] call (compile (preprocessFileLineNumbers "\z\addons\dayz_server\WAI\missions\missionIni.sqf"));
};