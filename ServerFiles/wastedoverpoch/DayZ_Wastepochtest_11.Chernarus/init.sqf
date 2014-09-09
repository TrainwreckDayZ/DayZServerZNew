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
enableRadio true;
enableSentences false;

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
DZE_MissionLootTable = true;
spawnShoremode = 0;
spawnArea= 1500;
MaxHeliCrashes= 5;
MaxVehicleLimit = 200;
MaxDynamicDebris = 10;
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
setTerrainGrid 50;
DZE_PlotPole = [100,200];
DZE_DamageBeforeMaint = 0;
DZE_R3F_WEIGHT = false;
dayz_spawnselection = 1;
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.
DefaultMagazines = ["ItemBandage","ItemPainkiller","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"]; 
DefaultWeapons = ["ItemMap","Makarov","ItemToolbox","Binocular"]; 
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
	[] spawn compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\traders.sqf";
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
		_playerMonitor = [] spawn compile preprocessFileLineNumbers "dayz_code\system\player_monitor.sqf";
		[] execVM "fixes\antihack.sqf";
	};
	[] spawn compile preprocessFileLineNumbers "custom\Server_WelcomeCredits.sqf";
	[] spawn compile preprocessFileLineNumbers "dzgm\init.sqf";
	[] spawn compile preprocessFileLineNumbers "custom\DynamicWeatherEffects.sqf";
	[] spawn compile preprocessFileLineNumbers "safezone\init.sqf";
	waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
	if ((!spawnPointChosen) && (dayzPlayerLogin2 select 2)) then {
		[] spawn compile preprocessFileLineNumbers "newspawn\classes_execute.sqf";
		while {!spawnPointChosen} do {
			if (!(commandingMenu in ["#USER:classes","#USER:Peasant","#USER:Donator"])) then {
				showCommandingMenu "";
				sleep 0.001;
				showCommandingMenu "#USER:classes";
			} else {
				sleep 0.001;
			};
		};
	};
};
