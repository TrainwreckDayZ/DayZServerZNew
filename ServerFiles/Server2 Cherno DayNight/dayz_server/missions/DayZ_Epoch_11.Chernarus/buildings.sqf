//Property of Trainwreckdayz.com  Credit goes to TowelZ and Trainwreck -- You do not have permission to use this file!!
if (isServer) then {
//Dyskinesia Fuel Tank 1
_vehicle_4 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_TankSmall", [10491.7, 12793], [], 0, "CAN_COLLIDE"];
  _vehicle_4 = _this;
  _this setDir -199;
  _this setPos [10491.7, 12793];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_SmallObj_money", [2504.7773, 4687.4277, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setPos [2504.7773, 4687.4277, -1.5258789e-005];
};

//Dyskinesia Fuel Tank 2
_vehicle_2 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_TankSmall", [7106.13, 2744.95, 4.326], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 118;
  _this setVehicleInit "this allowDammage false; this setVectorup [0,0,0.1]";
  _this setPos [7106.13,2744.95,4.326];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_SmallObj_money", [7106.13, 2744.95, 4.326], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 118;
  _this setPos [7106.13,2744.95,4.326];
};

//Dyskinesia Sphere 1
_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_Sphere", [10242.9, 9483.44, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setVehicleInit "this allowDammage false";
  _this setPos [10242.9, 9483.44, 0];
};

//Dyskinesia Sphere 2
_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_Sphere", [7100.62, 2751.45, 4.326], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setVehicleInit "this allowDammage false";
  _this setPos [7100.62,2751.45,4.326];
};

//Dyskinesia Sphere 3
_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_Sphere", [13106, 7186.7, 7.35], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setVehicleInit "this allowDammage false";
  _this setPos [13106, 7186.7, 7.35];
};

//recondoc  Fuel Tank 1
_vehicle_2 = objNull;
if (true) then
{
  _this = createVehicle ["Land_Ind_TankSmall", [10258.8, 9502.06, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_2 = _this;
  _this setDir 273.44;
  _this setVehicleInit "this allowDammage false; this setVectorup [0,0,0.1]";
  _this setPos [10258.8, 9502.06, 0];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_SmallObj_money", [10258.8, 9502.06, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 273.44;
  _this setPos [10258.8, 9502.06, 0];
};

//recondoc sphere 1
_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_Sphere", [6672.78, 2618.71, 36.299], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setVehicleInit "this allowDammage false";
  _this setPos [6672.78, 2618.71, 36.299];
};

//vilg_idot sphere 1
_vehicle_0 = objNull;
if (true) then
{
  _this = createVehicle ["MAP_Sphere", [6863.9, 2500.11, 39.693], [], 0, "CAN_COLLIDE"];
  _vehicle_0 = _this;
  _this setVehicleInit "this allowDammage false";
  _this setPos [6863.9, 2500.11, 39.693];
};

};