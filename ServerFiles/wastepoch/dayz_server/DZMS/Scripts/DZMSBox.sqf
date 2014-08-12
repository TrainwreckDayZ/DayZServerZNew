_crate = _this select 0;
_type = _this select 1;

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

_bpackList = ["DZ_LargeGunbag_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
_gshellList = ["HandGrenade_west","1rnd_HE_M203"];
_medical = ["ItemBandage","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodMRE","ItemAntibiotic","ItemBloodbag"];
_money = ["ItemBriefcase100oz","ItemRuby","ItemBriefcase30oz","ItemBriefcase50oz","ItemBriefcase80oz","ItemGoldBar10oz","ItemBriefcase60oz","ItemBriefcase70oz"];
_money = ["ItemBriefcase100oz","ItemRuby","ItemBriefcase30oz","ItemBriefcase50oz","ItemBriefcase80oz"];

if (_type == "medical") then {
	// load medical
	_scount = count _medical;
	for "_x" from 0 to 40 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
};

if (_type == "weapons") then {
	_scount = count _gshellList;
	for "_x" from 0 to 4 do {
		_sSelect = floor(random _sCount);
		_item = _gshellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
   
	_scount = count _bpackList;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _bpackList select _sSelect;
		_crate addBackpackCargoGlobal [_item,1];
	};
	// load packs
//	_scount = count _bpackList;
//	for "_x" from 0 to 5 do {
//		_sSelect = floor(random _sCount);
//		_item = _bpackList select _sSelect;
//		_crate addBackpackCargoGlobal [_item,1];
//	};
	 
	_scount = count DZMSpistolList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = DZMSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	_scount = count DZMSsniperList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = DZMSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	_scount = count DZMSmgList;
	for "_x" from 0 to 4 do {
		_sSelect = floor(random _sCount);
		_item = DZMSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	_scount = count DZMSprimaryList;
	for "_x" from 0 to 9 do {
		_sSelect = floor(random _sCount);
		_item = DZMSprimaryList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};
};

if (_type == "supply") then {
	_scount = count DZMSConTools;
	for "_x" from 0 to 4 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConTools select _sSelect;
		_crate addWeaponCargoGlobal [_item, 1];
	};
	
	_scount = count DZMSConSupply;
	for "_x" from 0 to 39 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConSupply select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};

if (_type == "money") then {
	_scount = count _money;
	for "_x" from 0 to 3 do {
		_sSelect = floor(random _sCount);
		_item = _money select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};