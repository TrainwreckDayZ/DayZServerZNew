// Time between missions (seconds)
wai_mission_timer = 300;

// How long before a mission times out (seconds)
wai_mission_timeout = 1500;

// missions used when selecting the next random mission
wai_missions = [
"armed_vehicle",
"disabled_civchopper",
"disabled_milchopper",
"MV22",
"weapon_cache",
"ikea",
"convoy"
];

// fuel the mission vehicles spawn with 0-100.
wai_mission_fuel = 50;

// armed vehicles to spawn in missions
armed_vehicle = [
"ArmoredSUV_PMC_DZ",
"HMMWV_Armored",
"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
"HMMWV_M2",
"BRDM2_Gue",
"M113_UN_EP1",
"BAF_Jackal2_GMG_W",
"BAF_Jackal2_L2A1_D",
"UralReammo_TK_EP1",
"MTVRRepair"
];

//armed helis to spawn in missions
armed_chopper = [
"UH1Y_DZ",
"UH60M_EP1_DZ"
];

// civilian aircraft to spawn in missions
civil_aircraft = [
"MV22_DZ"
];

// military unarmed vehicles to spawn in missions
military_unarmed = [
"GAZ_Vodnik_MedEvac",
"HMMWV_Ambulance",
"HMMWV_DZ",
"LandRover_CZ_EP1",
"UAZ_CDF"
];

// cargo trucks to spawn in missions
cargo_trucks = [
"MTVR_DES_EP1",
"Ural_CDF"
];

// refuel trucks to spawn in missions
refuel_trucks = [
"UralRefuel_TK_EP1_DZ",
"MtvrRefuel_DES_EP1_DZ"
];

// civilian vehicles to spawn in missions
civil_vehicles = [
"SUV_Camo",
"SUV_TK_CIV_EP1",
"SUV_Pink"
];

// Number of guns to spawn in ammo boxes 
wai_mission_numberofguns = 15;
// classnames of guns to spawn in ammo boxes (only class weapons)
ammo_box_guns = [
"M9SD",
"AKS_74_UN_kobra",
"AK_107_GL_pso",
"M16A4_ACG_GL",
"M4A1_HWS_GL_SD_Camo",
"M4A1_RCO_GL",
"VSS_vintorez",
"M8_sharpshooter",
"Pecheneg_DZ",
"BAF_LRR_scoped",
"BAF_LRR_scoped_w",
"DMR",
"M110_NVG_EP1",
"Sa58V_RCO_EP1",
"KSVK_DZE",
"M107",
"BAF_AS50_scoped",
"G36a",
"G36K",
"chainsaw"
];

// Number of tools to spawn in ammo boxes 
wai_mission_numberoftools = 5;
// classnames of tools to spawn in ammo boxes (only toolbelt items or weapon class Eg. "Chainsaw" or "ItemToolbox")
ammo_box_tools =[
"ItemToolbox",
"ItemCrowbar",
"ItemEtool",
"Binocular_Vector",
"ItemCompass",
"ItemFishingPole",
"ItemGPS",
"ItemHatchet_DZE",
"ItemMatchbox_DZE"
];

// Number of items to spawn in ammo boxes 
wai_mission_numberofitems = 30;
// classnames of items to spawn in ammo boxes (only type magazine will work here)
ammo_box_items =[
"ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","ItemWoodFloor","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","outhouse_kit","outhouse_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","outhouse_kit","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","workbench_kit","ItemComboLock","ItemComboLock","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","workbench_kit","ItemComboLock","ItemComboLock","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","PartGeneric","metal_floor_kit","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","PartGeneric","Itemvault","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallWindowLg","Itemvault","cinder_wall_kit","ItemComboLock","ItemComboLock","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","workbench_kit","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","wood_shack_kit","wood_shack_kit","wood_shack_kit","deer_stand_kit","deer_stand_kit","ItemWoodLadder","ItemWoodLadder","desert_net_kit","desert_net_kit","ItemWoodLadder","ItemWoodLadder","desert_net_kit","forest_net_kit","ItemSandbagLarge","ItemSandbagLarge","Itemvault"
];
