/*
	@file		fn_keyDownHandler.sqf
	@author		Bryan "Tonic" Boardwine 
				Chronic [MIT]
				JediNarwals [TG]

	@description
				Main key handler for event 'keyDown'
*/

private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_owners","_index","_chance"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

if(life_action_in_use && _code != 1) exitWith {_handled};

switch (_code) do
{
	//Escape
	case 1:
	{
		if (life_action_in_use) then { life_action_in_use = false; _handled = true; };
	};
};
{if(_code in actionKeys format["CommandingMenu%1",_x]) exitWith {_handled = true}} forEach [0,1,2,3,4,5,6,7,8,9];
if (_code in actionKeys "NavigateMenu") then {_handled = true};
if (_code in (actionKeys "TacticalView")) then { _handled = true; };
if (_code in (actionKeys "GetOver") && speed player > 10) then
{
	[] spawn jedi_fnc_jump;
	_handled = true;
};
if (_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide")) then
{
	if (currentChannel in [0,1]) then { systemChat format["Voice over this channel is not allowed. Join our TeamSpeak.", _chan]; _handled = true; };
};
if (_code in (actionKeys "User8") then
{
	if (!target_Tag) then { target_Tag = true };
	_handled = true;
};
if (_code in ((actionKeys "NetworkPlayers") + (actionKeys "forceCommandingMode") + (actionKeys "menuBack"))) then
{
	_handled = true;
};

_handled;