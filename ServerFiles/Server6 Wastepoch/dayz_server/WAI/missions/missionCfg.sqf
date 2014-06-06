// Time between missions (seconds)
wai_mission_timer = 300;

// How long before a mission times out (seconds)
wai_mission_timeout = 1800;

// missions used when selecting the next random mission
wai_missions = [
"armed_vehicle",
//"crash_spawner",
//"disabled_civchopper",
"disabled_milchopper",
"MV22",
"weapon_cache",
"ikea",
"convoy"
];

// fuel the mission vehicles spawn with 0-100.
wai_mission_fuel = 69;

// armed vehicles to spawn in missions
armed_vehicle = [
"M1128_MGS_EP1",
"Ural_ZU23_TK_EP1",
"HMMWV_TOW",
"GAZ_Vodnik_HMG",
"M1126_ICV_M2_EP1",
"T34"
];

//armed helis to spawn in missions
armed_chopper = [
"Mi24_V",
"AH6J_EP1",
"UH1Y"
];

// civilian aircraft to spawn in missions
//civil_aircraft = [
//"MV22_DZ"
//];

// military unarmed vehicles to spawn in missions
military_unarmed = [
"BTR90_HQ",
"LAV25_HQ",
"BMP2_HQ_CDF"
];

// cargo trucks to spawn in missions
cargo_trucks = [
"SUV_PMC"
];

// refuel trucks to spawn in missions
refuel_trucks = [
"UralRefuel_TK_EP1_DZ",
"MTVRRepair",
"UralReammo_TK_EP1"
];

// civilian vehicles to spawn in missions
civil_vehicles = [
"ArmoredSUV_PMC_DZ",
"HMMWV_M2",
"BAF_Jackal2_L2A1_w",
"UAZ_SPG9_INS",
"HMMWV_M1151_M2_CZ_DES_EP1_DZ"
];

// Number of guns to spawn in ammo boxes 
wai_mission_numberofguns = 20;
// classnames of guns to spawn in ammo boxes (only class weapons)
ammo_box_guns = [
"UZI_SD_EP1",
"SCAR_H_STD_EGLM_Spect",
"SCAR_L_STD_EGLM_RCO",
"SCAR_H_CQC_CCO",
"SCAR_H_CQC_CCO_SD",
"Pecheneg_DZ",
"BAF_LRR_scoped_W",
"m107",
"RPG7V",
"MAAWS",
"BAF_LRR_scoped",
"SMAW",
"BAF_AS50_scoped",
"Stinger",
"chainsaw"
];

// Number of tools to spawn in ammo boxes 
wai_mission_numberoftools = 7;
// classnames of tools to spawn in ammo boxes (only toolbelt items or weapon class Eg. "Chainsaw" or "ItemToolbox")
ammo_box_tools =[
"ItemToolbox",
"ItemCrowbar",
"ItemEtool",
"Binocular_Vector",
"ItemFishingPole",
"ItemGPS",
"chainsaw"

];

// Number of items to spawn in ammo boxes 
wai_mission_numberofitems = 40;
// classnames of items to spawn in ammo boxes (only type magazine will work here)
ammo_box_items =[
"ItemWoodStairs","ItemPole","ItemPole","bulk_ItemTankTrap","MortarBucket","CinderBlocks","PartPlankPack","PartPlywoodPack","ItemWoodFloor","metal_floor_kit","outhouse_kit","cinder_wall_kit","ItemComboLock","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","Itemvault","cinder_garage_kit","storage_shed_kit","wood_shack_kit","deer_stand_kit","ItemWoodLadder","forest_net_kit","bulk_ItemSandbag"
];
