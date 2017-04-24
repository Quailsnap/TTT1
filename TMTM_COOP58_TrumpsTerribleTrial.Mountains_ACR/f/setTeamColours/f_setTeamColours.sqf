// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// SET CUSTOM VARIABLES
// These variables govern the behaviour of the script

// Colors will be set for groups of leaders with these suffixes
private _leaders = ["_FTL","_SL"];

// Set suffixes for each color
private _white = [];
private _red = ["1_FTL"];
private _blue = ["2_FTL","1_AT","1_R"];
private _yellow = ["1_G","1_AR","1_AB"];
private _green = ["2_G","2_AR","2_AB","2_R"];

// ====================================================================================

// WAIT UNTIL 5 SECONDS AFTER INITIALIZING
waitUntil {!isNull (findDisplay 46)};
sleep 5;

private _unit = player;
private _isFireteam = false;

// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

{
	if ([_x, format["%1",(leader (group _unit))]] call BIS_fnc_inString) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// SET TEAM COLOURS
{
	_unit = _x;
	_unitStr = str _x;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "RED";
		};
	} forEach _red;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "blue";
		};
	} forEach _blue;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "yellow";
		};
	} forEach _yellow;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "green";
		};
	} forEach _green;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "white";
		};
	} forEach _white;

} forEach units (group _unit);
