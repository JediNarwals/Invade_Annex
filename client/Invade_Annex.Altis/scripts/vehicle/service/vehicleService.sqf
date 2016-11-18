/*
	@file:				vehicleService.sqf
	@author:			JediNarwals [TG]
	@description:		Services vehicles that go on designated triggers.
*/

if (isServer) exitWith {};
if (isDedicated) exitWith {};

private["_veh","_uav","_engOff","_upp","_ui","_progress","_pgText","_cP","_displayName","_task"];

_veh = vehicle player;
_uav = ["B_T_UAV_03_F","B_UAV_02_F"];
life_interrupted = false;
if(isNull _veh) exitWith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air") OR (_veh isKindOf "B_T_UAV_03_F") OR (_veh isKindOf "B_UAV_02_F")) then
{
	if!("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_engOff = vehicle player engineOn false;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Servicing %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do
		{
			uiSleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith { };
			if(isEngineOn _veh) exitWith {life_interrupted = true;};
			if(!alive player) exitWith {life_interrupted = true;};
			if(life_interrupted) exitWith {life_interrupted = true;};
		};
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		if(life_interrupted) exitWith {
			life_interrupted = false;
			_task = ["TaskFailed", ["", "Service interrupted"]] call bis_fnc_showNotification;
			life_action_inUse = false;
			};
		_veh setDamage 0;
		_veh setFuel 1;
		_veh setVehicleAmmo 1;
		_veh setVariable ["selections", []];
		_veh setVariable ["gethit", []];
		_task = ["TaskSucceeded", ["", "Vehicle Serviced"]] call bis_fnc_showNotification;
	};
};