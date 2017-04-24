// F3 - Folk ARPS Assign Gear Script (Server-side)
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// INTAKE AND INTERPERET PARAMETERS
// _typeOfUnit is class, _faction is team, _unit is the unit itself

params["_typeofUnit","_faction","_unit"];
_typeofUnit = toLower _typeofUnit;
_faction = toLower _faction;

// ====================================================================================

// DECIDE IF THE SCRIPT SHOULD RUN
// Depending on locality the script decides if it should run
if !(local _unit) exitWith {};

// ====================================================================================

// SET A PUBLIC VARIABLE
// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component
_unit setVariable ["f_var_assignGear",_typeofUnit,true];

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS 2
// Used by the faction-specific scripts
private ["_typeofUnit","_unit","_isMan","_loadout","_typeofunit"];

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.
_unit setVariable ["f_var_assignGear_done",false,true];

// ====================================================================================

// DEBUG
if (f_param_debugMode == 1) then
{
	_unit sideChat format ["DEBUG (assignGear.sqf): unit faction: %1",_faction];
};

// ====================================================================================

// ASSIGN GEAR ACCORDING TO FACTION
#include "f_assignGear_gear.sqf"

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.
_unit setVariable ["f_var_assignGear_done",true,true];

// ====================================================================================
