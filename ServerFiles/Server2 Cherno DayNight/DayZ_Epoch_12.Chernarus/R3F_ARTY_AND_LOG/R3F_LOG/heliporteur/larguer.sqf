if (R3F_LOG_mutex_local_verrou) then {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
} else {
	R3F_LOG_mutex_local_verrou = true;
	private ["_heliporteur", "_objet"];
	_heliporteur = (_this select 3) select 0;
	_objet = _heliporteur getVariable "R3F_LOG_heliporte";
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, true];
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, true];
	detach _objet;
	_pos = getPosATL _objet;
	_objet setPos [(_pos select 0), (_pos select 1), 0];
	_objet setVelocity [0, 0, 0];
	player globalChat format [STR_R3F_LOG_action_heliport_larguer_fait, getText (configFile >> "CfgVehicles" >> (typeOf _objet) >> "displayName")];
	R3F_LOG_mutex_local_verrou = false;
	PVDZE_veh_Update = [_objet,"all"];
	publicVariableServer "PVDZE_veh_Update";
};