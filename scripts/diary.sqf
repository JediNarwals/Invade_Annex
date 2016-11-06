/*
| Author: 
|
|	Quiksilver.
|   JediNarwals [TG]
|_____
|
| Description: 
|	
|	Created: 26/11/2013.
|	Last modified:5/11/2016.
|	You may use and edit the code.
|	You may not remove any entries from Credits without first removing the relevant author's contributions, 
|	or asking permission from the mission authors/contributors.
|	You may not remove the Credits tab, without consent of Ahoy World
| 	Feel free to re-format or make it look better.
|___________________________________________________*/

if (!hasInterface) exitWith {/*Go away Server*/};

waitUntil {!isNull player};

player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["mods", "Mods"];
player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiarySubject ["staff","Meet the Staff"];
player createDiarySubject ["faq", "FAQ"];
player createDiarySubject ["changelog", "Change Log"];
player createDiarySubject ["credits", "Credits"];

//-------------------------------------------------- Rules

player createDiaryRecord ["rules",
[
"Enforcement",
"
<br />The purpose of the above rules are to ensure a fun and relaxing environment for public players.
<br />
<br />Server rules are in place merely as a means to that end.
<br />
<br />Guideline for enforcement:
<br />
<br />-	Innocent rule violation and disruptive behavior: 
<br />
<br />		= Verbal / Written request to cease, or warning.
<br /> 
<br />-	Minor or first-time rule violation:
<br />
<br />		= Kick, or 0 - 3 day ban.
<br />
<br />-	Serious or repetitive rule violation: 
<br />
<br />		= 3 - 7 day ban.
<br />
<br />-	Administrative ban (hack/exploit/verbal abuse/serious offense):
<br />
<br />		= permanent or 30 day.
<br />
<br />
<br />The above is subject to discretion.
"
]];

player createDiaryRecord ["rules",
[
"General",
"
<br />1. Hacking and mission exploitation will not be tolerated.
<br />2. Intentional team-killing will not be tolerated.
<br />3. Excessive, unintentional team-killing may result in a Kick/Temp ban.
<br />4. Unnecessary destruction of BLUFOR vehicles will not be tolerated.
<br />5. Verbal abuse and bullying will not be tolerated. 
<br />6. Firing a weapon on base--unless at an enemy--may result in a Kick/Temp ban.
<br />7. Griefing and obstructive play will not be tolerated.
<br />8. Excessive mic spamming, especially of Side and Global channels, will not be tolerated.
<br />9. A server moderator or admin's word is final.
<br />10. Landing inside of the main spawn may result in a warning or kick.
<br />
<br />If you see a player in violation of the above, contact a moderator or admin (teamspeak).
"
]];

//-------------------------------------------------- Mods

player createDiaryRecord ["mods",
[
"Serverside",
"
<br /> Mods currently running on server SUGGESTED TO HAVE (subject to change without notice):<br /><br />

<br />- Advanced Rappelling
        http://www.armaholic.com/page.php?id=31254

<br />- Advanced Urban Rappelling
        http://www.armaholic.com/page.php?id=31357

<br />- Advanced Sling Loading
        http://www.armaholic.com/page.php?id=30367
"
]];

player createDiaryRecord ["mods",
[
"Mods Suggested",
"
<br /> Joining throught the Launcher will suggest all the mods or you can use these mods:
<br /> Mods currently suggested (subject to change without notice):<br /><br />

<br />- CBA - 1.00 beta5 - Required to run the below mods.
		http://www.armaholic.com/page.php?id=18768<br /><br />
		
<br />- JSRS - 2.0 and 2.1 - Enhanced sounds and audio.
		http://www.armaholic.com/page.php?id=22150<br /><br />
		
<br />- Blastcore - R3 - Enhanced visual effects.
		http://www.armaholic.com/page.php?id=23899<br /><br />
		
<br />- ShackTac Fireteam HUD - v140302 - Situational awareness HUD
		http://www.armaholic.com/page.php?id=9936

<br />- Task Force Arrowhead Radio - v0.9.8 
        http://radio.task-force.ru/en/
"
]];

//-------------------------------------------------- Teamspeak

player createDiaryRecord ["teamspeak",
[
"TS3",
"
<br /> Teamspeak:<br /><br />
<br /> http://www.teamspeak.com/?page=downloads
"
]];

player createDiaryRecord ["teamspeak",
[
"TacticalGaming",
"
<br /> Address: 162.251.164.114:10004
<br />
<br /> Visitors and guests welcome!
"
]];

//-------------------------------------------------- Staff

