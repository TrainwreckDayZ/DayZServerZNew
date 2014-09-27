private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["Sa58V_CCO_EP1","ItemMap","ItemToolbox","ItemCompass","Binocular","Makarov"],
		[["30Rnd_762x39_SA58",2],["ItemBandage",2],["8Rnd_9x18_Makarov",2],"ItemMorphine","ItemWaterbottle","FoodMRE","ItemPainkiller","ItemEpinephrine"]
	];
	dayz_myBackpack = "DZ_CivilBackpack_EP1";
	[dayz_playerUID,dayz_characterID,'CZ_Special_Forces_GL_DES_EP1_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["LandRover_Special_CZ_EP1_DZ", _pos, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["Sarge",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	_object setVehicleLock "UNLOCKED";
	_Unlock = player addAction ["Unlock Spawn Vehicle", "\z\addons\dayz_code\actions\unlock_veh.sqf", _object];
	titleText ["Class selected! Note: Car will not save after restart.", "PLAIN DOWN", 5];
	titleFadeOut 1;
};