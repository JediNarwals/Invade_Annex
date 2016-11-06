/*
	File: SZhit.sqf
	
	Author: JediNarwals
	
	Modified: 5 July 2016
	
	Description:
		Takes the person who hit you and removes the damage from you and reflects it on you.
*/

_unit = _this select 0;
_shooter = _this select 1;
_damage = _this select 2;

if (_unit distance getMarkerPos "Respawn_west" < 20000 && side _unit == west) then {_unit setDammage (getdammage _unit - _damage); _shooter setDammage (getdammage _shooter + _damage)};

sleep 0.1;
if (true) exitWith {};

