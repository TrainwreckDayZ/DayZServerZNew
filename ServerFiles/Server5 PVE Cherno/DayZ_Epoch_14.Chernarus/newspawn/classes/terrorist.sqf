private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["AKS_74_Kobra","ItemMap","ItemToolbox","ItemCompass","Binocular","Sa61_EP1"],
		[["30Rnd_545x39_AK",2],["ItemBandage",3],["20Rnd_B_765x17_Ball",3],["ItemMorphine",2],"FoodCanBakedBeans","ItemSodaPepsi","HandGrenade_East","ItemPainkiller","ItemBloodBag"]
	];
	dayz_myBackpack = "DZ_GunBag_EP1";
	[dayz_playerUID,dayz_characterID,'TK_INS_Soldier_EP1_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["UAZ_MG_TK_EP1_DZ", _pos, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["Sarge",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	_object setVehicleLock "UNLOCKED";
	titleText ["Class selected! Note: Car will not save after restart.", "PLAIN DOWN", 5];
	titleFadeOut 1;
};
