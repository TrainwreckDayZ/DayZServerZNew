private ["_heliporteur", "_objet", "_est_desactive", "_heliporte"];
_heliporteur = _this select 0;
_objet = _this select 1;
_est_desactive = _heliporteur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then {
	_heliporteur setVariable ["R3F_LOG_disabled", false];
};
_heliporte = _heliporteur getVariable "R3F_LOG_heliporte";
if (isNil "_heliporte") then {
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, false];
};
R3F_action_heliporter_object = _heliporteur;
R3F_action_heliporter = _heliporteur addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_heliporter + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\heliporter.sqf", [_heliporteur, _objet], 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliporter_valide"];
R3F_action_heliport_largue = _heliporteur addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_heliport_larguer + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\heliporteur\larguer.sqf", [_heliporteur, _objet], 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliport_larguer_valide"];