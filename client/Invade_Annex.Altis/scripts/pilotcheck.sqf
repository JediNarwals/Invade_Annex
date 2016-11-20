// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.
// Edited by JediNarwals

_pilots = ["B_Helipilot_F","B_Pilot_F"];
_aircraft_nocopilot = ["B_Heli_Light_01_F", "B_Heli_Light_01_armed_F", "B_Heli_Light_01_stripped_F", "B_Heli_Attack_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_black_F", "B_Heli_Transport_03_unarmed_green_F", "B_CTRG_Heli_Transport_01_sand_F", "B_CTRG_Heli_Transport_01_tropic_F", "B_T_VTOL_01_infantry_F", "B_T_VTOL_01_vehicle_F", "B_T_VTOL_01_armed_F", "B_T_VTOL_01_infantry_blue_F", "B_T_VTOL_01_infantry_olive_F", "B_T_VTOL_01_vehicle_blue_F", "B_T_VTOL_01_vehicle_olive_F", "B_T_VTOL_01_armed_blue_F", "B_T_VTOL_01_armed_olive_F", "O_Heli_Light_02_F", "O_Heli_Light_02_unarmed_F", "O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F", "O_Plane_CAS_02_F", "O_Heli_Transport_04_F", "O_Heli_Transport_04_ammo_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_box_F", "O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_fuel_F", "O_Heli_Transport_04_medevac_F", "O_Heli_Transport_04_repair_F", "O_Heli_Transport_04_black_F", "O_Heli_Transport_04_ammo_black_F", "O_Heli_Transport_04_bench_black_F", "O_Heli_Transport_04_box_black_F", "O_Heli_Transport_04_covered_black_F", "O_Heli_Transport_04_fuel_black_F", "O_Heli_Transport_04_medevac_black_F", "O_Heli_Transport_04_repair_black_F", "O_T_VTOL_02_infantry_F", "O_T_VTOL_02_vehicle_F", "O_T_VTOL_02_infantry_hex_F", "O_T_VTOL_02_infantry_ghex_F", "O_T_VTOL_02_infantry_grey_F", "O_T_VTOL_02_vehicle_hex_F", "O_T_VTOL_02_vehicle_ghex_F", "O_T_VTOL_02_vehicle_grey_F", "I_Heli_Transport_02_F", "I_Plane_Fighter_03_CAS_F", "I_Plane_Fighter_03_AA_F", "I_Heli_light_03_F", "I_Heli_light_03_unarmed_F", "C_Heli_Light_01_civil_F", "C_Heli_light_01_blue_F", "C_Heli_light_01_red_F", "C_Heli_light_01_ion_F", "C_Heli_light_01_blueLine_F", "C_Heli_light_01_digital_F", "C_Heli_light_01_elliptical_F", "C_Heli_light_01_furious_F", "C_Heli_light_01_graywatcher_F", "C_Heli_light_01_jeans_F", "C_Heli_light_01_light_F", "C_Heli_light_01_shadow_F", "C_Heli_light_01_sheriff_F", "C_Heli_light_01_speedy_F", "C_Heli_light_01_sunset_F", "C_Heli_light_01_vrana_F", "C_Heli_light_01_wasp_F", "C_Heli_light_01_wave_F", "C_Heli_light_01_stripped_F", "C_Heli_light_01_luxe_F", "C_Plane_Civil_01_F", "C_Plane_Civil_01_racing_F"];

waitUntil {player == player};

_iampilot = ({typeOf player == _x} count _pilots) > 0;

// Remove comments and insert UIDs into the whitelist to exempt individuals from this script
_uid = getPlayerUID player;
_whitelist = [""];

//if (_uid in _whitelist) exitWith {};


while { true } do {
	_oldvehicle = vehicle player;
	waitUntil {vehicle player != _oldvehicle};

	if(vehicle player != player) then {
		_veh = vehicle player;

		//------------------------------ pilot can be pilot seat only
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
				_forbidden = [_veh turretUnit [0]];
				if(player in _forbidden) then {
					if (!_iampilot) then {
						systemChat "Only pilots can fly. Locking Controls.";
						player action ["getOut", _veh];
					};
				};
			};
			if(!_iampilot) then {
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					systemChat "You must be a pilot to fly this aircraft.";
					player action ["getOut", _veh];
				};
			};
		};
	};
};