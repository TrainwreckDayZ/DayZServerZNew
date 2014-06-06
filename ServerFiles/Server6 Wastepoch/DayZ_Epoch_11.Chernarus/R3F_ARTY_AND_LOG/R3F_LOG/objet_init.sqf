private ["_objet", "_inVehicle", "_est_desactive", "_est_transporte_par", "_est_deplace_par"];
_objet = _this select 0;
_inVehicle = (vehicle player != player);
_est_desactive = _objet getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then{
	_objet setVariable ["R3F_LOG_disabled", false];
};
_est_transporte_par = _objet getVariable "R3F_LOG_est_transporte_par";
if (isNil "_est_transporte_par") then{
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, false];
};
_est_deplace_par = _objet getVariable "R3F_LOG_est_deplace_par";
if (isNil "_est_deplace_par") then{
	_objet setVariable ["R3F_LOG_est_deplace_par", objNull, false];
};
_objet addEventHandler ["GetIn",{
	if (_this select 2 == player) then {
		_this spawn {
			if (((!isNull (_this select 0 getVariable "R3F_LOG_est_deplace_par")) && (alive (_this select 0 getVariable "R3F_LOG_est_deplace_par"))) || (!isNull (_this select 0 getVariable "R3F_LOG_est_transporte_par"))) then {
				player action ["eject", _this select 0];
				player globalChat STR_R3F_LOG_transport_en_cours;
			};
		};
	};
}];

if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then {
	R3F_action_deplacer_object = _objet;
	if (R3F_action_deplacer_objet < -4) then {
		R3F_action_deplacer_objet = _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_deplacer_objet + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\deplacer.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_deplacer_objet_valide"];
	};
} else {
	R3F_action_deplacer_object removeAction R3F_action_deplacer_objet;
	R3F_action_deplacer_objet = -5;
	if (_inVehicle) then {
		R3F_action_deplacer_object = objNull;
	};
};

if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) then {
	R3F_action_remorquables_target = _objet;
	if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then {
		if (R3F_action_remorquer_deplace < -4) then {
			R3F_action_remorquer_deplace =  _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_remorquer_deplace + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];
		};
	};
	if (R3F_action_selectionner_objet_remorque < -4) then {
		R3F_action_selectionner_objet_remorque = _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_selectionner_objet_remorque + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_remorque_valide"];
		R3F_action_detacher = _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_detacher + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\detacher.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_detacher_valide"];
	};
} else {
	R3F_action_remorquables_target removeAction R3F_action_remorquer_deplace;
	R3F_action_remorquables_target removeAction R3F_action_selectionner_objet_remorque;
	R3F_action_remorquables_target removeAction R3F_action_detacher;
	R3F_action_remorquer_deplace = -5;
	R3F_action_selectionner_objet_remorque = -5;
	R3F_action_detacher = -5;
	if (_inVehicle) then {
		R3F_action_remorquables_target = objNull;
	};
};

if ({_objet isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then {
	R3F_action_charger_target = _objet;
	if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then {
		if (R3F_action_charger_deplace < -4) then {
			R3F_action_charger_deplace = _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_charger_deplace + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\charger_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_deplace_valide"];
		};
	};
	if (R3F_action_selectionner_objet_charge < -4) then {
		R3F_action_selectionner_objet_charge = _objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_selectionner_objet_charge + "</t>"), "R3F_ARTY_AND_LOG\R3F_LOG\transporteur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_charge_valide"];
	};
} else {
	R3F_action_charger_target removeAction R3F_action_charger_deplace;
	R3F_action_charger_target removeAction R3F_action_selectionner_objet_charge;
	R3F_action_charger_deplace = -5;
	R3F_action_selectionner_objet_charge = -5;
	if (_inVehicle) then {
		R3F_action_charger_target = objNull;
	};
};