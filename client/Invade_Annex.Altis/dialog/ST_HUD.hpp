class STUI_Canvas
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 2147483647;
	fadein = 0;
	fadeout = 0;
	onLoad = "_this call STUI_Canvas_OnLoad";
	class controls
	{
		class canvas
		{
			idc = 0;
			x = "SafeZoneX";
			y = "SafeZoneY - 100";
			w = "SafeZoneW";
			h = "SafeZoneH";
			style = 0;
			type = 100;
			scaleMin = 1e-006;
			scaleMax = 1000;
			scaleDefault = 2;
			font = "TahomaB";
			sizeEx = 0.0;
			maxSatelliteAlpha = 0.0;
			colorBackground[] = { 0,0,0,0 };
			colorLevels[] = { 0,0,0,0 };
			colorSea[] = { 0,0,0,0 };
			colorForest[] = { 0,0,0,0 };
			colorRocks[] = { 0,0,0,0 };
			colorCountlines[] = { 0,0,0,0 };
			colorMainCountlines[] = { 0,0,0,0 };
			colorCountlinesWater[] = { 0,0,0,0 };
			colorMainCountlinesWater[] = { 0,0,0,0 };
			colorPowerLines[] = { 0,0,0,0 };
			colorRailWay[] = { 0,0,0,0 };
			colorForestBorder[] = { 0,0,0,0 };
			colorRocksBorder[] = { 0,0,0,0 };
			colorNames[] = { 0,0,0,0 };
			colorInactive[] = { 0,0,0,0 };
			colorOutside[] = { 0,0,0,0 };
			colorText[] = { 0,0,0,0 };
			colorGrid[] = { 0,0,0,0 };
			colorGridMap[] = { 0,0,0,0 };
			colorTracks[] = { 0,0,0,0 };
			colorTracksFill[] = { 0,0,0,0 };
			colorRoads[] = { 0,0,0,0 };
			colorRoadsFill[] = { 0,0,0,0 };
			colorMainRoads[] = { 0,0,0,0 };
			colorMainRoadsFill[] = { 0,0,0,0 };
			ShowCountourInterval = 0;
			shadow = 0;
			text = "";
			alphaFadeStartScale = 0.0;
			alphaFadeEndScale = 0.0;
			fontLabel = "TahomaB";
			sizeExLabel = 0.0;
			fontGrid = "TahomaB";
			sizeExGrid = 0.0;
			fontUnits = "TahomaB";
			sizeExUnits = 0.0;
			fontNames = "TahomaB";
			sizeExNames = 0.0;
			fontInfo = "TahomaB";
			sizeExInfo = 0.0;
			fontLevel = "TahomaB";
			sizeExLevel = 0.0;
			stickX[] = { 0.0,{ "Gamma",0,0.0 } };
			stickY[] = { 0.0,{ "Gamma",0,0.0 } };
			ptsPerSquareSea = 0;
			ptsPerSquareTxt = 0;
			ptsPerSquareCLn = 0;
			ptsPerSquareExp = 0;
			ptsPerSquareCost = 0;
			ptsPerSquareFor = 0;
			ptsPerSquareForEdge = 0;
			ptsPerSquareRoad = 0;
			ptsPerSquareObj = 0;
			class Task
			{
				icon = "";
				color[] = { 0,0,0,0 };
				iconCreated = "";
				colorCreated[] = { 0,0,0,0 };
				iconCanceled = "";
				colorCanceled[] = { 0,0,0,0 };
				iconDone = "";
				colorDone[] = { 0,0,0,0 };
				iconFailed = "";
				colorFailed[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class CustomMark
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Bunker
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Bush
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class BusStop
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Command
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Cross
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fortress
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fuelstation
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fountain
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Hospital
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Chapel
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Church
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Lighthouse
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Quay
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Rock
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Ruin
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class SmallTree
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Stack
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Tree
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Tourism
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Transmitter
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class ViewTower
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Watertower
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Waypoint
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class WaypointCompleted
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class ActiveMarker
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerSolar
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerWave
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerWind
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Shipwreck
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
		};
	};
};
class ST_STHud_Rsc
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	onLoad = "_this call ST_STHud_Load";
	duration = 2147483647;
	fadein = 0;
	fadeout = 0;
	class controls
	{
		class Text : RscStructuredText
		{
			idc = 0;
			x = 0.58;
			y = "(SafeZoneY + SafeZoneH - 0.2)";
			w = 0.25;
			h = 0.2;
		};
		class Text2 : Text
		{
			idc = 1;
			x = 0.75;
		};
		class Minimap
		{
			idc = 2;
			x = "(0.5- (0.5 * 0.2))";
			y = "(SafeZoneY + SafeZoneH - 0.2)- 100";
			w = 0.2;
			h = 0.2;
			style = 0;
			type = 100;
			scaleMin = 1e-006;
			scaleMax = 1000;
			scaleDefault = 2;
			font = "TahomaB";
			sizeEx = 0.0;
			maxSatelliteAlpha = 0.0;
			colorBackground[] = { 0,0,0,0 };
			colorLevels[] = { 0,0,0,0 };
			colorSea[] = { 0,0,0,0 };
			colorForest[] = { 0,0,0,0 };
			colorRocks[] = { 0,0,0,0 };
			colorCountlines[] = { 0,0,0,0 };
			colorMainCountlines[] = { 0,0,0,0 };
			colorCountlinesWater[] = { 0,0,0,0 };
			colorMainCountlinesWater[] = { 0,0,0,0 };
			colorPowerLines[] = { 0,0,0,0 };
			colorRailWay[] = { 0,0,0,0 };
			colorForestBorder[] = { 0,0,0,0 };
			colorRocksBorder[] = { 0,0,0,0 };
			colorNames[] = { 0,0,0,0 };
			colorInactive[] = { 0,0,0,0 };
			colorOutside[] = { 0,0,0,0 };
			colorText[] = { 0,0,0,0 };
			colorGrid[] = { 0,0,0,0 };
			colorGridMap[] = { 0,0,0,0 };
			colorTracks[] = { 0,0,0,0 };
			colorTracksFill[] = { 0,0,0,0 };
			colorRoads[] = { 0,0,0,0 };
			colorRoadsFill[] = { 0,0,0,0 };
			colorMainRoads[] = { 0,0,0,0 };
			colorMainRoadsFill[] = { 0,0,0,0 };
			ShowCountourInterval = 0;
			shadow = 0;
			text = "";
			alphaFadeStartScale = 0.0;
			alphaFadeEndScale = 0.0;
			fontLabel = "TahomaB";
			sizeExLabel = 0.0;
			fontGrid = "TahomaB";
			sizeExGrid = 0.0;
			fontUnits = "TahomaB";
			sizeExUnits = 0.0;
			fontNames = "TahomaB";
			sizeExNames = 0.0;
			fontInfo = "TahomaB";
			sizeExInfo = 0.0;
			fontLevel = "TahomaB";
			sizeExLevel = 0.0;
			stickX[] = { 0.0,{ "Gamma",0,0.0 } };
			stickY[] = { 0.0,{ "Gamma",0,0.0 } };
			ptsPerSquareSea = 0;
			ptsPerSquareTxt = 0;
			ptsPerSquareCLn = 0;
			ptsPerSquareExp = 0;
			ptsPerSquareCost = 0;
			ptsPerSquareFor = 0;
			ptsPerSquareForEdge = 0;
			ptsPerSquareRoad = 0;
			ptsPerSquareObj = 0;
			class Task
			{
				icon = "";
				color[] = { 0,0,0,0 };
				iconCreated = "";
				colorCreated[] = { 0,0,0,0 };
				iconCanceled = "";
				colorCanceled[] = { 0,0,0,0 };
				iconDone = "";
				colorDone[] = { 0,0,0,0 };
				iconFailed = "";
				colorFailed[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class CustomMark
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Bunker
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Bush
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class BusStop
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Command
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Cross
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fortress
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fuelstation
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Fountain
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Hospital
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Chapel
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Church
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Lighthouse
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Quay
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Rock
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Ruin
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class SmallTree
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Stack
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Tree
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Tourism
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Transmitter
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class ViewTower
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Watertower
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Waypoint
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class WaypointCompleted
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class ActiveMarker
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerSolar
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerWave
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class PowerWind
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
			class Shipwreck
			{
				icon = "";
				color[] = { 0,0,0,0 };
				size = 0;
				importance = 0;
				coefMin = 0;
				coefMax = 0;
			};
		};
	};
};