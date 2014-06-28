/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
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
spawnShoremode = 0; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxHeliCrashes= 5; // Default = 5
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 10; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 10; // Default = 30 
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
setViewDistance 1500;
DZE_PlotPole = [100,125];
DZE_R3F_WEIGHT = false;


// Default Loadout Config for New Spawns
DefaultMagazines = ["ItemBandage","ItemPainkiller","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"]; 
DefaultWeapons = ["ItemMap","Makarov","ItemToolbox","Binocular"]; 
DefaultBackpack = "DZ_Patrol_Pack_EP1"; 
DefaultBackpackWeapon = "";

//EpochEvents = [["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "fixes\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "fixes\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\buildings.sqf";
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
	

	
};


[] execVM "R3F_ARTY_AND_LOG\init.sqf";
[] ExecVM "custom\player_onSide.sqf";
[] execVM "custom\Server_WelcomeCredits.sqf"; //Credits
//Start Dynamic Weather
if(true) then {
	execVM "custom\DynamicWeatherEffects.sqf";
};

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

_nil = [] execVM "safezone\init.sqf";