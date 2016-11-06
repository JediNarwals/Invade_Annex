/*
@filename: fn_vSetup02.sqf
Author:

	???
	
Last modified:

	22/10/2014 ArmA 1.32 by Quiksilver
	
Description:

	Apply code to vehicle
	vSetup02 deals with code that is already applied where it should be.
_______________________________________________*/

//============================================= CONFIG

private ["_u","_t"];

_u = _this select 0;
_t = typeOf _u;

if (isNull _u) exitWith {};

//============================================= ARRAYS

_ghosthawk = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"]; 			// ghosthawk
_vtol = ["B_T_VTOL_01_armed_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"];// vtol
_hellcat = ["I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];					// Hellcat
_strider = ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"];					// strider
_hunter = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];					// hunter
_blackVehicles = ["B_Heli_Light_01_armed_F"];									// black skin
_wasp = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F"];						// MH-9
_orca = ["O_Heli_Light_02_unarmed_F"];											// Orca
_mobileArmory = ["B_Truck_01_ammo_F"];											// Mobile Armory
_noAmmoCargo = ["B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F"];					// Bobcat CRV
_slingHeli = ["I_Heli_Transport_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];											// sling capable
_slingable = ["B_Heli_Light_01_F"];												// slingable
_notSlingable = ["B_Heli_Light_01_armed_F", "B_Heli_Attack_01_F"];				// not slingable
_dropHeli = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"]; 			// drop capable
_uav = ["B_UAV_02_CAS_F","B_UAV_02_F","B_UGV_01_F","B_UGV_01_rcws_F"];			// UAVs
_chin = ["B_Heli_Transport_03_F","B_Heli_Transport_03_black_F"];				// Chinook

//============================================= SORT
//===== Add to Zeus

{_x addCuratorEditableObjects [[_u],false];} count allCurators;

//===== Heli sling

if (_t in _slingHeli) then {
	_u setVariable ['sling_veh',TRUE,TRUE];
};
_u setVariable ["slingable",TRUE,TRUE];

//===== vtol

if (_t in _vtol) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i, "images\digi_black.paa"];};
};

//===== black camo

if (_t in _blackVehicles) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i, "images\digi_black.paa"];};
};

//===== Chinook skin

if (_t in _chin) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i,"images\digi_black.paa"];};
};

//===== strider nato skin

if (_t in _strider) then {
	_u setObjectTextureGlobal [0,'\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'];
	_u setObjectTextureGlobal [1,'\A3\data_f\vehicles\turret_co.paa']; 
};

//===== hunter skin

if (_t in _hunter) then {
	_u setObjectTextureGlobal [0, "images\wooddark.paa"];
	_u setObjectTextureGlobal [1, "images\hunter_back.jpg"];
};

//===== aaf skin

if(_t in _wasp) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i, "images\digi_black.paa"];};
};

//===== Hellcat skin

if(_t in _hellcat) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i,"images\digi_black.paa"];};
};

//===== aaf skin

if(_t in _orca) then {
	_u setObjectTextureGlobal [0,'A3\Air_F\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa'];
};

//===== Airdrop

if (_t in _dropHeli) then {
	_u setVariable ["airdrop_veh",TRUE,TRUE];
};

//===== Ghosthawk specific, animated doors, and turret locking system

if (_t in _ghosthawk) then {
	_u setVariable ["turretL_locked",FALSE,TRUE];
	_u setVariable ["turretR_locked",FALSE,TRUE];
	[_u] execVM "scripts\vehicle\animate\ghosthawk.sqf";
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i, "images\digi_black.paa"];};
};

//===== UAV respawn fixer

if (_t in _uav) then {
	{deleteVehicle _x;} count (crew _u);
	[_u] spawn {
		_u = _this select 0;
		sleep 2;
		createVehicleCrew _u;
	};
};