// TODO:
// - handle when worldToScreen freaks out
// - incorporate into STHUD

STGI_ColourRed = [1, 0, 0, 1];
STGI_ColourGreen = [0, 1, 0, 1];
STGI_ColourBlue = [0, 0, 1, 1];

STGI_ColourPaleGreen = [0.4, 0.8, 0.2, 1];
STGI_ColourLightBlue = [0, 0.6, 1, 1];

STGI_ColourYellow = [0.85, 0.85, 0, 1];
STGI_ColourOrange = [0.85, 0.4, 0, 1];
STGI_ColourLightGrey = [0.7, 0.7, 0.7, 1];
STGI_ColourWhite = [1, 1, 1, 1];
STGI_MaxDist = 30;
STGI_EdgeStep = 30;
STGI_FadeEdge = STGI_MaxDist + STGI_EdgeStep;

STGI_NightAlpha = 0.15;
STGI_DayAlphaDelta = 0.15; // Extra alpha on from night
STGI_AlphaClamp = 0; // Updated every frame

#define CANVAS_BORDER 0.02

// Allow the STHUD user menu to enable/disable this
STGI_Enabled = profileNamespace getVariable ["STGI_Enabled", true];

STGI_GetColour =
{
    private ["_unit", "_distance", "_hasTeams"];
    _unit = _this select 0;
    _distance = _this select 1;
    _hasTeams = _this select 2;

    if ((vehicle(_unit) != vehicle(player)) && (_distance < ST_STHud_Close)) exitWith
    {
        STGI_ColourOrange;
    };

    private "_colour";
    if (_hasTeams) then
    {
        private "_team_colour";
        _team_colour = _unit call ST_STHud_assignedTeam;
        _colour = +(switch (_team_colour) do
        {
            case "MAIN": {STGI_ColourLightGrey};
            case "RED": {STGI_ColourRed};
            case "BLUE": {STGI_ColourLightBlue};
            case "GREEN": {STGI_ColourGreen};
            case "YELLOW": {STGI_ColourYellow};
            default {STGI_ColourGreen}
        });
    }
    else
    {
        _colour = +STGI_ColourPaleGreen;
    };

    if (_distance < STGI_MaxDist) then
    {
        _colour set [3, STGI_AlphaClamp];
    }
    else
    {
        private "_alpha";
        _alpha = (0 max (STGI_FadeEdge - _distance)) / STGI_EdgeStep;
        _alpha = 1 min _alpha;
        _colour set [3, _alpha * STGI_AlphaClamp];
    };

    _colour;
};

STGI_Update =
{
    if (!alive(player)) exitWith {};
    if (!STGI_Enabled) exitWith {};
    if (!isNil("BIS_DEBUG_CAM")) exitWith {};

    private "_units";
    _units = units(player);
    if (count(_units) == 1) exitWith {};

    // Adjust the maximum alpha based on day/night
    STGI_AlphaClamp = STGI_NightAlpha + sunOrMoon * STGI_DayAlphaDelta;
    STGI_ColourOrange set [3, STGI_AlphaClamp + 0.2];

    private "_isUsingTeams";
    _isUsingTeams = ({_x call ST_STHud_HasAssignedTeam} count _units) > 0;

    {
        private "_unit";
        _unit = _x;
        // No indent because that'd intent the entire block. What I'd do for a
        // "continue"...
        if (_unit != player) then
        {

        private ["_icon_pos", "_screen_pos"];
        // TODO: You sometimes get a nice visualisation of where units sit
        // if you omit the vehicle. However, this isn't smoothly interpolated
        // so judders around in MP.
        _icon_pos = ASLtoATL(visiblePositionASL(vehicle(_unit)));
        private "_height_adjust";
        _height_adjust = 0.2;
        if (vehicle(_unit) == _unit) then
        {
            _height_adjust = _height_adjust + (_unit selectionPosition "pelvis" select 2);
        }
        else
        {
            _height_adjust = _height_adjust + 0.7;
        };
        _icon_pos set [2, (_icon_pos select 2) + _height_adjust];

        _screen_pos = worldToScreen(_icon_pos);

        if (count(_screen_pos) == 2) then
        {
            _clip_left  = (_screen_pos select 0) <= (SafeZoneX + CANVAS_BORDER);
            _clip_right = (_screen_pos select 0) >= (SafeZoneX + SafeZoneW - CANVAS_BORDER);
            _clip_top = (_screen_pos select 1) <= (SafeZoneY + CANVAS_BORDER);
            _clip_bottom = (_screen_pos select 1) >= (SafeZoneY + SafeZoneH - CANVAS_BORDER);
            _clipped = _clip_left || _clip_right || _clip_top || _clip_bottom;

            _distance = _icon_pos distance vehicle(player);

            _colour = [_unit, _distance, _isUsingTeams] call STGI_GetColour;

            private ["_texture", "_angle"];
            if (_clipped) then
            {
                _texture = "\A3\ui_f\data\igui\cfg\cursors\outarrow_ca.paa";
            }
            else
            {
                _texture = "\A3\ui_f\data\igui\cfg\cursors\select_ca.paa";
            };
            _angle = 0;

            switch (true) do
            {
            case _clip_left: {_screen_pos set [0, SafeZoneX + CANVAS_BORDER]};
            case _clip_right: {_screen_pos set [0, SafeZoneX + SafeZoneW - CANVAS_BORDER]; _angle = 180;};
            };
            switch (true) do
            {
            case _clip_top: {_screen_pos set [1, SafeZoneY + CANVAS_BORDER]; _angle = 90;};
            case _clip_bottom: {_screen_pos set [1, SafeZoneY + SafeZoneH - CANVAS_BORDER]; _angle = 270;};
            };


            [
                _screen_pos,
                _colour,
                _texture,
                _angle
            ] call STUI_drawIcon3d;

            if (leader(player) == _unit) then
            {
                [
                    _screen_pos,
                    _colour,
                    "\A3\ui_f\data\igui\cfg\cursors\leader_ca.paa",
                    0
                ] call STUI_drawIcon3d;
            };
        };
    };

    } foreach(_units);
};
