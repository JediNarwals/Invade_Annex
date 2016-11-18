/*
	@file		fn_keyUpHandler.sqf
	@author		Paratus & JediNarwals [TG]

	@description
		Main key handler for event 'keyUP'
*/

private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_owners","_index","_weapon","_items","_primary","_ammo"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_escHandle = false;

if(life_action_in_use && _code != 1) exitWith {_handled};

switch (_code) do
{
	//Escape
	case 1:
	{
		if (!isNull QS_seated) then { [] execVM "scripts\chairs\standup.sqf"; _handled = true; };
		life_action_in_use = true;
	};
/*	//6 Nitro
	case 7:
	{
		if(!_alt && !_ctrlKey) then {
			[] spawn jedi_fnc_activateNitro;
		};
	};
*/
	//Y ping zeus
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			systemChat format["Zeus is disabled on this server.",_stp];
			_handled = true;
		};
	};
	//H Holster
	case 35:
	{
		if(!_alt && !_ctrlKey && !dialog && vehicle player == player) then
		{
			if ((currentWeapon player) != "") then
			{
				[true,true,true,true] spawn jedi_fnc_holsterWeapon;  //To make sure that the script is asking for _this select 3 since this is run by action as well. Stupid, but it works.
			} else {
				[false,false,false,false] spawn jedi_fnc_holsterWeapon;
			};
		};
	};
	//Numpad minus
	case 74:
	{
		if(_shift) then
		{
			_handled = true;
		};
	};
};

if (_code in (actionKeys "TacticalView")) then
{
	hint "Command mode disabled." ;
	_handled = true;
};

if (_code in (actionKeys "User10")) then 
{
	if (soundVolume < 0.21) then { 0 fadeSound 1; }
	else { 0 fadeSound 0.2; };
	systemChat format["Sound volume changed to %1%2.", soundVolume * 100, "%"];
	_handled = true;
};

_handled;