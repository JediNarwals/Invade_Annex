/*
	File: fn_intro.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays introduction on init!
*/

private ["_plr"];

sleep 2;
_plr = format["<t align='center' shadow='0'><img size='6' image='images\AWflag.jpg'/></t><br/><br/>Welcome to the TacticalGaming, %1,<br/><br/>
		<t color='#FF0000'>TacticalGaming</t> is a group of like-minded individuals that have one thing in mind. Realism.<br/> 
		This is our public server where we like to give back to the community with a fun and unique COOP experiance where working as a team is key.<br/>
		To be part of our community join us on TeamSpeak: ts2.gameservers.com:9150<br/>
		Or find us online at: TacticalGaming.net\HQ <br/>
		-----------<br/>
		Some quick keys to help you out!<br/>
		H: Holster your weapon.<br/>
		U: Group management (Default) <br/>
		Custom Action 10: Ear Plugs <br/>
		<br/><br/>", name player, worldName];

hint parseText _plr;
