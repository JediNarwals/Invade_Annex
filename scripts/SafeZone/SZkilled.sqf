/*
	File: SZkilled.sqf
	
	Author: JediNarwals
	
	Modified: 5 July 2016
	
	Description:
		Kills the player that Kills you in base.
		Blufor only.
*/ 

_unit = _this select 0;
_killer = _this select 1;

if (_unit distance getMarkerPos "Respawn_west" < 20000 && side _unit == west) then {_killer setDamage 1};

sleep 0.1;
if (true) exitWith {};