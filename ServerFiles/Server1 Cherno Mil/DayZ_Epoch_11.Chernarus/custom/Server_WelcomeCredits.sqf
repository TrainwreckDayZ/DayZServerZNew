//Server Intro Credits, by IT07 - v1.3.4 BETA
_onScreenTime = 5;
waitUntil {alive player};
sleep 2;
waituntil {!isnull (findDisplay 46)};
sleep 20;
_role1 = "Welcome to";
_role1names = ["TrainwreckDayZ"];
_role2 = "Admins";
_role2names = ["Trainwreck","TowelZ","Bondue","ReconDoc","Gladiator"];
_role3 = "Forum";
_role3names = ["Trainwreckdayz.com"];
_role4 = "Debug Monitor";
_role4names = ["Press end to Toggle Debug"];
_role5 = "SpawnBike|Suicide|SelfBloodBag";
_role5names = ["Right Click On Gear For Custom Actions"];
_role6 = "Support";
_role6names = ["Trainwreckdayz.com"];
 
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names]
];