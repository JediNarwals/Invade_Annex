#define INFINITE 1e+1000

class jediHud {
	idd = -1;
	onLoad = "uiNamespace setVariable ['jediHud', _this select 0]";
	onUnload = "uiNamespace setVariable ['jediHud', objNull]";
	onDestroy = "uiNamespace setVariable ['jediHud', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = INFINITE;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 55555;
			x = safezoneX + safezoneW - 1.90;
			y = safezoneY + safezoneH - 0.063;
			w = 1.35;
			h = 0.06;
			shadow = 2;
//			colorBackground[] = { 0, 0, 0, 0.5 };  // uncomment and increase 4th number to have a background
			font = "PuristaSemibold";
			size = 0.04;
			type = 13;
			style = 2;
			text="";
			class Attributes {
				align="center";
				color = "#ffffff";//#5fe60c
			};
		};
	};
};