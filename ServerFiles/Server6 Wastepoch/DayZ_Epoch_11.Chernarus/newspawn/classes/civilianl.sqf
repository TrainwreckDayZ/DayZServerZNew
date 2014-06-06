private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["MP5SD","ItemMap","ItemToolbox","ItemCompass","Binocular","ItemMatchbox_DZE","Makarov"],
		[["30Rnd_9x19_MP5SD",2],["ItemBandage",4],["8Rnd_9x18_Makarov",2],["ItemMorphine",2],["ItemBloodBag",2],["FoodCanBakedBeans",2],["ItemSodaPepsi",2],"ItemPainkiller","ItemEpinephrine"]
	];
	dayz_myBackpack = "DZ_GunBag_EP1";
	[dayz_playerUID,dayz_characterID,'SurvivorWurban_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["S1203_ambulance_EP1", _pos, [], 0, "CAN_COLLIDE"];
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