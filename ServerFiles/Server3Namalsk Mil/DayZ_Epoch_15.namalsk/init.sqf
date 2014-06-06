/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance = 15;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;



//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 0;
spawnArea= 1500;
MaxHeliCrashes= 3;
MaxVehicleLimit = 200;
MaxDynamicDebris = 10;
dayz_MapArea = 8000;
dayz_tameDogs = false;
dayz_maxAnimals = 4;
dayz_zedsAttackVehicles = false;
DynamicVehicleDamageHigh = 10;
DynamicVehicleFuelLow = 50;
DZE_AllowForceSave = true;
DZE_DeathMsgGlobal = true;
DZE_BuildingLimit = 300;
DZE_teleport = [1000,2000,500,15000,15000];
ns_blowout = true;
ns_blowout_dayz = true;
ns_blow_delaymod = 1;
DZE_ForceNameTags = true;
DZE_HumanityTargetDistance = 10;
dayz_sellDistance_vehicle = 20;
dayz_sellDistance_boat = 40;
dayz_sellDistance_air = 80;
DZE_BuildingLimit = 450;
DZE_HeliLift = false;
DZE_PlayerZed = false;
setViewDistance 1500;
DZE_PlotPole = [100,125];
DZE_R3F_WEIGHT = false;

// Default Loadout Config for New Spawns
DefaultMagazines = ["ItemBandage","ItemPainkiller","ItemHeatPack","ItemHeatPack","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"]; 
DefaultWeapons = ["ItemMap","Makarov","ItemToolbox"]; 
DefaultBackpack = "DZ_Patrol_Pack_EP1"; 
DefaultBackpackWeapon = "";

//EpochEvents = [["any","any","any","any",15,"supply_drop"]];

dayz_fullMoonNights = true;

call compile preprocessFileLineNumbers "fixes\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "fixes\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
call compile preprocessFileLineNumbers "Namalsk\compiles.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_15.namalsk\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_15.namalsk\mission.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_15.namalsk\buildings.sqf";

	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_nil = [] execVM "custom\remote_messages.sqf";
	[] execVM "service_point\service_point.sqf";
	[] execVM "custom\unlockDoor.sqf";
			
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	[] execVM "Namalsk\Namalsk\breath.sqf";
    
};
[] execVM "R3F_ARTY_AND_LOG\init.sqf";
[] ExecVM "custom\player_onSide.sqf";
[] execVM "custom\Server_WelcomeCredits.sqf"; //Credits
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
execVM "Namalsk\Namalsk\blowout\blowout_init.sqf";
execVM "fixes\DynamicWeatherEffects.sqf";

_nil = [] execVM "safezone\init.sqf";