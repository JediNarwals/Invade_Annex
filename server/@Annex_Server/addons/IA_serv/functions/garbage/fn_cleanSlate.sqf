/*
	file: fn_cleanSlate.sqf
	
	Author: JediNarwals [TG]
	
	Description:
		Cleans up the random stuff that goes on the ground. Especially the craters. Oh yeah, and turns the fatigue off... You're Welcome
*/

while {true} do 
{
	sleep 360 + (random 180);
	{deleteVehicle _x;} count allDead;
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "CraterLong");
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolder");
	sleep 1;
	{deleteVehicle _x;} count (allMissionObjects "WeaponHolderSimulated");
	sleep 1;
	{if (!isPlayer _x) then {_x enableFatigue FALSE;};} count allUnits;
	{if ((count units _x) == 0) then {deleteGroup _x;};} count allGroups;
};


/*
	file: vehicleDeath.sqf
	
	Author: JediNarwals
	
	Description:
		Cleans the vehicles up every 5 minutes. After they die.
*/

while {true} do
{
	sleep 10;
	{
		_timeOfDeath = _x getVariable "JN_ToD";
		if (isNil "_timeOfDeath") then 
		{
			_x setVariable ["JN_ToD",time]
		}
		else
		{
			if ((time - _timeOfDeath) > 300) then
			{
				deleteVehicle _x
			}
		}
	}foreach AllDead;
};