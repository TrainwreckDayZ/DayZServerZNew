if (!isServer) exitWith {};
diag_log "WAI: AI Monitor Started";
sleep 120;
while {1 == 1} do {
	if (ai_clean_dead) then {
		{
			_killedat = _x getVariable "killedat";
			if ((!isNil {_killedat}) && (!alive _x)) then {
				if ((time - _killedat) >= cleanup_time) then {
					deleteVehicle _x;
					WAI_AI_Array = WAI_AI_Array - [_x];
				};
			};
			sleep 0.001;
		} count WAI_AI_Array;
	};
	diag_log format ["%1 Active ground units", ai_ground_units];
	diag_log format ["%1 Active emplacement units", ai_emplacement_units];
	diag_log format ["%1 Active chopper patrol units (Crew)", ai_air_units];
	diag_log format ["%1 Active vehicle patrol units (Crew)", ai_vehicle_units];
	sleep 600;
};