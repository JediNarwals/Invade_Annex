/*
	@file 				fn_playerTags.sqf
	@author 			
						John "Paratus" VanderZwet 
						Bryan "Tonic" Boardwine 
						JediNarwals [TG]

	@description:
		Adds the tags above other players heads when close and have visible range.
*/

private["_ui","_units","_masks","_text"];

disableSerialization;

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

if (jedi_targetTag) then
{
	if (!isNull cursorTarget && {cursorTarget isKindOf "Man" || cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship"} && {!(cursorTarget in jedi_tag_units)}) then
	{
		jedi_tag_units pushBack cursorTarget;
	};
};

{
	_idc = _ui displayCtrl (78000 + _forEachIndex);
	
	if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x) then
	{
		_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		_maxDistance = if (goggles _x in jedi_masks) then { 5 } else { 20 };
		
		if (count _sPos > 1 && !(_x getVariable["isInvisible",false]) && {(_distance <= _maxDistance) || {jedi_targetTag && _x == cursorTarget}}) then
		{
			if !(!(_x isKindOf "Man") && count (crew _x) == 0) then
			{
				_icon = switch (true) do
				{
					case !(_x isKindOf "Man"): { format["<img image='%1' size='1'></img>  ", getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture")] };
					case (side _x == independent): { "<img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' color='#FF0000' size='1'></img>  " };
					case (side _x == west):
					{
						switch (_x getVariable["tgLevel", 0]) do
						{
							case (1) : {format["<img image='%1' size='1'></img>  ", [0,"texture"] call BIS_fnc_rankParams]};
							case (2) : {format["<img image='%1' size='1'></img>  ", MISSION_ROOT + "images\pfc_gs.paa"]};
							case (3) : {format["<img image='%1' size='1'></img>  ", [1,"texture"] call BIS_fnc_rankParams]};
							case (4) : {format["<img image='%1' size='1'></img>  ", [2,"texture"] call BIS_fnc_rankParams]};
							case (5) : {format["<img image='%1' size='1'></img>  ", [3,"texture"] call BIS_fnc_rankParams]};
							case (6) : {format["<img image='%1' size='1'></img>  ", [4,"texture"] call BIS_fnc_rankParams]};
							default { "" };
						};
					};
					default { "" };
				};
				
				_text = switch (true) do
				{
					case (side _x == west):
					{
						switch (_x getVariable["tgLevel", 0]) do
						{
							case (1) : {format["Private %1", name _x]};
							case (2) : {format["Constable %1", name _x]};
							case (3) : {format["Corporal %1", name _x]};
							case (4) : {format["Sergeant %1", name _x]};
							case (5) : {format["Lieutenant %1", name _x]};
							case (6) : {format["2nd Lieutenant %1", name _x]};
							default { name _x };
						};
					};
					case !(_x isKindOf "Man"): 
					{
						_name = "";
						{
							_extra = if (_forEachIndex > 0) then {", "} else {""};
							_name = _name + _extra + name _x;
						} forEach (crew _x);
						_name;
					};
					default {name _x};
				};
				
				_idc ctrlSetStructuredText parseText format["<t align='center'>%2 %1</t>", _text, _icon];
				_idc ctrlSetPosition [(_sPos select 0) - 0.27, _sPos select 1]; // 235
				_idc ctrlSetScale 0.9;
				_idc ctrlSetFade 0;
				_idc ctrlCommit 0;
				_idc ctrlShow true;
			}
			else
			{
				_idc ctrlShow false;
			};
		}
		else
		{
			_idc ctrlShow false;
		};
	} 
	else
	{
		_idc ctrlShow false;
	};
} foreach jedi_tag_units;

if (count jedi_tag_cache > count jedi_tag_units) then
{
	for "_i" from (count jedi_tag_units) to (count jedi_tag_cache)-1 do
	{
		_idc = _ui displayCtrl (78000 + _i);
		_idc ctrlShow false;
	};
};