/*
		File: fn_bloodbag.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Puts blood in people.
*/

_unit = cursorTarget;
_target = [_this,3,objNull,[objNull]] call BIS_fnc_param; // index 3 due to addAction
if (_target == player) then { _unit = player; };

if (isNull _unit || !(_unit isKindOf "Man") || !(isPlayer _unit) || !(alive _unit)) exitWith {hint "Not a valid target for blood bag.  Dead?";};
if(player distance _target > 6) exitWith {}; //Not close enough.
if (vehicle player != player) exitWith { hint "You can't help someone from within a vehicle." };

life_action_in_use = true; //Lockout the controls.

//Setup our progress bar
_success = false;
_title = format["Giving transfusion to %1",name _unit];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_delay = switch (true) do
{
	case (playerSide == west): { 0.15 };
	default { 0.2 };
};
player forceWalk true;
//[[player,"AinvPknlMstpSnonWnonDnon_medic_1","switch",3.3],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
animRepeat = true;
[] spawn {
	while{animRepeat} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"};
		sleep 1;
	};
};
while {true} do
{
	sleep _delay;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if (!alive player || !alive _unit) exitWith {};
//Begin Edit: Check if Player gets into vehicle. Copied from repair check ~Gnash
	if(player != vehicle player) exitWith {player action ["Eject", vehicle player]};
//End Edit
	if(player getVariable ["downed",false]) exitWith {};
//Begin Edit: Check if Player is running while Bloodbagging in addition to existing distance check. ~Gnash
	if(player distance _target > 7) exitWith {};
//Begin Edit: break on ESC Menu present. ~JediNarwals
	if(!isNull(findDisplay 49)) exitWith {};
// End Edit
	if(_cP >= 1) exitWith{ _success = true; };
	if (!life_action_in_use) exitWith {};
};
player forceWalk false;
//[[player,""],"jedi_fnc_animSync",true,false] spawn BIS_fnc_MP;
animRepeat = false;
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if (!_success) exitWith { hint "Transfusion failed."; };

_damage = switch (true) do
{
	
};

if (_unit == player) then
{
	_unit setDamage 0;
	titleText["You give yourself a blood transfusion.","PLAIN"];
}
else
{
	_unit setDamage 0;
	titleText[format["You gave %1 a blood transfusion.", name _unit],"PLAIN"];
};
life_action_in_use = false; //Unlock controls