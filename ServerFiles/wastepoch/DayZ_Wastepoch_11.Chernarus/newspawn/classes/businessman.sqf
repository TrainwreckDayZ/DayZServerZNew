private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["AKS_GOLD","ItemMap","ItemToolbox","ItemCompass","Binocular","ItemCrowbar","glock17_EP1"],
		[["30Rnd_762x39_AK47",3],["ItemBandage",3],["17Rnd_9x19_glock17",2],["ItemMorphine",2],"ItemPainkiller","ItemBloodBag","ItemSodaOrangeSherbet","FoodCanBakedBeans","ItemWaterbottle"]
	];
	dayz_myBackpack = "DZ_Backpack_EP1";
	[dayz_playerUID,dayz_characterID,'Functionary1_EP1_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["Offroad_DSHKM_Gue_DZ", _pos, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["Sarge",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	_object setVehicleLock "UNLOCKED";
	PVDZE_veh_Lock = [_vehicle,false];
	if (local _vehicle) then {
		PVDZE_veh_Lock spawn local_lockUnlock
	} else {
		publicVariable "PVDZE_veh_Lock";
	};
	titleText ["Class selected! Note: Car will not save after restart.", "PLAIN DOWN", 3];
	titleFadeOut 1;
};
