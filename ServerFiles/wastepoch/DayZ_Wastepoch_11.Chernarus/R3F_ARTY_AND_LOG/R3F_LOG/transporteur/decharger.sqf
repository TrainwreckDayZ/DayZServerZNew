if (R3F_LOG_mutex_local_verrou) then
{
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
}
else
{
	R3F_LOG_mutex_local_verrou = true;
	#include "dlg_constantes.h"
	private ["_transporteur", "_objets_charges", "_type_objet_a_decharger", "_objet_a_decharger", "_i"];
	_transporteur = uiNamespace getVariable "R3F_LOG_dlg_CV_transporteur";
	_objets_charges = _transporteur getVariable "R3F_LOG_objets_charges";
	_type_objet_a_decharger = lbData [R3F_LOG_IDC_dlg_CV_liste_contenu, lbCurSel R3F_LOG_IDC_dlg_CV_liste_contenu];
	closeDialog 0;
	_objet_a_decharger = objNull;
	for [{_i = 0}, {_i < count _objets_charges}, {_i = _i + 1}] do
	{
		if (typeOf (_objets_charges select _i) == _type_objet_a_decharger) exitWith
		{
			_objet_a_decharger = _objets_charges select _i;
		};
	};
	
	if !(isNull _objet_a_decharger) then
	{
		_objets_charges = _objets_charges - [_objet_a_decharger];
		_transporteur setVariable ["R3F_LOG_objets_charges", _objets_charges, true];
		
		detach _objet_a_decharger;
		
		if ({_objet_a_decharger isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
		{
			[_objet_a_decharger] spawn deplacer_compile;
		}
		else
		{
			private ["_dimension_max"];
			_dimension_max = (((boundingBox _objet_a_decharger select 1 select 1) max (-(boundingBox _objet_a_decharger select 0 select 1))) max ((boundingBox _objet_a_decharger select 1 select 0) max (-(boundingBox _objet_a_decharger select 0 select 0))));
			
			player globalChat STR_R3F_LOG_action_decharger_en_cours;
			
			sleep 2;
			_objet_a_decharger setPos [
				(getPosATL _transporteur select 0) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*sin ((getDir _transporteur - 90)+(random 180))),
				(getPosATL _transporteur select 1) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*cos ((getDir _transporteur - 90)+(random 180))),
				0
			];
			_objet_a_decharger setVelocity [0, 0, 0];
			
			player globalChat STR_R3F_LOG_action_decharger_fait;
		};
	}
	else
	{
		player globalChat STR_R3F_LOG_action_decharger_deja_fait;
	};
	
	R3F_LOG_mutex_local_verrou = false;
};