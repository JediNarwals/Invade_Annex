/*
	@file 		init.sqf
	@author		Rarek [AW]
				JediNarwals [TG]
	@description
		Initializes the player/server at start-up. Does not need to be called by any file.
*/

call compile preprocessFile "scripts\far_revive\FAR_revive_init.sqf";			// FarRevive
["Initialize"] call BIS_fnc_dynamicGroups;										// Dynamic Groups by Bohimia
[] execVM "KRON_Strings.sqf";													// Server things for scripting
[] execVM "scripts\outlw_magRepack\MagRepack_init_sv.sqf";						// OutLaw's Mag Repack

/***********************************************************\
	LEAVE THESE BE AND THE REST OF THE FILE IS YOURS!

	*/
		debugMode = false;

		enableSaving [false, false];
		if (isServer) exitWith { [] execVM "init\server.sqf"; [] execVM "\IA_serv\init.sqf"; };
		_settings = player execVM "init\player.sqf"; waitUntil { scriptDone _settings };
	/*

	YE-ARGH! THANK YE!
\***********************************************************/

TG_ID_PlayerTags = ["TG_PlayerTags","onEachFrame",
	{
		{ 
			if (cursorObject == _x) then 
			{ 
			drawIcon3D
				[   
					"",   
					[1, 1, 1, 0.8],    
					[visiblePosition _x select 0, visiblePosition _x select 1,(visiblePosition _x select 2)+2.2],    
					0.83333,    
					0.83333,    
					0,    
					(format [name _x]),    
					2,    
					0.0416665,    
					"RobotoCondensed"  
				]; 
			}; 
		} foreach playableUnits; 
			{   
				if ((side _x == west) && (_x != player) && ((player distance _x) < 15)) then   
			{   
			drawIcon3D 
				[   
					"",   
					[1, 1, 1, 0.8],    
					[visiblePosition _x select 0, visiblePosition _x select 1,(visiblePosition _x select 2)+2.2],    
					0.83333,    
					0.83333,    
					0,    
					(format [name _x]),    
					2,    
					0.0416665,    
					"RobotoCondensed"  
				]; 
			};   
		} foreach playableUnits;   
	}
] call BIS_fnc_addStackedEventHandler;


//------------------- System chat for when the Inventory is active

[] spawn
{
	while {true} do
	{
		waitUntil { !isNull (findDisplay 602) };
		systemChat "Press CTRL+R to repack magazine ammo.";
		systemChat "Use 'Custom Action 10' for Earplugs";
		waitUntil { isNull (findDisplay 602) };
	};
};

//------------------ Adds player names next to the markers they place on the map

[] spawn
{
	while{true} do
	{
		waitUntil {visibleMap};
		waitUntil {!isNull findDisplay 54 || !visibleMap};
		if(visibleMap) then {
			findDisplay 54 displayCtrl 1 buttonSetAction
			"
				if(currentChannel in [0,1]) then {
					_ctrl = findDisplay 54 displayCtrl 101;
					_text = ctrlText _ctrl;
					if (_text == '') then {
						_text = format ['%1', name player];
					} else {
						_text = format ['%1: %2', name player, _text];
					};
					_ctrl ctrlSetText _text;
				};
			";
			waitUntil{isNull findDisplay 54};
		};
	};
};

