private ["_missName","_coords","_crash","_crate"];

_missName = "Humvee Crash";

_coords = call DZMSFindPos;

[nil,nil,rTitleText,"A Humvee transporting money has crashed!\nGo recover the cash!", "PLAIN",10] call RE;

[_coords,_missName] ExecVM DZMSAddMinMarker;

_crash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];

[_crash] call DZMSProtectObj;

_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate,"money"] ExecVM DZMSBoxSetup;
[_crate] call DZMSProtectObj;
_crate setVehicleInit "this allowDammage false";

//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,3,1,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

[nil,nil,rTitleText,"The Humvee has been Secured by Survivors!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Minor SM5 Humvee Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

DZMSMinDone = true;