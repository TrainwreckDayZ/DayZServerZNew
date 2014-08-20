private ["_missName","_coords","_crate","_crate1","_crate2","_crate3"];

_missName = "Weapons Crate";

_coords = call DZMSFindPos;

[nil,nil,rTitleText,"Bandits have obtained a weapon crate! Check your map for the location!", "PLAIN",10] call RE;

[_coords,_missname] ExecVM DZMSAddMajMarker;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
_crate1 = createVehicle ["AmmoBoxSmall_556",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
_crate2 = createVehicle ["AmmoBoxSmall_762",[(_coords select 0) - 3.4346, 0, 0],[], 0, "CAN_COLLIDE"];
_crate3 = createVehicle ["AmmoBoxSmall_556",[(_coords select 0) + 4.0996,(_coords select 1) + 3.9072, 0],[], 0, "CAN_COLLIDE"];

[_crate,"weapons"] ExecVM DZMSBoxSetup;
_crate allowDammage false;
[_crate] call DZMSProtectObj;
[_crate1] call DZMSProtectObj;
[_crate2] call DZMSProtectObj;
[_crate3] call DZMSProtectObj;

//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],6,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],4,1,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

[nil,nil,rTitleText,"The Weapons Crate is Under Survivor Control!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Major SM1 Weapons Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

DZMSMajDone = true;