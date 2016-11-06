class CfgFunctions
{
	class AW
	{
		tag = "AW";
		class general
		{
			file = "\IA_serv\functions\generic";
			class startMission			{ description = "Starts a mission with 4 given parameters."; };
			class childrenComplete		{ description = "Returns whether or not a task's child tasks are complete."; };
			class findSpace				{ description = "Finds space using a variety of parameters; designed for Tactical Mission / Priority Target development."; };
			class getFuzzyPos			{ description = "Gets a random position within a given radius."; };
			class updateMission			{ description = "Updates missions!"; };
			class setFSMVariable		{ description = "Sets FSM variables exclusively on the server."; };
			class randomPosTrigger		{ description = "Finds a random position within a trigger/marker area."; };
		};

		class bases
		{
			file = "\IA_serv\functions\bases";
			class baseSpawn 					{ description = "This better work!"; };
			class findNearestBase		{ description = "Finds the nearest base to the given position."; };
		};

		class garbage
		{
			file = "\IA_serv\functions\garbage";
			class addDead				{ description = "Buries dead objects once the body limit is reahed."; };
			class collectGarbage		{ description = "Cleans up given/all groups / dead units."; };
		};

		class players
		{
			file = "\IA_serv\functions\players";
			class givePoints			{ description = "Gives points to a player with an optional notification"; };
			class showNotification		{ description = "Shows the desired notification"; };
			class playSound				{ description = "Plays sounds globally."; };
			class setRadioChannels		{ description = "Sets up radio channels on servers/clients."; };
			class getRoleItems			{ description = "Gets all role-exclusive items."; };
			class respawnMenuInventory	{ description = "A tweaked version of BIS_fnc_respawnMenuInventory to allow for role assignment."; };
		};

		class units
		{
			file = "\IA_serv\functions\units";
			class spawnEnemy			{ description = "Spawns the required amount of enemies"; };
			class setBehaviour			{ description = "Sets behaviour of given troops."; };
			class createVehicle			{ description = "Creates a vehicle and adds a KILLED EH, passing the object to AW_fnc_addDead."; };
			class respawnVehicle		{ description = "Handles the respawning of vehicles in friendly bases alongside their relevant markers."; };
		};

		class markers
		{
			file = "\IA_serv\functions\markers";
			class createJIPstateMarker	{ description = "Creates a marker using a specific template."; };
			class deleteMarker			{ description = "Handles JIP-compatible deletion of markers."; };
			class JIPmarkers			{ description = "Allows JIPPs to create local versions of globally-existing markers."; };
			class addJIPmarker			{ description = "Adds a marker to the JIP marker array."; };
			class attachMarker			{ description = "Attach a marker to an object until either death or a specified condition."; };
		};

		class actions
		{
			file = "\IA_serv\functions\actions";
			class createAction	{ description = "Creates a JIP-compatible action on the client and triggers clients to create the action themselves."; };
			class deleteAction	{ description = "Deletes a damned action!"; };
			class JIPactions	{ description = "Allows JIPPs to create already-existing actions on their own machines."; };
		};
	};
	class JN
	{
		tag = "jedi";
		class updaters
		{
			file = "\IA_serv\functions\generic";
			class zeusupdater { description = "Adds objects to Zeus so other Curators can see."; };
		};
		class cleanup
		{
			file = "\IA_serv\functions\garbage";
			class cleanSlate { description = "Cleans the server from all the gunk on the ground."; };
		};
		class playerActions
		{
			file = "\IA_serv\functions\actions";
			class animSync { description = "Syncs the animations to MP setting."; };
			class bloodbag { description = "The action for the blood bags to bring the player to 100"; };
			class keyUpHandler { description = "Handles the Keys when released."; };
			class keyDownHandler { description = "Handles the Keys when they are pressed"; };
			class setupActions { description = "Adds actions to the player."; };
			class activateNitro { description = "Activates the hidden feature of Nitro in game."; };
			class flip { description = "Flips the vehicle that is upside down."; };
			class holsterWeapon { description = "Holsters the current weapon in players hand."; };
			class jump { description = "Jump Action."; };
			class personalRepair { description = "Feild repair kit for players."; };
		};
		class DEPRECATED
		{
			file = "\IA_serv\functions\DEPRECATED";
			class vMonitor { description = "Vehicle monitor and respawner for abandoned vehicles."; };
			class vSetup02 { description = "Sets up the vehicle with its textures and animations."; };
		};
		class playerThings
		{
			file = "\IA_serv\functions\players";
			class globalHint { description = "Sets a message to a MP setting."; };
			class intro { description = "Side panel that comes up on player start."};
		};
	};
};
class AW_main
{
	#include "\IA_serv\config\main.hpp"
};