player createDiaryRecord ["staff",
[
"Meet the Staff",
"
<br /><font size='16'>Welcome to the TacticalGaming.net Public Server. Below are a list of the staff members that help run the server.
<br /> Treat them with respect and they will allways do the same. Their word is final. Failure to comply will result in a Kick/Ban.</font></ br>
<br /> 
<br /><font size='16'>Brigade Staff:</font>
<br /> TG Louie G [EU]
<br /> TGxSole [EU]
<br />
<br /><font size='16'>Battalion Staff:</font>
<br /> TG Nimitz [EU]
<br /> TG Duke_of_Games [US]
<br /> TG KillSwitch [EU]
<br /> TG Muffin [EU]
<br /> 
<br /><font size='16'>Squad Leaders:</font>
<br /> TG JediNarwals [US] [DEV]
<br /> TG Diggi19_23 [EU]
<br /> TG Everest78 [EU]
<br /> TG BayCat [EU]
<br />
<br /><font size='16'>Squad Assistants:</font>
<br /> TG Nazman [EU]
<br /> TG Rusty Monk [EU]
"
]];

//-------------------------------------------------- FAQ

player createDiaryRecord ["faq",
[
"Squads",
"
<br /><font size='16'>Q:</font> How do I join a squad?<br />
<br /><font size='16'>A:</font> 
<br /> 1. Press 'U'.
<br /> 2. A dialoge will pop up and will allow for you to join groups in there!
"
]];

player createDiaryRecord ["faq",
[
"FOBs",
"
<br /><font size='16'>Q:</font> How do I get new FOB's?<br />
<br /><font size='16'>A:</font>
<br />When you attack an FOB you will need to kill all occupying enemies. Once complete you will have new vehicles and friendly units can spawn there. 
<br />(Can Change at any time) 
"
]];

player createDiaryRecord ["faq",
[
"Holster",
"
<br />Use 'H' to holster your weapon!
<br />This allows for you to run faster and prevents you from a miss fire in base.
"
]];

player createDiaryRecord ["faq",
[
"Earplugs",
"
<br />Using earplugs is up to you! 
<br />By setting 'Custom Action 10' you can easily reduce the sound of your game until you push that button again.
<br />
<br />(I use Left Windows key)
"
]];

player createDiaryRecord ["faq",
[
"Mag Repacking",
"
<br />Repack your mags by pressing 'Ctrl + R'
<br />1. Place a used mag in the top of the Dialog.
<br />2. Place a Mag that you want to be filled in the bottom.
<br />3. The Dialog will auto pack the mag.
<br />
<br />You can change the key binding of this by going into the options of the dialog.
"
]];

player createDiaryRecord ["faq",
[
"Medics",
"
<br /><font size='16'>Q:</font> Why can't I heal him?<br />
<br /><font size='16'>A:</font> Everyone can Heal/Revive people. Here's how:
<br />Step 1: When a person is unconscious walk up and scollwheel on them.
<br />Step 2: Select Revive/Stablize/Drag/Carry
<br />Step 3: Wait for them to come up.
<br />If the person cannot look around try double tapping Left Alt. If that doesn't work respawn.
"
]];

player createDiaryRecord ["faq",
[
"Mortars",
"
<br /><font size='16'>Q:</font> Can I use the Mortars?
<br /><font size='16'>A:</font> Yes<br />
<br /><font size='16'>Q:</font> How do I use the Mortar without the computer?
<br /><font size='16'>A:</font> You have to manually find the target with the sight. Here are some steps to use the mortar. 
<br /> 1. Press the F key to select the firing distance.
<br /> 2. If you are in line-of-sight just put the cursor on the target and use the page up and page down keys to change the elevation.
<br /> 3. Fire!<br /> 
<br /><font size='16'>Here is a youtube video that can explain in more detail.<br />
<br /> https://www.youtube.com/watch?v=SCCvXfwzeAU
"
]];

//-------------------------------------------------- Change Log


//-------------------------------------------------- Credits

player createDiaryRecord ["credits",
[
"I & A",
"
<br />Mission authors:<br /><br />

		- <font size='16'>Rarek</font> - Ahoy World (ahoyworld.co.uk)<br /><br />
		- <font size='16'>Quiksilver</font><br /><br />
		- <font size='16'>JediNarwals - TacticalGaming (TacticalGaming.net/hq)</font><br />
		
<br />Contributors:<br /><br />
		- Jester - Ahoy World (ahoyworld.co.uk)<br />
		- Razgriz33 - Ahoy World (ahoyworld.co.uk)<br />
		- Kamaradski - Ahoy World (ahoyworld.co.uk)<br />
		- BACONMOP - Ahoy World (ahoyworld.co.uk)<br />
		- JediNarwals - TacticalGaming (TacticalGaming.net/hq)<br /><br />
		
<br />Other:<br /><br />
		=BTC= Revive<br />
		- Giallustio<br />
		- Edited by Quiksilver<br/><br />
		EOS<br />
		- BangaBob<br /><br />
		Squad Manager<br />
		- aeroson<br /> <br />
		TAW View Distance<br />
		- Tonic<br /> <br />
		aw_fnc<br />
		- Alex Wise<br /><br />
		SHK Taskmaster<br />
		- Shuko<br /><br />
		Fast rope<br />
		- Zealot<br /><br />
		Map and GPS Icons (Soldier Tracker)<br />
		- Quiksilver<br /><br />
		Jump<br />
		- ProGamer<br /><br />
		Safe zone<br />
		- Bake<br />
		DAC<br />
		- Silola<br />
"
]];