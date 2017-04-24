// F3 - Safe Start, Server Loop
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================

// Run the loop only on the server
if !(isServer) exitWith {};

// Redundant sleep to give everything a second to settle
sleep 2;

// Broadcast message to players
[["SafeStart",["Safestart enabled for 15 min or until you approach mission area."]],"bis_fnc_showNotification",true] call BIS_fnc_MP;

while {f_param_mission_timer > 0} do
{
	sleep 15;
	f_param_mission_timer = f_param_mission_timer - 0.25;
	publicVariable "f_param_mission_timer";
};

// Broadcast message to players
[["SafeStartMissionStarting",["Safestart disabled! Weapons live!"]],"bis_fnc_showNotification",true] call BIS_fnc_MP;

// Remotely execute script to disable safety for all selectable units
[[false],"f_fnc_safety",playableUnits + switchableUnits] call BIS_fnc_MP;