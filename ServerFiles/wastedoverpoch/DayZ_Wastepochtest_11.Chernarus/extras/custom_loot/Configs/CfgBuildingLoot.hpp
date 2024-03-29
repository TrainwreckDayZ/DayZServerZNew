class CfgBuildingLoot {
	class Default {
		zombieChance = 0.2;
		minRoaming = 0;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
		lootChance = 0;
		lootPos[] = {};
		lootPosSmall[] = {};
		lootPosZombie[] = {};
		lootType[] = {};
		itemType[] = {};
		itemChance[] = {};
		lootTypeSmall[] = {};
		itemChanceSmall[] = {};
		hangPos[] = {};
		vehPos[] = {};
	};
	class Castle: Default {
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"SniperRifles","cfglootweapon",0.1},
			{"pistols", "cfglootweapon",0.2},
			{"ItemKnife","weapon",0.01},
			{"", "hospital",0.1},
			{"militarybackpacks", "backpack",0.1},
			{"WeaponHolder_ItemTent","object",0.01},
			{"PartWoodPile","magazine",0.1},
			{"","generic",0.40}
		};
	};
	class Residential: Default {
		zombieChance = 0.3;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base", "z_hunter", "z_teacher", "z_villager1", "z_villager2", "z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"pistols", "cfglootweapon",0.3},
			{"assaultrifles", "cfglootweapon",0.2},
			{"ItemKnife", "generic",0.03},
			{"ItemMatchbox_DZE", "generic",0.2},
			{"", "generic",0.4},
			{"militarybackpacks", "backpack",0.4},
			{"tents", "single",0.4},
			{"", "military",0.4},
			{"PartPlywoodPack", "magazine",0.05},
			{"clothes", "single",0.4},
			{"specialclothes", "single",0.4},
			{"WeaponHolder_MeleeCrowbar", "object",0.2},
			{"sniperrifles", "cfglootweapon",0.07}
		};
		lootTypeSmall[] = {
			{"ItemSodaMdew", "magazine",0.01},
			{"ItemSodaRbull", "magazine",0.01},
			{"ItemSodaOrangeSherbet", "magazine",0.02},
			{"pistols", "cfglootweapon",0.12},
			{"ItemKnife", "weapon",0.01},
			{"ItemMatchbox_DZE", "weapon",0.03},
			{"", "generic",0.38},
			{"", "military",0.05},
			{"clothes", "single",0.03},
			{"specialclothes", "single",0.03},
			{"ItemDocument", "magazine",0.05}
		};
	};

	class Office: Default {
		maxRoaming = 3;
		zombieClass[] = {"z_suit1", "z_suit2"};
		zombieChance = 0.3;
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"pistols", "cfglootweapon",0.11},
			{"ItemKnife", "generic",0.04},
			{"ItemMatchbox_DZE", "generic",0.01},
			{"", "generic",0.4},
			{"assaultrifles", "cfglootweapon",0.05},
			{"militarybackpacks", "backpack",0.04},
			{"tents", "single",0.01},
			{"", "military",0.05},
			{"PartPlywoodPack", "magazine",0.01},
			{"clothes", "single",0.01},
			{"specialclothes", "single",0.03},
			{"WeaponHolder_MeleeCrowbar", "object",0.03}
		};
		lootTypeSmall[] = {
			{"ItemSodaMdew", "magazine",0.01},
			{"ItemSodaRbull", "magazine",0.01},
			{"ItemSodaOrangeSherbet", "magazine",0.02},
			{"pistols", "cfglootweapon",0.15},
			{"", "generic",0.31},
			{"", "military",0.05},
			{"clothes", "single",0.16},
			{"specialclothes", "single",0.02},
			{"ItemDocument", "magazine",0.05}
		};
	};

	class Industrial: Default {
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1", "z_worker2", "z_worker3"};
		maxRoaming = 2;
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemFuelBarrel", "magazine",0.03},
			{"", "generic",0.2},
			{"", "military",0.05},
			{"bulk_PartGeneric", "magazine",0.02},
			{"PartWheel", "magazine",0.05},
			{"PartFueltank", "magazine",0.01},
			{"PartEngine", "magazine",0.15},
			{"PartGlass", "magazine",0.07},
			{"PartVRotor", "magazine",0.01},
			{"ItemJerrycan", "magazine",0.05},
			{"WeaponHolder_ItemHatchet_DZE", "object",0.07},
			{"ItemToolbox", "weapon",0.06},
			{"ItemWire", "magazine",0.03},
			{"bulk_ItemTankTrap", "magazine",0.01},
			{"PartGeneric", "magazine",0.07},
			{"ItemTankTrap", "magazine",0.05},
			{"ItemKeyKit", "weapon",0.01},
			{"CinderBlocks", "magazine",0.12},
			{"MortarBucket", "magazine",0.03},
			{"metal_floor_kit", "magazine",0.02}
		};
		lootTypeSmall[] = {
			{"", "generic",0.5},
			{"", "military",0.14},
			{"itemPole", "magazine",0.04},
			{"ItemKnife", "weapon",0.07}
		};
	};

	class IndustrialFuel: Default {
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1", "z_worker2", "z_worker3"};
		maxRoaming = 2;
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemGenerator", "magazine",0.01},
			{"ItemFuelPump", "magazine",0.01},
			{"", "generic",0.25},
			{"", "military",0.07},
			{"bulk_PartGeneric", "magazine",0.07},
			{"PartWheel", "magazine",0.05},
			{"PartFueltank", "magazine",0.01},
			{"PartEngine", "magazine",0.15},
			{"PartGlass", "magazine",0.01},
			{"PartVRotor", "magazine",0.02},
			{"ItemJerrycan", "magazine",0.05},
			{"WeaponHolder_ItemHatchet_DZE", "object",0.07},
			{"ItemToolbox", "weapon",0.06},
			{"bulk_ItemWire", "magazine",0.01},
			{"bulk_ItemTankTrap", "magazine",0.03}
		};
		lootTypeSmall[] = {
			{"", "generic",0.5},
			{"", "military",0.14},
			{"ItemKnife", "weapon",0.05},
			{"ItemKeyKit", "weapon",0.01}
		};
	};

	class Farm: Default {
		zombieChance = 0.3;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base", "z_hunter", "z_hunter", "z_hunter", "z_villager1", "z_villager2", "z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemJerrycan", "magazine",0.05},
			{"", "generic",0.3},
			{"SniperRifles", "cfglootweapon",0.18},
			{"PartPlankPack", "magazine",0.03},
			{"WeaponHolder_ItemHatchet_DZE", "object",0.07},
			{"ItemFuelBarrel", "magazine",0.01},
			{"ItemFishingPole", "weapon",0.02},
			{"ItemSledgeHandle", "magazine",0.01},
			{"farmweapons", "cfglootweapon", 0.15}
		};
		lootTypeSmall[] = {
			{"", "generic",0.79},
			{"", "military",0.6},
			{"ItemSledgeHead", "magazine",0.4}
		};
	};

	class Supermarket: Default {
		lootChance = 0.8;
		minRoaming = 2;
		maxRoaming = 6;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base", "zZombie_Base", "z_teacher", "z_suit1", "z_suit2"};
		lootType[] = {
			{"pistols", "cfglootweapon",0.2},
			{"ItemKnife", "generic",0.03},
			{"ItemMatchbox_DZE", "generic",0.03},
			{"", "generic",0.25},
			{"AssaultRifles", "cfglootweapon",0.15},
			{"militarybackpacks", "backpack",0.2},
			{"tents", "single",0.1},
			{"", "food",0.3},
			{"PartPlywoodPack", "magazine",0.03}
		};
		lootTypeSmall[] = {
			{"ItemSodaMdew", "magazine",0.1},
			{"ItemSodaRbull", "magazine",0.01},
			{"ItemSodaOrangeSherbet", "magazine",0.03},
			{"pistols", "cfglootweapon",0.08},
			{"ItemMatchbox_DZE", "weapon",0.02},
			{"", "generic",0.21},
			{"", "food",0.24},
			{"", "trash",0.1},
			{"ItemMixOil", "magazine",0.02}
		};
	};

	class HeliCrash: Default {
		zombieChance = 0.8;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{"assaultrifles", "cfglootweapon",0.11},
			{"submachinegun", "cfglootweapon",0.04},
			{"sniperrifles", "cfglootweapon",0.07},
			{"machineguns", "cfglootweapon",0.06},
			{"", "military",0.3},
			{"", "medical",0.19},
			{"MedBox0", "object",0.05},
			{"AmmoBoxSmall_556", "object",0.03},
			{"AmmoBoxSmall_762", "object",0.03},
			{"militaryclothes", "single",0.05},
			{"militaryammo", "single",0.06}
		};
	};

	class HeliCrash_No50s: Default {
		zombieChance = 0.8;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
			{"assaultrifles", "cfglootweapon",0.1},
			{"submachinegun", "cfglootweapon",0.03},
			{"sniperrifles", "cfglootweapon",0.05},
			{"machineguns", "cfglootweapon",0.05},
			{"", "military",0.35},
			{"", "medical",0.19},
			{"MedBox0", "object",0.05},
			{"AmmoBoxSmall_556", "object",0.03},
			{"AmmoBoxSmall_762", "object",0.03},
			{"militaryclothes", "single",0.05},
			{"militaryammo", "single",0.06}
		};
	};

	class Hospital: Default {
		zombieChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_doctor", "z_doctor", "z_doctor"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"", "hospital",0.9},
			{"MedBox0", "object",0.4}
		};
		lootTypeSmall[] = {
			{"", "hospital",0.9}
		};
	};

	class Military: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier", "z_soldier_heavy", "z_policeman"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"pistols", "cfglootweapon", 0.2},
			{"assaultrifles", "cfglootweapon", 0.2},
			{"sniperrifles", "cfglootweapon", 0.2},
			{"RPG7V", "weapon", 0.05},
			{"PG7V", "single", 0.02},
			{"SMAW", "weapon", 0.04},
			{"SMAW_HEDP", "single", 0.01},
			{"ItemGPS", "weapon", 0.2},
			{"militarybackpacks", "backpack", 0.2},
			{"", "medical", 0.2},
			{"", "generic", 0.2},
			{"", "military", 0.2},
			{"ItemEtool", "weapon", 0.2},
			{"ItemSandbag", "magazine", 0.2},
			{"machineguns", "cfglootweapon", 0.2}
		};
		lootTypeSmall[] = {
			{"pistols", "cfglootweapon",0.15},
			{"ItemGPS", "weapon",0.02},
			{"", "medical",0.09},
			{"", "generic",0.34},
			{"", "military",0.26},
			{"ItemEtool", "weapon",0.01}
		};
	};

	class MilitaryIndustrial: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier", "z_soldier_heavy", "z_policeman", "z_soldier", "z_soldier_heavy", "z_policeman", "z_worker1", "z_worker2", "z_worker3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"pistols", "cfglootweapon", 0.6},
			{"assaultrifles", "cfglootweapon", 0.6},
			{"bulk_PartGeneric", "magazine", 0.1},
			{"sniperrifles", "cfglootweapon", 0.6},
			{"PartWheel","magazine",0.1},
			{"ItemGPS", "weapon", 0.1},
			{"PartVRotor", "magazine", 0.05},
			{"militarybackpacks", "backpack", 0.3},
			{"", "medical", 0.6},
			{"", "generic", 0.6},
			{"", "military", 0.6},
			{"ItemEtool", "weapon", 0.1},
			{"bulk_ItemSandbag", "magazine", 0.1},
			{"ItemFuelBarrel", "magazine", 0.1},
			{"machineguns", "cfglootweapon", 0.6}
		};
		lootTypeSmall[] = {
			{"pistols", "cfglootweapon", 0.6},
			{"ItemGPS", "weapon", 0.1},
			{"", "medical", 0.6},
			{"", "generic", 0.6},
			{"", "military", 0.6},
			{"ItemEtool", "weapon", 0.1}
		};
	};
	class IndustrialMilitary: Default {
		zombieChance = 0.4;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_soldier","z_soldier_heavy","z_policeman","z_worker1","z_worker2","z_worker3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"pistols", "cfglootweapon", 0.02},
			{"assaultrifles", "cfglootweapon", 0.07},
			{"bulk_PartGeneric", "magazine", 0.01},
			{"PartGeneric", "magazine", 0.05},
			{"sniperrifles", "cfglootweapon", 0.05},
			{"PartWheel","magazine",0.02},
			{"ItemGPS","weapon",0.01},
			{"PartVRotor","magazine",0.01},
			{"PartFueltank","magazine",0.01},
			{"PartEngine","magazine",0.08},
			{"PartGlass","magazine",0.05},
			{"militarybackpacks","backpack",0.03},
			{"","medical",0.05},
			{"","generic",0.25},
			{"","military",0.07},
			{"ItemEtool","weapon",0.02},
			{"ItemSandbag","magazine",0.02},
			{"ItemFuelBarrel","magazine",0.03},
			{"machineguns", "cfglootweapon", 0.01}
		};
		lootTypeSmall[] = {
			{ "pistols", "cfglootweapon", 0.14 },
			{ "ItemGPS", "weapon", 0.02 },
			{ "", "medical", 0.12 },
			{ "", "generic", 0.22 },
			{ "", "military", 0.35 },
			{ "ItemEtool", "weapon", 0.02 }
		};
	};	
	class MilitarySpecial: Default {
		zombieChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"assaultrifles", "cfglootweapon", 0.6},
			{"machineguns", "cfglootweapon", 0.6},
			{"pistols", "cfglootweapon", 0.6},
			{"sniperrifles", "cfglootweapon", 0.6},
			{"Stinger", "weapon", 0.01},
			{"Stinger", "single", 0.01},
			{"M47Launcher_EP1", "weapon", 0.01},
			{"Dragon_EP1", "single", 0.01},
			{"RPG7V", "weapon", 0.1},
			{"PG7V", "single", 0.06},
			{"SMAW", "weapon", 0.05},
			{"SMAW_HEDP", "single", 0.02},
			{"AmmoBoxSmall_556", "object", 0.1},
			{"AmmoBoxSmall_762", "object", 0.1},
			{"ItemGPS", "weapon", 0.1},
			{"Binocular_Vector", "military", 0.2},
			{"militarybackpacks", "backpack", 0.6},
			{"", "medical", 0.3},
			{"", "generic", 0.3},
			{"", "military", 0.6},
			{"machinegunammo", "single", 0.01},
			{"militaryclothes", "single", 0.01},
			{"militaryammo", "single", 0.05}
		};
		lootTypeSmall[] = {
			{"pistols", "cfglootweapon", 0.6},
			{"AmmoBoxSmall_556", "object", 0.1},
			{"AmmoBoxSmall_762", "object", 0.1},
			{"ItemGPS", "weapon", 0.1},
			{"Binocular_Vector", "weapon", 0.2},
			{"", "medical", 0.6},
			{"", "generic", 0.6},
			{"", "military", 0.6},
			{"machinegunammo", "single", 0.6},
			{"militaryclothes", "single", 0.6},
			{"29Rnd_30mm_AGS30", "magazine", 0.05},
			{"50Rnd_127x107_DSHKM", "magazine", 0.05},
			{"48Rnd_40mm_MK19", "magazine", 0.05},
			{"100Rnd_127x99_M2", "magazine", 0.05},
			{"machinegunammo", "single", 0.6}
		};
	};

	class Hunting: Default {
		zombieChance = 0.4;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_hunter", "z_hunter", "z_hunter"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemMatchbox_DZE", "generic",0.03},
			{"farmweapons", "cfglootweapon",0.03},
			{"", "military",0.38},
			{"", "hunter",0.5}
		};
		lootTypeSmall[] = {
			{"ItemKnife", "weapon",0.01},
			{"ItemMatchbox_DZE", "weapon",0.01},
			{"", "military",0.4},
			{"", "hunter",0.5}
		};
	};
	class DynamicDebris: Default
	{
		lootChance = 0.4;
		minRoaming = 0;
		maxRoaming = 2;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
		lootType[] = {
			{ "", "generic", 0.17 },
			{ "", "food", 0.06 },
			{ "PartGeneric", "magazine", 0.07 },
			{ "PartWheel", "magazine", 0.01 },
			{ "PartFueltank", "magazine", 0.01 },
			{ "PartEngine", "magazine", 0.15 },
			{ "PartGlass", "magazine", 0.01 },
			{ "WeaponHolder_ItemJerrycan", "object", 0.05 }
		};
	};
	class DynamicDebrisMilitary: Default
	{
		lootChance = 0.4;
		minRoaming = 0;
		maxRoaming = 2;
		zombieChance = 0.3;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootType[] = {
			{ "ItemEtool", "weapon", 0.05 },
			{ "ItemSandbag", "magazine", 0.1 },
			{ "", "military", 0.08 },
			{ "ItemToolbox", "weapon", 0.02 },
			{ "", "generic", 0.15 },
			{ "", "food", 0.05 },
			{ "bulk_PartGeneric", "magazine", 0.06 },
			{ "PartWheel", "magazine", 0.05 },
			{ "PartFueltank", "magazine", 0.01 },
			{ "PartEngine", "magazine", 0.15 },
			{ "PartGlass", "magazine", 0.01 },
			{ "PartVRotor", "magazine", 0.02 },
			{ "WeaponHolder_ItemJerrycan", "object", 0.03 }
		};
	};
	class SupplyDrop: Default {
		zombieChance = 1;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{ "PartPlywoodPack", "magazine", 0.1 },
			{ "PartPlankPack", "magazine", 0.2 },
			{ "CinderBlocks", "magazine", 0.1 },
			{ "MortarBucket", "magazine", 0.1 },
			{ "bulk_PartGeneric", "magazine", 0.2 },
			{ "bulk_ItemSandbag", "magazine", 0.1 },
			{ "bulk_ItemTankTrap", "magazine", 0.1 },
			{ "ItemSledge", "weapon", 0.1 }
		};
	};
	class MassGrave: Default {
		zombieChance = 1;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_doctor","z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{ "M16A2", "weapon", 0.03 },
			{ "M16A2GL", "weapon", 0.01 },
			{ "M249_EP1_DZ", "weapon", 0.01 },
			{ "M9SD", "weapon", 0.02 },
			{ "Pecheneg_DZ", "weapon", 0.02 },
			{ "PK_DZ", "weapon", 0.01 },
			{ "AK_74", "weapon", 0.02 },
			{ "M4A1_Aim", "weapon", 0.01 },
			{ "AKS_74_kobra", "weapon", 0.01 },
			{ "AKS_74_U", "weapon", 0.02 },
			{ "AK_47_M", "weapon", 0.02 },
			{ "M24", "weapon", 0.01 },
			{ "SVD_CAMO", "weapon", 0.01 },
			{ "M1014", "weapon", 0.02 },
			{ "BAF_LRR_scoped", "weapon", 0.01 },
			{ "M4SPR", "weapon", 0.01 },
			{ "M4A1", "weapon", 0.01 },
			{ "M14_EP1", "weapon", 0.02 },
			{ "UZI_EP1", "weapon", 0.03 },
			{ "Remington870_lamp", "weapon", 0.01 },
			{ "glock17_EP1", "weapon", 0.02 },
			{ "M240_DZ", "weapon", 0.02 },
			{ "M4A1_AIM_SD_camo", "weapon", 0.01 },
			{ "M16A4_ACG", "weapon", 0.01 },
			{ "M4A1_HWS_GL_camo", "weapon", 0.01 },
			{ "Mk_48_DZ", "weapon", 0.01 },
			{ "M4A3_CCO_EP1", "weapon", 0.01 },
			{ "AmmoBoxSmall_556", "object", 0.03 },
			{ "AmmoBoxSmall_762", "object", 0.03 },
			{ "Binocular", "weapon", 0.01 },
			{ "ItemFlashlightRed", "military", 0.02 },
			{ "ItemKnife", "military", 0.01 },
			{ "ItemGPS", "weapon", 0.01 },
			{ "ItemMap", "military", 0.01 },
			{ "Binocular_Vector", "military", 0.01 },
			{ "DZ_ALICE_Pack_EP1", "object", 0.03 },
			{ "DZ_TK_Assault_Pack_EP1", "object", 0.02 },
			{ "DZ_British_ACU", "object", 0.02 },
			{ "DZ_CivilBackpack_EP1", "object", 0.02 },
			{ "DZ_Backpack_EP1", "object", 0.01 },
			{ "DZ_LargeGunBag_EP1", "object", 0.01 },
			{ "", "medical", 0.05 },
			{ "", "generic", 0.05 },
			{ "", "military", 0.13 },
			{ "PipeBomb", "magazine", 0.01 },
			{ "Sa58V_RCO_EP1", "weapon", 0.01 },
			{ "Sa58V_CCO_EP1", "weapon", 0.01 },
			{ "G36_C_SD_camo", "weapon", 0.01 },
			{ "M40A3", "weapon", 0.01 },
			{ "100Rnd_762x54_PK", "magazine", 0.01 },
			{ "", "militaryclothes", 0.05 },
			{ "WeaponHolder_ItemMachete", "object", 0.02 },
			{ "SCAR_H_LNG_Sniper_SD", "weapon", 0.01 },
			{ "2000Rnd_762x51_M134", "magazine", 0.01 },
			{ "KSVK_DZE", "weapon", 0.01 },
			{ "m240_scoped_EP1_DZE", "weapon", 0.01 }
		};
	};
	#include "CfgBuildingPos.hpp"
};
