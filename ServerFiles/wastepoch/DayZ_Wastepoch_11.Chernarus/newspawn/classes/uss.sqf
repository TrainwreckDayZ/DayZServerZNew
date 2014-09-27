private ["_object","_uniqueid"];

if (dayz_combat == 1) then {
	titleText ["You can't select a class while in combat.", "PLAIN DOWN", 5];
	titleFadeOut 1;
} else {
	titleText ["Selecting class...", "PLAIN DOWN", 5];
	_gear = [
		["m16a4","ItemMap","ItemToolbox","ItemCompass","Binocular","M9"],
		[["30Rnd_556x45_Stanag",2],["ItemBandage",2],["15Rnd_9x19_M9",2],"ItemPainkiller","FoodMRE","ItemWaterbottle","ItemMorphine"]
	];
	dayz_myBackpack = "DZ_CompactPack_EP1";
	[dayz_playerUID,dayz_characterID,'FR_Rodriguez_DZ',_gear] spawn player_humanityMorphCustom;
	spawnPointChosen = true;
	showCommandingMenu '';
	_pos = ([player] call FNC_GetPos);
	_pos set [1, ((_pos select 1) + 6)];
	_object = createVehicle ["HMMWV_M998A2_SOV_DES_EP1_DZ", _pos, [], 0, "CAN_COLLIDE"];
	_object setVelocity [0, 0, 0];
	_object setVariable ["Sarge",1,true];
	_uniqueid = str(round(random 999999));
	_object setVariable ["ObjectID", _uniqueid, true];
	_object setVariable ["ObjectUID", _uniqueid, true];
	clearMagazineCargo _object;
	clearWeaponCargo _object;
	if(locked _cursorTarget) then {
		player addAction "Unlock Spawn Vehicle", "\z\addons\dayz_code\actions\unlock_veh.sqf",_cursorTarget];}
	titleText ["Class selected! Note: Car will not save after restart.", "PLAIN DOWN", 5];
	titleFadeOut 1;
};
