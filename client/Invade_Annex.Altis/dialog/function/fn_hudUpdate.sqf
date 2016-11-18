/*
	@file 		fn_hudUpdate.sqf
	@author 	JediNarwals

	@description
		Updates the HUD when it needs to.
*/

private["_ui","_control","_text","_uid"];
disableSerialization;

_text = "";
_ui = uiNameSpace getVariable ["jediHud",displayNull];
if(isNull _ui) then {[] call jedi_fnc_hudSetup;};

		//set the color values.
		//Additional color codes can be found here:  http://html-color-codes.com/
		_colourDefault 	= parseText "#ADADAD"; //set your default colour here
		_colour108		= parseText "#FF7000";
		_colour107		= parseText "#FF9000";
		_colour106		= parseText "#FFBB00";
		_colour105		= parseText "#FFCC00";
		_colour104		= parseText "#81CCDD";
		_colour103		= parseText	"#33AACC";
		_colour102		= parseText "#3388CC";
		_colour101		= parseText "#3366CC";
		_colour100 		= parseText "#336600";
		_colour90 		= parseText "#3FD600";
		_colour80 		= parseText "#33CC00";
		_colour70 		= parseText "#33FF00";
		_colour60 		= parseText "#66FF00";
		_colour50 		= parseText "#CCFF00";
		_colour40 		= parseText "#CCCC00";
		_colour30 		= parseText "#CC9900";
		_colour20 		= parseText "#CC6600";
		_colour10 		= parseText "#CC3300";
		_colour0 		= parseText "#CC0000";
		_colourDead 	= parseText "#000000";
		_uid = getPlayerUID player;


_control = _ui displayCtrl 55555;

		//initialize variables and set values
		_damage = round ((1 - (damage player)) * 100);

		//Colour coding
		//Damage

		_colourDamage = switch (true) do
		{
			case (_damage < 1) : { "#000000" };
			case (_damage < 10): { "#CC3300" };
			case (_damage < 20): { "#CC6600" };
			case (_damage < 30): { "#CC9900" };
			case (_damage < 40): { "#CCCC00" };
			case (_damage < 50): { "#CCFF00" };
			case (_damage < 60): { "#66FF00" };
			case (_damage < 70): { "#33FF00" };
			case (_damage < 80): { "#33CC00" };
			case (_damage < 90): { "#3FD600" };
			default { "#3FD600" };
		};
/*
		_colourDamage = _colourDefault;
		if(_damage >= 100) then{_colourDamage = _colour100;};
		if((_damage >= 90) && (_damage < 100)) then {_colourDamage =  _colour100;};
		if((_damage >= 80) && (_damage < 90)) then {_colourDamage =  _colour80;};
		if((_damage >= 70) && (_damage < 80)) then {_colourDamage =  _colour70;};
		if((_damage >= 60) && (_damage < 70)) then {_colourDamage =  _colour60;};
		if((_damage >= 50) && (_damage < 60)) then {_colourDamage =  _colour50;};
		if((_damage >= 40) && (_damage < 50)) then {_colourDamage =  _colour40;};
		if((_damage >= 30) && (_damage < 40)) then {_colourDamage =  _colour30;};
		if((_damage >= 20) && (_damage < 30)) then {_colourDamage =  _colour20;};
		if((_damage >= 10) && (_damage < 20)) then {_colourDamage =  _colour10;};
		if((_damage >= 1) && (_damage < 10)) then {_colourDamage =  _colour0;};
		if(_damage < 1) then{_colourDamage =  _colourDead;};
*/
		//display the information
		((uiNamespace getVariable "osefStatusBar")displayCtrl 55555)ctrlSetStructuredText parseText
			format["
			<t shadow='1' shadowColor='#000000' color='%5' size='1.6' align='center'><img size='1.6'  shadowColor='#000000' image='images\health.paa' color='%5'/> %3%1</t>
			<t shadow='1' shadowColor='#000000' color='%4' size='1.2' align='center'>Website: TacticalGaming.net\hq</t>
			<t shadow='1' shadowColor='#000000' color='%4' size='1.2' align='center'>TeamSpeak: 162.251.164.114:10004</t>
			<t shadow='1' shadowColor='#000000' color='%4' size='2.0' align='center'><img size='2.0'  shadowColor='#000000' image='images\players.paa' color='%4'/> %2</t>",

					"%",
					count playableUnits,
					_damage,
					_colourDefault,
					_colourDamage
				];
_control ctrlCommit 0;
