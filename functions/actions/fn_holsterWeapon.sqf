private["_state","_text"];
_state = [_this,3,true,[true]] call BIS_fnc_param;
if (vehicle player != player) exitWith {};
if (!_state) exitWith {};
if (_state) then
{
	player action ["hideWeapon",player,player,100];
}
else
{
	player action ["hideWeapon",player,player,0];
};
life_holstered = _state;