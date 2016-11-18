/*
	@file		server.sqf
	@author		Rarek [AW]
				JediNarwals [TG]

	@description
		Sets up the server files
			Called from the main init.sqf
			Can be called with "[] execVM 'init\server.sqf';"
*/

if (debugMode) exitWith {};

_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Server by JediNarwals ------------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";

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
[] execVM "functions\generic\fn_zeusUpdater.sqf";
[] execVM "functions\garbage\fn_cleanSlate.sqf";
[] call compile PreprocessFileLineNumbers "config\configuration.sqf";
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

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";

serverInitComplete = true;
publicVariable "serverInitComplete";