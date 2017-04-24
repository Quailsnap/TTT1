// F3 - Assign Gear Script - AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_faction","_known","_unitClasses"];
params["_unit"];
if (_unit in playableUnits) exitWith {};

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The default gear type picked when no corresponding entry is found in the _unitClasses array
// Set _defaultclass to "" to let these units keep their default gear
_defaultclass = "r";
_faction = "ai";

// The unit classes and their corresponding F3 Assign Gear Component type
_unitClasses = [

	["_officer_"	,	"ftl"	],
	["_commander"	,	"ftl"	],
	["_colonel_"	,	"ftl"	],
	["_m16a2"		,	"ftl"	],
	["_gl"			,	"rat"	],
	["_sl_"			,	"ftl"	],
	["_tl"			,	"ftl"	],
	["_lite_"		,	"r"		],
	["_ar"			,	"ar"	],
	["_aar_"		,	"ar"	],
	["_a_"			,	"ar"	],
	["_lat_"		,	"rat"	],
	["_medic_"		,	"m"		],
	["_gl_"			,	"r"		],
	["_exp_"		,	"r"		],
	["_engineer_"	,	"r"		],
	["_mg"			,	"ar"	],
	["_amg_"		,	"ar"	],
	["_at"			,	"rat"	],
	["_aat"			,	"r"		],
	["_aa"			,	"rat"	],
	["_hat"			,	"rat"	],
	["_uav_"		,	"r"		],
	["_jtac_"		,	"r"		],
	["_m_"			,	"dm"	],
	["_sniper"		,	"dm"	],
	["_spotter_"	,	"dm"	],
	["_medic"		,	"m"		],
	["_repair_"		,	"r"		],
	["_crew_"		,	"r"		],
	["_helipilot_"	,	"r"		],
	["_helicrew_"	,	"r"		],
	["_pilot_"		,	"r"		]

	// No comma after the last array!
];

// ====================================================================================

// Interpret parameters
//_units = if (count _this == 0) then [{waitUntil {scriptDone f_script_setLocalVars};f_var_men},{_this}];

	// Check if the unit was already touched by the F3 Assign Gear Component
	if (!(_unit getvariable ["f_var_assignGear_done", false]) && {(_unit isKindOf "Man")}) then {
		_known = false;
		{
			_known = [toLower (_x select 0),toLower (typeOf _unit)] call BIS_fnc_inString;

			// If the unit's classname corresponds to a class in the assignment array, set it's gear accordingly
			if (_known) exitWith {
				//[_x select 1,_faction,_unit] call f_fnc_assignGear;
				[_x select 1,_faction,_unit] remoteExecCall ["f_fnc_assignGear",2];
				//[[_x select 1, _faction, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
			};
		} forEach _unitClasses;

		// If the class is not in the _unitClasses array
		if (!_known) then {
			if (_defaultclass != "") then {
				//[[_defaultclass, _faction, _unit], "f_fnc_assignGear", _unit,false,true] call BIS_fnc_MP;
				//[_defaultclass,_faction,_unit] call f_fnc_assignGear;
				[_defaultclass,_faction,_unit] remoteExecCall ["f_fnc_assignGear",2];
			};
		};
	};

