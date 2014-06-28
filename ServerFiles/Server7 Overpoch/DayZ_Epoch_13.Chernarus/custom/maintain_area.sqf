//Code developed by Axe Cop - Massiv improvments and performance tunes by Skaronator
private ["_missing","_missingQty","_proceed","_itemIn","_countIn","_qty","_num_removed","_uniqueID","_removed","_removed_total","_tobe_removed_total","_obj","_objectID","_objectUID","_classname","_location","_dir","_objectCharacterID","_object","_temp_removed_array","_textMissing","_target","_objectClasses","_range","_objects","_requirements","_count","_cost","_itemText","_option"];

if (DZE_ActionInProgress) exitWith { cutText [(localize "STR_EPOCH_ACTIONS_2") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;


player removeAction s_player_maintain_aread;
s_player_maintain_aread = 1;
player removeAction s_player_maintain_area_previewd;
s_player_maintain_area_previewd = 1;

_target = cursorTarget; // Plastic_Pole_EP1_DZ

_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange; // set the max range for the maintain area
_objects = nearestObjects [_target, _objectClasses, _range];

//filter to only those that have 10% damage
_objects_filtered = [];
{
    if (damage _x >= DZE_DamageBeforeMaint) then {
        _objects_filtered set [count _objects_filtered, _x];
   };
} forEach _objects;
_objects = _objects_filtered;

// TODO dynamic requirements based on used building parts?
_count = count _objects;

if (_count == 0) exitWith {
	cutText [format[(localize "STR_EPOCH_ACTIONS_22"), _count], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
	s_player_maintain_aread = -1;
	s_player_maintain_area_previewd = -1;
};

_requirements = [];
switch true do {
};




_option = _this select 3;
switch _option do {
	case "maintain": {
		
		_missing = "";
		_missingQty = 0;
		_proceed = true;
		{
			_itemIn = _x select 0;
			_countIn = _x select 1;
			_qty = { (_x == _itemIn) || (configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _itemIn) } count magazines player;
			if (_qty < _countIn) exitWith { _missing = _itemIn; _missingQty = (_countIn - _qty); _proceed = false; };
		} forEach _requirements;

		if (_proceed) then {
			player playActionNow "Medic";
			[player,_range,true,(getPosATL player)] spawn player_alertZombies;

			_temp_removed_array = [];
			_removed_total = 0;
			_tobe_removed_total = 0;
			
			{
				_removed = 0;
				_itemIn = _x select 0;
				_countIn = _x select 1;
				_tobe_removed_total = _tobe_removed_total + _countIn;
				
				{					
					if ((_removed < _countIn) && ((_x == _itemIn) || configName(inheritsFrom(configFile >> "cfgMagazines" >> _x)) == _itemIn)) then {
						_num_removed = ([player,_x] call BIS_fnc_invRemove);
						_removed = _removed + _num_removed;
						_removed_total = _removed_total + _num_removed;
						if (_num_removed >= 1) then {
							_temp_removed_array set [count _temp_removed_array,_x];
						};
					};
				} forEach magazines player;
			} forEach _requirements;

			// all required items removed from player gear
			if (_tobe_removed_total == _removed_total) then {
				cutText [format["%1 building parts in range, Thank you for Donating! Maintenance is free!", _count, _cost], "PLAIN DOWN"];








































				PVDZE_maintainArea = [player,1,_target];
				publicVariableServer "PVDZE_maintainArea";	
			} else {
				{player addMagazine _x;} forEach _temp_removed_array;
				cutText [format[(localize "STR_EPOCH_ACTIONS_5"),_removed_total,_tobe_removed_total], "PLAIN DOWN"];
			};
		} else {
			_textMissing = getText(configFile >> "CfgMagazines" >> _missing >> "displayName");
			cutText [format["Missing %1 more of %2", _missingQty, _textMissing], "PLAIN DOWN"];
		};
	};
	case "preview": {
		_cost = "";
		{
			_itemIn = _x select 0;
			_countIn = _x select 1;
			_itemText = getText(configFile >> "CfgMagazines" >> _itemIn >> "displayName");
			if (_cost != "") then {
				_cost = _cost + " and ";
			};
			_cost = _cost + (str(_countIn) + " of " + _itemText);
		} forEach _requirements;
		cutText [format[(localize "STR_EPOCH_ACTIONS_7"), _count, _cost], "PLAIN DOWN"];
	};
};

DZE_ActionInProgress = false;

s_player_maintain_aread = -1;
s_player_maintain_area_previewd = -1;
