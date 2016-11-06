/*
		File: fn_flip.sqf
		Author: Mike "Revir" Berlin
		
		Description: Flips a vehicle
		
		Edited: JediNarwals
			6/2/2016
*/
private["_car","_dir"];
_car = cursorTarget;
_dir = vectorUp _car;
if ((_dir select 2 < 0.8) || (_dir select 1 < 0.8)) then 
{
	hint format ["Stand clear the vehicle will unflip in 5 seconds.."];
	sleep 5;
		_fac = getDir _car;
		_pos = _car modelToWorld [0,0,2];
		_car setDir _fac;
		_car setVectorUp [0,0,0];
		_car setPos _pos; 
		_car setvelocity [0,0,1];
		_car setDir _fac;
}
else
{
	hint format ["Car is not upside down"];
};