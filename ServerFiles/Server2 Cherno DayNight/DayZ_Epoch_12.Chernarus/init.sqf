/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
dayZ_instance =	11;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

spawnShoremode = 0; // Default = 1 (on shore)
spawnArea= 1500;
MaxHeliCrashes= 5;
MaxVehicleLimit = 300;
MaxDynamicDebris = 75;
dayz_MapArea = 14000;
dayz_maxLocalZombies = 10;
dayz_maxGlobalZombiesInit = 5;
dayz_maxGlobalZombiesIncrease = 5;
dayz_maxZeds = 300;
DZE_DeathMsgGlobal = true;
DZE_AllowForceSave = true;
DZE_teleport = [1000,2000,500,20000,20000];
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 40;
DynamicVehicleFuelLow = 5;
DynamicVehicleFuelHigh = 100;
dayz_maxAnimals = 4; 
dayz_tameDogs = true;
DZE_ForceNameTags = true;
DZE_HumanityTargetDistance = 10;
dayz_sellDistance_vehicle = 20;
dayz_sellDistance_boat = 40;
dayz_sellDistance_air = 80;
DZE_BuildingLimit = 350;
DZE_HeliLift = false;
DZE_PlayerZed = false;
dayzSetViewDistance = 1500;
setViewDistance 1500;
setTerrainGrid 20;
DZE_PlotPole = [100,125];
DZE_DamageBeforeMaint = 0;
DefaultMagazines = ["ItemBandage","ItemPainkiller","Machete_Swing"]; 
DefaultWeapons = ["ItemMap","MeleeMachete","ItemRadio"]; 
DefaultBackpack = "DZ_Patrol_Pack_EP1"; 
dayz_fullMoonNights = true;
DZE_SelfTransfuse = true;
Restrict_Wait = time;
customActionConfigs = ["ExtraRa","ExtraRb","ExtraRc","ItemKiloHemp","ExtraSm","ExtraTm"];

call compile preprocessFileLineNumbers "fixes\variables.sqf";
call compile preprocessFileLineNumbers "R3F_ARTY_AND_LOG\init.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";	
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "fixes\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";
progressLoadingScreen 1.0;
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//[] execFSM "\ASM\fn_ASM.fsm"; //Uncomment if you are using ASM (RECOMMENDED)!
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	[] spawn compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	[] spawn compile preprocessFileLineNumbers "\z\addons\dayz_code\system\server_monitor.sqf";
};
[] spawn {
	if (!isDedicated) then {
		0 fadeSound 0;
		waitUntil {!isNil "dayz_loadScreenMsg"};
		dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
		[] spawn compile preprocessFileLineNumbers "custom\remote_messages.sqf";	
		[] spawn compile preprocessFileLineNumbers "service_point\service_point.sqf";
		_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
		_playerMonitor = [] spawn compile preprocessFileLineNumbers "\z\addons\dayz_code\system\player_monitor.sqf";
		[] execVM "fixes\antihack.sqf";
	};
	[] spawn compile preprocessFileLineNumbers "custom\Server_WelcomeCredits.sqf";
	[] spawn compile preprocessFileLineNumbers "dzgm\init.sqf";
	[] spawn compile preprocessFileLineNumbers "custom\DynamicWeatherEffects.sqf";
	[] spawn compile preprocessFileLineNumbers "safezone\init.sqf";
};