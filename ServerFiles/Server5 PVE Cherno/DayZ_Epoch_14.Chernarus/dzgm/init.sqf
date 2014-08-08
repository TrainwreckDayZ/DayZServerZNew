waitUntil {uiSleep 0.25;(!isNil "PVDZE_plr_LoginRecord")};
if (count units group player > 1) then {[player] join grpNull;};

acceptGroupInvite = compile preprocessFileLineNumbers "dzgm\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "dzgm\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "dzgm\disbandGroup.sqf";
inviteToGroup = compile preprocessFileLineNumbers "dzgm\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "dzgm\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "dzgm\leaveGroup.sqf";
playerSelectChange = compile preprocessFileLineNumbers "dzgm\playerSelectChange.sqf";
Updateplayerlist = compile preprocessFileLineNumbers "dzgm\Updateplayerlist.sqf";
tagname = true;
	
if (isNil "dzgm_init") then {call compile preprocessFileLineNumbers "dzgm\icons.sqf";};
uiSleep 1;
[] spawn dzgm_init;
systemChat "Press right ctrl to open group management";