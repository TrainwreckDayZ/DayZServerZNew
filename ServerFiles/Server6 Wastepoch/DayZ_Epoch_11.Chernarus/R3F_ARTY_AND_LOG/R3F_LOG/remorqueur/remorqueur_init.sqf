private ["_remorqueur", "_est_desactive", "_remorque"];
_remorqueur = _this select 0;
_est_desactive = _remorqueur getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_remorqueur setVariable ["R3F_LOG_disabled", false];
};
_remorque = _remorqueur getVariable "R3F_LOG_remorque";
if (isNil "_remorque") then
{
	_remorqueur setVariable ["R3F_LOG_remorque", objNull, false];
};
R3F_action_remorquer_object = _remorqueur;
R3F_action_remorquer_deplace = _remorqueur addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_remorquer_deplace + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];
R3F_action_remorquer_selection = _remorqueur addAction [("<t color=""#eeeeee"">" + STR_R3F_LOG_action_remorquer_selection + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_selection.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_selection_valide"];