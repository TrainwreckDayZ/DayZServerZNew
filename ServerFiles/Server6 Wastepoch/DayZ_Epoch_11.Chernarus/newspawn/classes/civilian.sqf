private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["m8_Compact","ItemMap","ItemToolbox","ItemCompass","Binocular","ItemMatchbox_DZE","glock17_EP1"],
		[["30Rnd_556x45_Stanag",2],["ItemBandage",3],["17Rnd_9x19_glock17",2],["ItemMorphine",2],"ItemPainkiller","ItemBloodBag","FoodCanBakedBeans","ItemSodaPepsi"]
	];
	dayz_myBackpack = "DZ_British_ACU";
	[dayz_playerUID,dayz_characterID,'Bandit1_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["SUV_Pink", _pos, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["Sarge",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	titleText ["Class selected! Note: Car will not save after restart.", "PLAIN DOWN", 5];
	titleFadeOut 1;
};