class CfgSurvival {
	class Inventory {
		class Default {
			magazines[] = {"ItemBandage", "ItemPainkiller"};
			weapons[] = {"ItemFlashlight"};
			backpackWeapon = "";
			backpack = "DZ_Patrol_Pack_EP1";
		};
	};
	
	class Meat {
		class Default {
			yield = 2;
			rawfoodtype = "FoodmeatRaw";
		};
		
		class Cow : Default {
			yield = 6;
			rawfoodtype = "FoodbeefRaw";
		};
		
		class Cow01 : Cow {};
		
		class Cow02 : Cow {};
		
		class Cow03 : Cow {};
		
		class Cow04 : Cow {};
		
		class Cow01_EP1 : Cow {};
		
		class Goat : Default {
			yield = 4;
			rawfoodtype = "FoodmuttonRaw";
		};
		
		class Goat01_EP1 : Goat {};
		
		class Goat02_EP1 : Goat {};
		
		class Sheep : Default {
			yield = 4;
			rawfoodtype = "FoodmuttonRaw";
		};
		
		class Sheep01_EP1 : Sheep {};
		
		class Sheep02_EP1 : Sheep {};
		
		class WildBoar : Default {
			yield = 4;
			rawfoodtype = "FoodbaconRaw";
		};
		
		class Hen : Default {
			yield = 2;
			rawfoodtype = "FoodchickenRaw";
		};
		
		class Cock : Hen {};
		
		class DZ_Fin : Default {
			yield = 0;
			rawfoodtype = "FoodSteakRaw";
		};
		
		class DZ_Pastor : DZ_Fin {};
		
		class Rabbit : Default {
			yield = 1;
			rawfoodtype = "FoodrabbitRaw";
		};
	};
	
	class Skins {
		class Default {
			sex = "male";
			playerModel = "Survivor2_DZ";
		};
		
		class Skin_Survivor2_DZ : Default {
			sex = "male";
			playerModel = "Survivor2_DZ";
		};
		
		class Skin_Sniper1_DZ : Default {
			sex = "male";
			playerModel = "Sniper1_DZ";
		};
		
		class Skin_Camo1_DZ : Default {
			sex = "male";
			playerModel = "Camo1_DZ";
		};
		
		class Skin_Rocket_DZ : Default {
			sex = "male";
			playerModel = "Rocket_DZ";
		};
		
		class Skin_Soldier1_DZ : Default {
			sex = "male";
			playerModel = "Soldier1_DZ";
		};
		
		class Skin_RU_Policeman_DZ : Default {
			sex = "male";
			playerModel = "RU_Policeman_DZ";
		};
		
		class Skin_Pilot_EP1_DZ : Default {
			sex = "male";
			playerModel = "Pilot_EP1_DZ";
		};
		
		class Skin_Haris_Press_EP1_DZ : Default {
			sex = "male";
			playerModel = "Haris_Press_EP1_DZ";
		};
		
		class Skin_Ins_Soldier_GL_DZ : Default {
			sex = "male";
			playerModel = "Ins_Soldier_GL_DZ";
		};
		
		class Skin_GUE_Commander_DZ : Default {
			sex = "male";
			playerModel = "GUE_Commander_DZ";
		};
		
		class Skin_Functionary1_EP1_DZ : Default {
			sex = "male";
			playerModel = "Functionary1_EP1_DZ";
		};
		
		class Skin_Priest_DZ : Default {
			sex = "male";
			playerModel = "Priest_DZ";
		};
		
		class Skin_Rocker1_DZ : Default {
			sex = "male";
			playerModel = "Rocker1_DZ";
		};
		
		class Skin_Rocker2_DZ : Default {
			sex = "male";
			playerModel = "Rocker2_DZ";
		};
		
		class Skin_Rocker3_DZ : Default {
			sex = "male";
			playerModel = "Rocker3_DZ";
		};
		
		class Skin_Rocker4_DZ : Default {
			sex = "male";
			playerModel = "Rocker4_DZ";
		};
		
		class Skin_Bandit1_DZ : Default {
			sex = "male";
			playerModel = "Bandit1_DZ";
		};
		
		class Skin_Bandit2_DZ : Default {
			sex = "male";
			playerModel = "Bandit2_DZ";
		};
		
		class Skin_GUE_Soldier_MG_DZ : Default {
			sex = "male";
			playerModel = "GUE_Soldier_MG_DZ";
		};
		
		class Skin_GUE_Soldier_Sniper_DZ : Default {
			sex = "male";
			playerModel = "GUE_Soldier_Sniper_DZ";
		};
		
		class Skin_GUE_Soldier_Crew_DZ : Default {
			sex = "male";
			playerModel = "GUE_Soldier_Crew_DZ";
		};
		
		class Skin_GUE_Soldier_CO_DZ : Default {
			sex = "male";
			playerModel = "GUE_Soldier_CO_DZ";
		};
		
