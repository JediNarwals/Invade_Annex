/*
	@file:		fn_deleteMarker.sqf
	@author:	Rarek [AW]
				JediNarwals [TG]
	@description:
			Deletes markers.
*/
if(isDedicated) exitWith {/*Go away Server*/};

private["_marker", "_local", "_path", "_x"];

_marker = [_this,0,[],["",[]]] call BIS_fnc_param;
_local = [_this,1,false,[true]] call BIS_fnc_param;

_marker = []; 

if (typeName _markers != "ARRAY") then
{
	_marker = [_marker];
};

if (!_local) then
{
	{
		_path = [JIPmarkers, _x] call BIS_fnc_findNestedElement;
		if ((count _path) > 0) then
		{
			JIPmarkers = [JIPmarkers, (_path select 0)] call BIS_fnc_removeIndex;
			publicVariable "JIPmarkers";
		};

		deleteMarker _x;
	} forEach _marker;
	[[_marker, true], "AW_fnc_deleteMarker", true, false] call BIS_fnc_MP;
} else {
	if ((count localMarkers) > 0) then
	{
		{
			_path = [localMarkers, _x] call BIS_fnc_findNestedElement;
			if ((count _path) > 0) then
			{
				localMarkers = [localMarkers, (_path select 0)] call BIS_fnc_removeIndex;
				deleteMarkerLocal _x;
			};
		} forEach _marker;
	};
};