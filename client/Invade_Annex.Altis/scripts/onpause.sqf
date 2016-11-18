/*
	On Pause menu. Disables options on the pause menu.
	
	By JediNarwals
*/
private["_puid"];

disableSerialization;

waitUntil {!isNull findDisplay 49}; // 49 = Esc menu

// Disable field manual to prevent scriptkiddie exploits
//((findDisplay 49) displayCtrl 122) ctrlEnable false;

_puid = getPlayerUID player;
_display49 = (findDisplay 49);
//_puid = player getPlayerUID;
_ESCtext = 
	      
		(_display49 displayCtrl 2) ctrlEnable false;      
		(_display49 displayCtrl 2) ctrlSetText "www.TacticalGaming.net/HQ";      
		(_display49 displayCtrl 103) ctrlEnable false;      
		(_display49 displayCtrl 103) ctrlSetText "TS3: 162.251.164.114:10004";
		(_display49 displayCtrl 523) ctrlSetText profileName;      
		(_display49 displayCtrl 109) ctrlSetText _puid;      
		(_display49 displayCtrl 122) ctrlEnable false;      
		(_display49 displayCtrl 122) ctrlShow false;
		(_display49 displayCtrl 120) ctrlSetText "TacticalGaming's Public Operations US-2. For more informations on Tactical Realism join us on www.TacticalGaming.net/HQ";
	;