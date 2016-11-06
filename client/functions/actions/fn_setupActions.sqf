/*
	@file 		fn_setupActions.sqf
	@author		JediNarwals [TG]
	@description
		Sets up the actions for players
*/

JEDI_act pushBack (player addAction["<t color='#FF0000'>Blood Transfusion Self</t>",jedi_fnc_bloodbag,player,-1,false,false,"",'damage player > 0']);
//JEDI_act pushBack (player addAction["<t color='#FF0000'>Give Blood Transfusion</t>",jedi_fnc_bloodbag,cursorTarget,-1,false,false,"",'!isNull cursorTarget && isPlayer cursorTarget && alive cursorTarget && damage cursorTarget > 0']);
JEDI_act pushBack (player addAction["<t color='#FF0000'>Repair Vehicle</t>",jedi_fnc_personalRepair,"",99,false,false,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (player distance cursorTarget < 4.5)']);
JEDI_act pushBack (player addAction["<t color='#0099FF'>Sit Down</t>",{[cursorObject,player] execVM "scripts\chairs\sitdown.sqf"},true,1,true,true,"""",'player distance cursorObject < 3 && {([str cursorObject,"bench"] call KRON_StrInStr || [str cursorObject,"chair"] call KRON_StrInStr)} ']);
JEDI_act pushBack (player addAction["Unflip Vehicle",jedi_fnc_flip,"",-1,false,false,"",'(cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air") && (vehicle player == player) && (player distance cursorTarget < 8) && (vectorUp cursorTarget select 2 < 0.6 || vectorUp cursorTarget select 1 > 0.2 || vectorUp cursorTarget select 1 < -0.2) && (speed cursorTarget < 1)']);
