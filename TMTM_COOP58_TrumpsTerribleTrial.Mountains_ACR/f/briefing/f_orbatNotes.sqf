// F3 - Loadout & ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.

// Group IDs need to be set before the ORBAT listing can be created
// waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private ["_finalText","_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots","_text","_stuff","_weps","_items","_fnc_wepMags","_wepMags","_magArr","_s","_mags","_bp","_maxload"];
_orbatText = "<br />NOTE: The ORBAT below is only accurate at mission start.<br />
<br />
<font size='18'>GROUP LEADERS + MEDICS</font><br /><br />";
_groups = [];
_hiddenGroups = [];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({_x in playableUnits} count units _x) > 0) then {
	//if ((side _x == side group player) && !(_x in _groups)) then {
		_groups pushBack _x;
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID, leader name and medics if present
{
	// Highlight the player's group with a different color (based on the player's side)
	_color = "#FFFFFF";
	if (_x == group player) then {
		_color = switch (side player) do {
			 case west: {"#0080FF"};
			 case east: {"#B40404"};
			 case independent: {"#298A08"};
			 default {"#8904B1"};
 		};
	};

	_orbatText = _orbatText + format ["<font color='%3'>%1 %2</font>", _x, name leader _x,_color] + "<br />";

	{
		if (_x getVariable ["f_var_assignGear",""] == "m" && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["|- %1 [M]",name _x] + "<br />";
		};
	} forEach units _x;
} forEach _groups;

_veharray = [];
{

	if ({vehicle _x != _x} count units _x > 0 ) then {
		{
			if (vehicle _x != _x && {!(vehicle _x in _veharray)}) then {
			_veharray set [count _veharray,vehicle _x];
			};
		} forEach units _x;
	};

} forEach _groups;

if (count _veharray > 0) then {

_orbatText = _orbatText + "<br />VEHICLE CREWS + PASSENGERS<br />";

	{
		 // Filter all characters which might break the diary entry (such as the & in Orca Black & White)
		_vehName = [getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayname"),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_- "] call BIS_fnc_filterString;

		_orbatText = _orbatText + "<br />" + format["%1 ",_vehName];

		// Workaround for http://feedback.arma3.com/view.php?id=21602
		_maxSlots = getNumber(configfile >> "CfgVehicles" >> typeof _x >> "transportSoldier") + (count allTurrets [_x, true] - count allTurrets _x);
		_freeSlots = _x emptyPositions "cargo";

		if (_maxSlots > 0) then {
			_orbatText = _orbatText + format ["[%1/%2]",(_maxSlots-_freeSlots),_maxSlots];
		};

		_orbatText = _orbatText  + "<br />";

		{
			if ((assignedVehicleRole _x select 0) != "CARGO") then {

				_veh = vehicle _x;
				_crewrole = switch (true) do {
					case (driver _veh == _x && !((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [D]"};
					case (driver _veh == _x && ((vehicle _x isKindOf "helicopter") || (vehicle _x isKindOf "plane"))):{" [P]"};
					case (commander _veh == _x):{" [CO]"};
					case (gunner _veh == _x):{" [G]"};
					case (assignedVehicleRole _x select 0 == "Turret" && commander _veh != _x && gunner _veh != _x && driver _veh != _x):{" [C]"};
					default {" [C]"};
				};

				_orbatText = _orbatText + format["|- %1",name _x] + _crewrole + "<br/>";
			};
		} forEach crew _x;

		_groupList = [];

		{
			if (!(group _x in _groupList) && {(assignedVehicleRole _x select 0) == "CARGO"} count (units group _x) > 0) then {
				_groupList set [count _groupList,group _x];
			};
		} forEach crew _x;

		if (count _groupList > 0) then {
			{
				_orbatText =_orbatText + format["|- %1", _x] + " [CARGO] <br />";
			} forEach _groupList;
		};

	} forEach _veharray;

};

// Local function to set the proper magazine count.
_fnc_wepMags = {
		private ["_w","_magarr"];
		_w = _this select 0;

		//Get possible magazines for weapon
		_wepMags = getArray (configFile >> "CfgWeapons" >> _w >> "magazines");

  		// Compare weapon magazines with player magazines
  		_magArr = [];
  		{
  			// findInPairs returns the first index that matches the checked for magazine
  			_s = [_mags,_x] call BIS_fnc_findInPairs;

  			//If we have a match
  			if (_s != -1) then {
  				// Add the number of magazines to the list
  				_magArr set [count _magArr,([_mags,[_s, 1]] call BIS_fnc_returnNestedElement)];

  				// Remove the entry
  				_mags = [_mags, _s] call BIS_fnc_removeIndex;

  			};
  		} forEach _wepMags;

  		if (count _magArr > 0) then {
  			_text = _text + " [";

  			{
  				_text = _text + format ["%1",_x];
  				if (count _magarr > (_forEachIndex + 1)) then {_text = _text + "+";}
  			} forEach _magArr;

  			_text = _text + "]";
  		};
};


// ====================================================================================

// SET UP KEY VARIABLES

_text = "<br />NOTE: The loadout shown below is only accurate at mission start.<br />
<br />";
_stuff = [];

// All weapons minus the field glasses
_weps = weapons player - ["Rangefinder","Binocular","Laserdesignator"];

// Get a nested array containing all attached weapon items
_wepItems = weaponsItems player;

// Get a nested array containing all unique magazines and their count
_mags = (magazines player) call BIS_fnc_consolidateArray;

// Get a nested array containing all non-equipped items and their count
_items = (items player) call BIS_fnc_consolidateArray;

// ====================================================================================

// WEAPONS
// Add lines for all carried weapons and corresponding magazines

if (count _weps > 0) then {
	_text = _text + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
	{
		_text = _text + format["<br/>%1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];

		//Add magazines for weapon
  		[_x] call _fnc_wepMags;

  		// Check if weapon has an underslung grenade launcher
		if ({_x in ["GL_3GL_F","EGLM","UGL_F"]} count (getArray (configFile >> "CfgWeapons" >> _x >> "muzzles")) > 0) then {
			_text = _text + "<br/> |- UGL";
			["UGL_F"] call _fnc_wepMags;
		};

		// List weapon attachments
		// Get attached items
		_attachments = _wepItems select (([_wepItems,_x] call BIS_fnc_findNestedElement) select 0);
		_attachments = [_attachments,0] call BIS_fnc_removeIndex; // Remove the first element as it points to the weapon itself

		{
			if (typeName _x != typeName [] && {_x != ""}) then {
				_text = _text + format["<br/> |- %1",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
			};
		} forEach _attachments;

	} forEach _weps;
	_text = _text + "<br/>";
};

// ====================================================================================

// OTHER MAGAZINES
// Add lines for all magazines not tied to any carried weapon (grenades etc.)

if (count _mags > 0) then {
	_text = _text + "<br/><font size='18'>OTHER [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayname"),_x select 1];
	} forEach _mags;
};

// ====================================================================================

// BACKPACK
// Add lines for all other items

if !(backpack player == "") then {
	_text = _text + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";

	_bp = backpack player;
	_text = _text + format["%1 [%2",getText (configFile >> "CfgVehicles" >> _bp >> "displayname"), 100*loadBackpack player]+"%]<br/>";
	//_maxload = getNumber(configFile >> "CfgVehicles" >> _bp >> "maximumload");
	//_text = _text + format["%1 [%2/%3]<br/>",getText (configFile >> "CfgVehicles" >> _bp >> "displayname"), _maxload*loadBackpack player,_maxload];
};

// ====================================================================================

// ITEMS
// Add lines for all other items

if (count _items > 0) then {
	_text = _text + "<br/><font size='18'>ITEMS [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayname"),_x select 1];
	} forEach _items;

	{
		_text = _text + format["*%1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach assignedItems player;

	_text = _text + "<br/>*Indicates an equipped item.";
};

// ====================================================================================

_finalText = _text + _orbatText;

// ====================================================================================

// ADD DIARY SECTION
// Wait for the briefing script to finish, then add the created text

waitUntil {scriptDone f_script_briefing};
player createDiaryRecord ["diary", ["Loadout & ORBAT", _finalText]];