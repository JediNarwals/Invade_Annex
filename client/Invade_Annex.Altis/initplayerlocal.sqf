/*
	@file 		initPlayerLocal.sqf
	@author		JediNarwals [TG]
	@description
		Initializes the player at Start-up. Does not need to be called by any file.

*/

if(isDedicated) exitWith {/*Go away Server*/};
waitUntil {!isNull player && player == player};

//=========================== MISC

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;				// BIS dynamic groups
player switchCamera "EXTERNAL";											// Check your 6'
enableRadio false;														// That will clear the voices from my head...
enableSentences FALSE;													// Stop talking to myself
enableSaving [FALSE,FALSE];												// "Everything Not saved will be lost." - Nintendo 'Quit Screen' message
player enableFatigue false;												// Disables fatigue

//=========================== HUD

[] spawn jedi_fnc_hudSetup;

//=========================== client executions

{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;				// Adds players to Zeus

[] execVM "scripts\recoilFix.sqf";												// Fixes the recoil to be a bit more Realistic
[] execVM "scripts\icons.sqf";													// blufor map tracker ~Quicksilver
[] execVM "scripts\diary.sqf";													// diary tabs
[] execVM "scripts\pilotCheck.sqf";												// Pilots only in Heli's

/*
	@class 			Channel enabler
	@description
			Enables/Disables the channels. Same as description but added for extra peramaters
			How it works:
				"ChannelNumber" enableChannel [Chat,VON];
			Channel Numbers:
				0 = Global
				1 = Side
				2 = Command
				3 = Group
				4 = Vehicle
				5 = Direct
				6 = Systems
			Additional information:
				Admins and system's can still access and use ["Global","Command","System"] chat.
*/

0 enableChannel false;			// Global
1 enableChannel [true, false];	// Side
2 enableChannel false;			// Command
3 enableChannel true;			// Group
4 enableChannel true;			// Vehicle
5 enableChannel true; 			// Direct
6 enableChannel false;			// System

//=========================== Handlers


waitUntil {!isNull(findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call jedi_fnc_keyUpHandler"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call jedi_fnc_keyDownHandler"];