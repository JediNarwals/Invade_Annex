#define SYSTEM_TAG "life"
#define ITEM_TAG format["%1%2",SYSTEM_TAG,"item_"]
#define SUB(var1,var2) var1 = var1 - var2
#define ADD(var1,var2) var1 = var1 + var2
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define __GETC__(var) (call var)
#define __SUB__(var1,var2) var1 = var1 - var2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define CASH RGN_life_cash
#define BANK life_atmbank
#define GANG_FUNDS grpPlayer getVariable ["RGN_gang_bank",0];

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

//Namespace Macros
#define SVAR_MNS missionNamespace setVariable 
#define SVAR_UINS uiNamespace setVariable 
#define SVAR_PNS parsingNamespace setVariable 
#define GVAR_MNS missionNamespace getVariable 
#define GVAR_UINS uiNamespace getVariable

//Scripting Macros
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define CONSTVAR(var) var = compileFinal (if(typeName var == "STRING") then {var} else {str(var)})
#define FETCH_CONST(var) (call var)
#define PVAR_ALL(var) publicVariable var
#define PVAR_SERV(var) publicVariableServer var
#define PVAR_ID(var,id) id publicVariableClient var
#define GVAR getVariable
#define SVAR setVariable
#define RIFLE primaryWeapon player
#define RIFLE_ITEMS primaryWeaponItems player
#define PISTOL handgunWeapon player
#define PISTOL_ITEMS handgunItems player
#define LAUNCHER secondaryWeapon player
#define EXTDB "extDB" callExtension
#define RCON_SELECTION getText(configFile >> "CfgServerSettings" >> "extDB" >> "RCON_Selection")
#define DATABASE_SELECTION getText(configFile >> "CfgServerSettings" >> "extDB" >> "Database")

//Display Macros
#define CONTROL(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define CONTROL_DATA(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
#define CONTROL_DATAI(ctrl,index) ctrl lbData index

//System Macros
#define grpPlayer group player
#define steamid getPlayerUID player
#define SteamName profileNameSteam // Added in ARMA 3 1.46 Build
#define LICENSE_VARNAME(varName,flag) format["license_%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) GVAR_MNS [LICENSE_VARNAME(varName,flag),false]
#define ITEM_VARNAME(varName) format["life_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) GVAR_MNS [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",ITEM_VARNAME(varName),"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")

//Condition Macros
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
#define EXTDB_SETTINGS(SETTING) getNumber(configFile >> "CfgServerSettings" >> "extDB" >> SETTING)
#define EXTDB_LOGAR getArray(configFile >> "CfgServerSettings" >> "extDB" >> "LOG_Settings")
#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_WEAPONS "CfgWeapons"
#define CONFIG_MAGAZINES "CfgMagazines"
#define CONFIG_GLASSES "CfgGlasses"

//Pager's Macros
#define CATT call _attach
#define QUAD "C_Quadbike_01_F"
#define REB_QUAD "B_G_Quadbike_01_F"
#define RENTAL_QUAD "I_Quadbike_01_F"
#define KART "C_Kart_01_F"
#define KART_BLU "C_Kart_01_Blu_F"
#define KART_FUEL "C_Kart_01_Fuel_F"
#define KART_RED "C_Kart_01_Red_F"
#define KART_VRANA "C_Kart_01_Vrana_F"
#define HATCHBACK "C_Hatchback_01_F"
#define SPORT "C_Hatchback_01_sport_F"
#define SUV "C_SUV_01_F"
#define OFFROAD "C_Offroad_01_F"
#define PUB_OFFROAD "I_G_Offroad_01_F"
#define BG_OFFROAD "B_G_Offroad_01_F"
#define ARMED_OFFROAD "B_G_Offroad_01_armed_F"
#define REPAIR_OFFROAD "C_Offroad_01_repair_F"
#define HUNTER "B_MRAP_01_F"
#define IFRIT "O_MRAP_02_F"
#define STRIDER "I_MRAP_03_F"
#define TRUCK "C_Van_01_transport_F"
#define BOX_TRUCK "C_Van_01_box_F"
#define FUEL_TRUCK "C_Van_01_Fuel_F"
#define MH9 "B_Heli_Light_01_F"
#define GHOSTHAWK "B_Heli_Transport_01_F"
#define ORCA "O_Heli_Light_02_unarmed_F"
#define M900 "C_Heli_Light_01_civil_F"
#define TARU_BENCH "O_Heli_Transport_04_bench_F"
#define TARU "O_Heli_Transport_04_F"
#define TARU_CARGO "O_Heli_Transport_04_box_F"
#define TARU_TRANS "O_Heli_Transport_04_covered_F"
#define TARU_FUEL "O_Heli_Transport_04_fuel_F"
#define HURON_BLACK "B_Heli_Transport_03_unarmed_F"
#define HURON_GREEN "B_Heli_Transport_03_unarmed_green_F"
#define MOHAWK "I_Heli_Transport_02_F"
#define HELLCAT "I_Heli_light_03_unarmed_F"
#define MEDEVAC "O_Heli_Transport_04_medevac_F"
#define SDV "B_SDV_01_F"
#define POLICE_BOAT "C_Boat_Civil_01_police_F"
#define BLACK_RUBBERBOAT "B_Boat_Transport_01_F"
#define RUBBERBOAT "C_Rubberboat"
#define CIV_BOAT"C_Boat_Civil_01_F"
#define RESCUE "C_Boat_Civil_01_rescue_F"
#define LIFEBOAT "B_Lifeboat"
#define HEMTT_BOX "B_Truck_01_box_F"
#define HEMTT_COVERED "B_Truck_01_covered_F"
#define HEMTT_FUEL "B_Truck_01_fuel_F"
#define HEMTT_TRANS "B_Truck_01_transport_F"
#define ZAMAK_COVERED "O_Truck_02_covered_F"
#define DELIVERY "I_Truck_02_covered_F"
#define ZAMAK_TRANS "I_Truck_02_transport_F"
#define ZAMAK_FUEL "I_Truck_02_fuel_F"
#define TEMPEST_TRANS "O_Truck_03_transport_F"
#define TEMPEST_COVERED "O_Truck_03_covered_F"
#define TEMPEST_DEVICE "O_Truck_03_device_F"
#define TEMPEST_FUEL "O_Truck_03_fuel_F"
#define CRATE "B_supplyCrate_F"
#define BOX "Box_IND_Grenades_F"
#define CARGO "Land_CargoBox_V1_F"
#define NAP uiSleep
#define BRIGHT setLightBrightness
#define TARGET cursorTarget
#define vehPLAY vehicle player
#define currPLAY currentWeapon player
#define SHIFT (_shift) then {_handled = true;
#define LIGHTPOINT "#lightpoint" createVehicleLocal (getpos _veh);