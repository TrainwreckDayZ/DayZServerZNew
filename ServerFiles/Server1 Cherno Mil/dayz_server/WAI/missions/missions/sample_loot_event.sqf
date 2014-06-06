private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_spawnChance =  0.55; // Percentage chance of event happening
_markerRadius = 400; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns

_loot_box = "USBasicWeapons_EP1";
_loot_lists = [
[
["DMR","BAF_LRR_scoped","M40A3","M110_NVG_EP1"], 
["20Rnd_762x51_DMR","5Rnd_86x70_L115A1","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","5Rnd_86x70_L115A1","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","ItemMorphine","ItemMorphine","ItemBloodbag","ItemBloodbag","ItemPainkiller","ItemPainkiller","ItemBandage","ItemBandage","ItemBandage","ItemBandage","DZ_GunBag_EP1","ItemGoldBar10oz","Skin_Sniper1_DZ","Itembriefcase20oz"]
],
[
["G36_C_SD_camo","FN_FAL","SCAR_H_LNG_Sniper_SD","G36K_camo"], 
["ItemPainkiller","ItemMorphine","ItemBandage","ItemBloodbag", "ItemAntibiotic","ItemEpinephrine","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","Itembriefcase10oz"]
],
[
["M240_DZ","AK_74","M107"], 
["30Rnd_762x39_AK47","30Rnd_762x39_AK47","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","HandGrenade_west","100Rnd_762x51_M240","Skin_Soldier1_DZ","revolver_gold_EP1","6Rnd_45ACP","6Rnd_45ACP","FoodmuttonCooked","ItemSodaCoke","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemMorphine","DZ_ALICE_Pack_EP1","itembreifcase100oz"]
],
[
["M4A1_AIM_SD_camo","G36K_camo","glock17_EP1","glock17_EP1"], 
["20Rnd_762x51_SB_SCAR","20Rnd_762x51_SB_SCAR","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","FoodmuttonCooked","ItemSodaCoke","ItemBloodbag","ItemBloodbag","Skin_Camo1_DZ","Skin_Camo1_DZ","Itembriefcase10oz"]
],
[
["M9SD","M16A4_ACG_GL","M32_ep1"],
["6RND_HE_M203","6RND_HE_M203","6RND_smoke_M203","6RND_smoke_M203","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemAntibiotic","ItemAntibiotic","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","Skin_Rocker1_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Itembriefcase30oz"]
],
[
["BAF_LRR_scoped","VSS_vintorez","DMR"], 
["ItemPainkiller","ItemMorphine","ItemBandage","ItemBloodbag", "ItemAntibiotic","ItemEpinephrine","PipeBomb","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR"]
],
[
["M4A1","M4A3_CCO_EP1","M8_sharpshooter","M40A3","BAF_L85A2_UGL_ACOG"], 
["ItemPainkiller","ItemMorphine","ItemBandage","ItemBloodbag", "ItemAntibiotic","ItemEpinephrine","PipeBomb","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;

_loot_amount = 75;
_wait_time = 1200; 

// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';

if (isNil "EPOCH_EVENT_RUNNING") then {
	EPOCH_EVENT_RUNNING = false;
};

// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
	diag_log("Event already running");
};

// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};

// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

diag_log(format["Spawning loot event at %1", _position]);

_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorBlue";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];

_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;


if (_debug) then {
	_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
	_debug_marker setMarkerShape "ICON";
	_debug_marker setMarkerType "mil_dot";
	_debug_marker setMarkerColor "ColorBlue";
	_debug_marker setMarkerAlpha 1;
};

diag_log(format["Creating ammo box at %1", _loot_pos]);

// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;

// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end

// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);

// Send message to users (http://dayzepoch.com/forum/index.php?/topic/1026-server-side-hintglobalchat-fix-deathmsg-fix/)
_hint = parseText format["<t align='center' color='#52bf90' shadow='2' size='1.75'>Weapon Cache Mission</t><br/><t align='center' color='#ffffff'>A weapons cache has been located within the shaded area on the map, you have 20 minutes to grab the loot</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";
diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

//set markers
_this = createMarker ["SAR_marker_sm1", [(_loot_pos select 0) + 1, (_loot_pos select 1) + 1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [100, 100];
_this setMarkerDir 120.050;
SAR_marker_sm1 = _this;

//spawn troops
[SAR_marker_sm1,3,1,3,"fortify",false] call SAR_AI;


// Wait
sleep _wait_time;

// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
deleteMarker _event_marker;

if (_debug) then {
	deleteMarker _debug_marker;
};