		class Skin_GUE_Soldier_2_DZ : Default {
			sex = "male";
			playerModel = "GUE_Soldier_2_DZ";
		};
		
		class Skin_BanditW1_DZ : Default {
			sex = "female";
			playerModel = "BanditW1_DZ";
		};
		
		class Skin_BanditW2_DZ : Default {
			sex = "female";
			playerModel = "BanditW2_DZ";
		};
		
		class Skin_SurvivorW2_DZ : Default {
			sex = "female";
			playerModel = "SurvivorW2_DZ";
		};
		
		class Skin_SurvivorWpink_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWpink_DZ";
		};
		
		class Skin_SurvivorWsequisha_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWsequisha_DZ";
		};
		
		class Skin_SurvivorWsequishaD_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWsequishaD_DZ";
		};
		
		class Skin_SurvivorWcombat_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWcombat_DZ";
		};
		
		class Skin_SurvivorWdesert_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWdesert_DZ";
		};
		
		class Skin_SurvivorWurban_DZ : Default {
			sex = "female";
			playerModel = "SurvivorWurban_DZ";
		};
		
		class Skin_SurvivorW3_DZ : Default {
			sex = "female";
			playerModel = "SurvivorW3_DZ";
		};
		
		class Skin_Soldier_TL_PMC_DZ : Default {
			sex = "male";
			playerModel = "Soldier_TL_PMC_DZ";
		};
		
		class Skin_Soldier_Sniper_PMC_DZ : Default {
			sex = "male";
			playerModel = "Soldier_Sniper_PMC_DZ";
		};
		
		class Skin_Soldier_Bodyguard_AA12_PMC_DZ : Default {
			sex = "male";
			playerModel = "Soldier_Bodyguard_AA12_PMC_DZ";
		};
		
		class Skin_FR_OHara_DZ : Default {
			sex = "male";
			playerModel = "FR_OHara_DZ";
		};
		
		class Skin_FR_Rodriguez_DZ : Default {
			sex = "male";
			playerModel = "FR_Rodriguez_DZ";
		};
		
		class Skin_CZ_Soldier_Sniper_EP1_DZ : Default {
			sex = "male";
			playerModel = "CZ_Soldier_Sniper_EP1_DZ";
		};
		
		class Skin_Graves_Light_DZ : Default {
			sex = "male";
			playerModel = "Graves_Light_DZ";
		};
		
		class Skin_Drake_Light_DZ : Default {
			sex = "male";
			playerModel = "Drake_Light_DZ";
		};
		
		class Skin_CZ_Special_Forces_GL_DES_EP1_DZ : Default {
			sex = "male";
			playerModel = "CZ_Special_Forces_GL_DES_EP1_DZ";
		};
		
		class Skin_TK_INS_Soldier_EP1_DZ : Default {
			sex = "male";
			playerModel = "TK_INS_Soldier_EP1_DZ";
		};
		
		class Skin_TK_INS_Warlord_EP1_DZ : Default {
			sex = "male";
			playerModel = "TK_INS_Warlord_EP1_DZ";
		};
		
		class Skin_TK_Special_Forces_MG_EP1_DZ : Default {
			sex = "male";
			playerModel = "TK_Special_Forces_MG_EP1_DZ";
		};
		
		class Skin_TK_Soldier_Sniper_EP1_DZ : Default {
			sex = "male";
			playerModel = "TK_Soldier_Sniper_EP1_DZ";
		};
		
		class Skin_TK_Commander_EP1_DZ : Default {
			sex = "male";
			playerModel = "TK_Commander_EP1_DZ";
		};
		
		class Skin_RU_Soldier_Crew_DZ : Default {
			sex = "male";
			playerModel = "RU_Soldier_Crew_DZ";
		};
		
		class Skin_INS_Lopotev_DZ : Default {
			sex = "male";
			playerModel = "INS_Lopotev_DZ";
		};
		
		class Skin_INS_Soldier_AR_DZ : Default {
			sex = "male";
			playerModel = "INS_Soldier_AR_DZ";
		};
		
		class Skin_INS_Soldier_CO_DZ : Default {
			sex = "male";
			playerModel = "INS_Soldier_CO_DZ";
		};
		
		class Skin_INS_Bardak_DZ : Default {
			sex = "male";
			playerModel = "INS_Bardak_DZ";
		};
		
		class Skin_INS_Worker2_DZ : Default {
			sex = "male";
			playerModel = "INS_Worker2_DZ";
		};
		
		class Skin_CamoWinter_DZN : Default {
			sex = "male";
			playerModel = "CamoWinter_DZN";
		};
		
		class Skin_CamoWinterW_DZN : Default {
			sex = "male";
			playerModel = "CamoWinterW_DZN";
		};
		
		class Skin_Sniper1W_DZN : Default {
			sex = "male";
			playerModel = "Sniper1W_DZN";
		};
	};
};