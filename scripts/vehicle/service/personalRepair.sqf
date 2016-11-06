/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if!("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "Repairing %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel") then {
				[[player,"Acts_carFixingWheel"],"jedi_fnc_animSync",true,false] spawn BIS_fnc_MP;
				player playMoveNow "Acts_carFixingWheel";
			};
			uiSleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith { };
			if(!alive player) exitWith { };
			if(player != vehicle player) exitWith { };
			if(life_interrupted) exitWith { };
		};
		//if!("ToolKit" in (items player)) exitWith {hint localize "STR_NOTF_MissingKit"; };
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "Your repair has been interrupted and failed.","PLAIN"]; life_action_inUse = false; };
		if(player != vehicle player) exitWith {};
		player removeItem "ToolKit";
		_veh setDamage 0;
		_veh setVariable ["selections", []];
		_veh setVariable ["gethit", []];
		titleText[localize "You have repaired that vehicle.","PLAIN"];
	};
};

