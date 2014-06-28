#include "R3F_ARTY_disable_enable.sqf"
#include "R3F_LOG_disable_enable.sqf"
sleep 0.1;
R3F_liste_objets_depl_heli_remorq_transp = [];
#ifdef R3F_LOG_enable
R3F_liste_objets_depl_heli_remorq_transp = R3F_LOG_CFG_objets_deplacables + R3F_LOG_CFG_objets_heliportables + R3F_LOG_CFG_objets_remorquables + R3F_LOG_classes_objets_transportables;
#endif