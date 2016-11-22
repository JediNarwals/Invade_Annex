/*
	@file		init.sqf
	@author		JediNarwals [TG]
	@description
		init file for \IA_serv\ mod file folder
*/

//if (debugMode) exitWith {};

_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Server MOD by JediNarwals ------------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

/*
diag_log ":: IA3 :: Setting up bases : Starting JIP ::";
["Initialize"] call BIS_fnc_dynamicGroups;
allBases = []; basesOwned = []; baseSpawns = [];
JIPmarkers = []; publicVariable "JIPmarkers"; localMarkers = [];
JIPactions = []; publicVariable "JIPactions";
result = false;
AW_dead = [];
diag_log ":: IA3 :: Bases set : JIP active ::";

_paramCount = count paramsArray;
for [ {_i = 0}, {_i < _paramCount}, {_i = _i + 1} ] do
{
	call compile format
	[
		"PARAMS_%1 = %2;",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};


publicVariable "PARAMS_restrictWeapons";
publicVariable "PARAMS_pilotRestrictions";

skipTime (PARAMS_startTimeHour + PARAMS_startTimeMinutes);

pointsOfInterest = [];
{
	if (["poi_", _x] call BIS_fnc_inString) then
	{
		pointsOfInterest = pointsOfInterest + [_x];
	};
} forEach allMapMarkers;

diag_log ":: IA3 :: Adding everything to Zeus : Cleaning up the dead ::";
[] execVM "\IA_serv\functions\generic\fn_zeusUpdater.sqf";
[] execVM "\IA_serv\functions\garbage\fn_cleanSlate.sqf";
diag_log ":: IA3 :: Server adding objects to Zeus : Watching for death ::";


diag_log "RESPAWN INVENTORIES START";

[WEST, "B_Rifleman"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Grenadier"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Marksman"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Autorifleman"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Engineer"] call BIS_fnc_addRespawnInventory;
[WEST, "B_CombatLifesaver"] call BIS_fnc_addRespawnInventory;
[WEST, "B_ReconScout"] call BIS_fnc_addRespawnInventory;
[WEST, "B_ReconMarksman"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Sharpshooter"] call BIS_fnc_addRespawnInventory;
[WEST, "B_Sniper"] call BIS_fnc_addRespawnInventory;
[WEST, "B_HeavyGunner"] call BIS_fnc_addRespawnInventory;
[WEST, "B_ExplosiveSpecialist"] call BIS_fnc_addRespawnInventory;
[WEST, "B_ATSpecialist"] call BIS_fnc_addRespawnInventory;
[WEST, "B_UAVSpecialist"] call BIS_fnc_addRespawnInventory;
[WEST, "B_helipilot"] call BIS_fnc_addRespawnInventory;
[WEST, "B_jetpilot"] call BIS_fnc_addRespawnInventory;

diag_log "RESPAWN INVENTORIES FINISH";


diag_log "STARTING BASE SET UP";

_bases = missionConfigFile >> "AW_base";
_lastIndex = ((count _bases) - 1);


for "_i" from 0 to _lastIndex do
{
	_x = _bases select _i;

	[
		["name", getText (_x >> "name")],
		["isOwned", getNumber (_x >> "isOwned")],
		["marker", configName _x],
		["groups", getNumber (_x >> "groups")],
		["respawnGroups", getNumber (_x >> "respawnGroups")],
		["respawnTime", getNumber (_x >> "respawnTime")],
		["vehicles", getArray (_x >> "vehicles")]
	] execFSM "\IA_serv\machines\base.fsm";
};

diag_log "BESES SET UP";

diag_log ":: IA3 :: Starting Main AO ::";
	_locs = ["AW_main"] call BIS_fnc_getCfgSubClasses;
	[_locs] execFSM "machines\main.fsm";
diag_log ":: IA3 :: AO set waiting for Attack";

diag_log ":: IA3 :: Starting side missions ::";
	{
		_param = 0;
		call compile format["_param = PARAMS_%1MissionsEnabled;", _x];
		if (_param == 1) then
		{
			_amount = 1;
			call compile format["_amount = PARAMS_%1Number;", _x];
			for "_i" from 1 to _amount do
			{
				[_x, [], true] execFSM "machines\mission.fsm";
			};
		};
	} foreach ["tactical", "ghost", "priority"];
diag_log ":: IA3 :: Side Mission Ready ::";
*/

diag_log ":: IA3 :: Setting up the Key Handlers ::";
waitUntil {!isNull(findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call jedi_fnc_keyUpHandler"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call jedi_fnc_keyDownHandler"];
diag_log ":: IA3:: Key Handlers set up ::";

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Server MOD Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

