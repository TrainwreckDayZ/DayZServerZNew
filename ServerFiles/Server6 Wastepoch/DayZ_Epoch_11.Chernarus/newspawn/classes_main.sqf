EXECscript1 = '[] execVM "newspawn\classes\%1"';

if ((getPlayerUID player) in ["0"]) then {
	classes =
	[
		["",false],
		["Select Class", [2], "#USER:Donator", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"]
	
	];
} else {
	classes =
	[
		["",false],
		["Select Class", [2], "#USER:Peasant", -5, [["expression", ""]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"]
	
			
	];
};

Donator =
[
	["",false],
	["British Soldier", [2], "", -5, [["expression", format[EXECscript1,"britishs.sqf"]]], "1", "1"],
	["Business Man", [3], "", -5, [["expression", format[EXECscript1,"businessman.sqf"]]], "1", "1"],
	["Civilian", [4], "", -5, [["expression", format[EXECscript1,"civilian.sqf"]]], "1", "1"],
	["Civilian Lady", [5], "", -5, [["expression", format[EXECscript1,"civilianl.sqf"]]], "1", "1"],
	["Czech Soldier", [6], "", -5, [["expression", format[EXECscript1,"czechs.sqf"]]], "1", "1"],
	["Policeman", [7], "", -5, [["expression", format[EXECscript1,"policeman.sqf"]]], "1", "1"],
	["Terrorist", [8], "", -5, [["expression", format[EXECscript1,"terrorist.sqf"]]], "1", "1"],
	["US Soldier", [9], "", -5, [["expression", format[EXECscript1,"uss.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

Peasant =
[
	["",false],
	["British Soldier", [2], "", -5, [["expression", format[EXECscript1,"britishs.sqf"]]], "1", "1"],
	["Business Man", [3], "", -5, [["expression", format[EXECscript1,"businessman.sqf"]]], "1", "1"],
	["Civilian", [4], "", -5, [["expression", format[EXECscript1,"civilian.sqf"]]], "1", "1"],
	["Civilian Lady", [5], "", -5, [["expression", format[EXECscript1,"civilianl.sqf"]]], "1", "1"],
	["Czech Soldier", [6], "", -5, [["expression", format[EXECscript1,"czechs.sqf"]]], "1", "1"],
	["Policeman", [7], "", -5, [["expression", format[EXECscript1,"policeman.sqf"]]], "1", "1"],
	["Terrorist", [8], "", -5, [["expression", format[EXECscript1,"terrorist.sqf"]]], "1", "1"],
	["US Soldier", [9], "", -5, [["expression", format[EXECscript1,"uss.sqf"]]], "1", "1"],
	["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

showCommandingMenu "#USER:classes";