private ["_temp","_dateNow","_diff","_body","_name","_method","_deathTime","_methodStr","_kills","_killsH","_killsB","_headShots","_humanity"];
_body =    _this select 3;
_name =    _body getVariable["bodyName","unknown"];
_method =    _body getVariable["deathType","unknown"];
_deathTime =    _body getVariable["deathTime",-1];
_methodStr = localize format ["str_death_%1",_method];
if (_deathTime < 0) then {
    _temp = "unknown";
} else {
    _dateNow = (DateToNumber date);
    _diff = (_dateNow - _deathTime) * 525948;
    _temp = "their body has been here for ages, it's freezing";
    if ( _diff < 60 ) then {
        _temp = "their body is cold, its been a while since they died";
    };
    if ( _diff < 30 ) then {
        _temp = "their body is still slightly warm but their blood has started to coagulate";
    };
    if ( _diff < 10 ) then {
        _temp = "their body hasn't been here long, the blood around them is still warm";
    };
};
cutText [format["Their name was %1, %2. Toggle debug -end- to see journal.",_name,_temp], "PLAIN DOWN"];

_body = _this select 3;
_name = _body getVariable ["bodyName","unknown"];
_kills = _body getVariable ["zombieKills",0];
_killsH = _body getVariable ["humanKills",0];
_killsB = _body getVariable ["banditKills",0];
_headShots = _body getVariable ["headShots",0];
_humanity = _body getVariable ["humanity",0];

hint parseText format["
<t size='1.5' font='Bitstream' color='#5882FA'>%1's Journal</t><br/><br/>
<t size='1.25' font='Bitstream' align='left'>Zombies Killed: </t><t size='1.25' font='Bitstream' align='right'>%2</t><br/>
<t size='1.25' font='Bitstream' align='left'>Murders: </t><t size='1.25' font='Bitstream' align='right'>%3</t><br/>
<t size='1.25' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.25' font='Bitstream' align='right'>%4</t><br/>
<t size='1.25' font='Bitstream' align='left'>Headshots: </t><t size='1.25' font='Bitstream' align='right'>%5</t><br/>
<t size='1.25' font='Bitstream' align='left'>Humanity: </t><t size='1.25' font='Bitstream' align='right'>%6</t><br/>",
_name,_kills,_killsH,_killsB,_headShots,_humanity];