/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["Bandit1_DZ","BanditW1_DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.25,0.25],
	["aimingShake",0.95,0.95],
	["aimingSpeed",0.90,0.90],
	["endurance",0.90,0.90],
	["spotDistance",0.85,0.85],
	["spotTime",0.85,0.85],
	["courage",1.00,1.00],
	["reloadSpeed",0.90,0.90],
	["commanding",0.90,0.90],
	["general",1.00,1.00]
];

DZMSSkills1 = [
	["aimingAccuracy",0.25,0.25],
	["aimingShake",0.95,0.95],
	["aimingSpeed",0.90,0.90],
	["endurance",0.90,0.90],
	["spotDistance",0.85,0.85],
	["spotTime",0.85,0.85],
	["courage",1.00,1.00],
	["reloadSpeed",0.90,0.90],
	["commanding",0.90,0.90],
	["general",1.00,1.00]
];

DZMSSkills2 = [
	["aimingAccuracy",0.25,0.25],
	["aimingShake",0.95,0.95],
	["aimingSpeed",0.90,0.90],
	["endurance",0.90,0.90],
	["spotDistance",0.85,0.85],
	["spotTime",0.85,0.85],
	["courage",1.00,1.00],
	["reloadSpeed",0.90,0.90],
	["commanding",0.90,0.90],
	["general",1.00,1.00]
];

DZMSSkills3 = [	
	["aimingAccuracy",0.25,0.25],
	["aimingShake",0.95,0.95],
	["aimingSpeed",0.90,0.90],
	["endurance",0.90,0.90],
	["spotDistance",0.85,0.85],
	["spotTime",0.85,0.85],
	["courage",1.00,1.00],
	["reloadSpeed",0.90,0.90],
	["commanding",0.90,0.90],
	["general",1.00,1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"BAF_LRR_scoped_W",
"M110_NVG_EP1",
"SCAR_H_CQC_CCO",
"SCAR_H_STD_EGLM_Spect",
"Sa58V_RCO_EP1",
"M14_EP1",
"VSS_vintorez",
"DMR_DZ",
"KSVK_DZE"
];

DZMSWeps1 = [
"FN_FAL",
"FN_FAL_ANPVS4",
"Mk_48_DZ",
"M249_m145_EP1_DZE",
"M240_scoped_EP1_DZE",
"BAF_LRR_scoped_W",
"M110_NVG_EP1",
"SCAR_H_CQC_CCO",
"SCAR_H_STD_EGLM_Spect",
"Pecheneg_DZ",
"Sa58V_RCO_EP1",
"M14_EP1",
"VSS_vintorez",
"DMR_DZ",
"KSVK_DZE"
];

DZMSWeps2 = [
"BAF_L85A2_UGL_ACOG",
"SCAR_L_STD_EGLM_RCO",
"M16A4_acg_GL",
"SCAR_H_STD_EGLM_Spect"
];

DZMSWeps3 = [
"M249_m145_EP1_DZE",
"M240_scoped_EP1_DZE",
"Pecheneg_DZ"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller","FoodmuttonCooked","ItemSodaCoke","ItemBloodbag","ItemMorphine"],
["ItemKnife","Binocular_Vector"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemPainkiller","FoodmuttonCooked","ItemSodaCoke","HandGrenade_west"],
["ItemKnife"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller","FoodmuttonCooked","ItemSodaCoke","Mine","1rnd_HE_M203","1rnd_HE_M203"],
["ItemKnife"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller","FoodmuttonCooked","ItemSodaCoke","ItemGoldBar10oz","Mine"],
["ItemKnife"]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemPainkiller","FoodmuttonCooked","ItemSodaCoke","PipeBomb"],
["ItemKnife"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_LargeGunBag_EP1",
"DZ_GunBag_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1"
];
