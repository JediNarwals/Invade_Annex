if (!hasInterface) exitWith {};

STGI_Reload =
{
    call compile preprocessFileLineNumbers "scripts\stgi\stgi.sqf";
};

call STGI_Reload;

waitUntil {!isNil "STUI_Canvas_Active"};
"STGI_Update" call STUI_Canvas_Add;
