// ====================================================================================
// Whale > Delete Markers if Param disabled
if (!isNil "WH_Mission_Preplan" && {WH_Mission_Preplan == 0}) then {
	_markers = ["marker_26","marker_71","marker_27","marker_20","marker_113","marker_129","marker_72","marker_73","marker_74","marker_75","marker_82","marker_83","marker_84","marker_92","marker_126","marker_127","marker_128","marker_114","marker_130","marker_42","marker_45","marker_46","marker_49","marker_53","marker_89","marker_91","marker_64","marker_65","marker_115","marker_131","marker_43","marker_44","marker_47","marker_48","marker_50","marker_51","marker_52","marker_133","marker_116","marker_132","marker_78","marker_118","marker_122","marker_79","marker_80","marker_109","marker_110","marker_111","marker_112","marker_117","marker_119","marker_23","marker_70","marker_28","marker_39","marker_59","marker_107","marker_37","marker_108","marker_41","marker_34","marker_63","marker_81","marker_36","marker_40","marker_120","marker_54","marker_55","marker_56","marker_58","marker_62","marker_85","marker_86","marker_87","marker_88"];
	{ deleteMarker _x } forEach _markers;
};

// ====================================================================================
// Safe Start
if (!hasInterface) then { [] execVM "f\safeStart\f_safeStart.sqf"; };

// ====================================================================================
// Medical Params
ace_medical_enableRevive = if (!ace_medical_preventInstaDeath) then {0} else {1};
publicVariable "ace_medical_enableRevive";

// ====================================================================================
// F3 - Common Local Variables
// WARNING: DO NOT DISABLE THIS COMPONENT
f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";

// ====================================================================================
// F3 - Radio Systems Support
f_param_radios = 2;
[] execVM "f\radios\radio_init.sqf";

// ====================================================================================
// F3 - Disable Saving and Auto Saving
enableSaving [false, false];

// ====================================================================================
// Whale > Respawn ticket system setup

_tickets = ( (count playableUnits * 2) + 1); // tickets desired + 1
_side = west; // player side you want to be ticketed. can be east, west, resistance
// remember to go into respawn.hpp and change the side of the respawn template
	
grpDed = (createGroup sideLogic);
publicVariable "grpDed";
[_side, _tickets] call BIS_fnc_respawnTickets;
DAC_Init_Finished = 0;
publicVariable "DAC_Init_Finished";

// ====================================================================================
// Whale > Force decent wind and custom fog

//0 setFog [0.2, 0.005, 0];
setWind [0.25, 0.2, true];

// ====================================================================================
// Whale > setup randomized caches

_cachesA = [cacheloc_a_1, cacheloc_a_2, cacheloc_a_3, cacheloc_a_4, cacheloc_a_5, cacheloc_a_6, cacheloc_a_7, cacheloc_a_8, cacheloc_a_9, cacheloc_a_10, cacheloc_a_11, cacheloc_a_12, cacheloc_a_13, cacheloc_a_14, cacheloc_a_15, cacheloc_a_16, cacheloc_a_17, cacheloc_a_18, cacheloc_a_19, cacheloc_a_20, cacheloc_a_21, cacheloc_a_22, cacheloc_a_23, cacheloc_a_24, cacheloc_a_25, cacheloc_a_26, cacheloc_a_27, cacheloc_a_28, cacheloc_a_29, cacheloc_a_30, cacheloc_a_31, cacheloc_a_32, cacheloc_a_33, cacheloc_a_34, cacheloc_a_35, cacheloc_a_36, cacheloc_a_37];
_cachesB = [cacheloc_b_1, cacheloc_b_2, cacheloc_b_3, cacheloc_b_4, cacheloc_b_5, cacheloc_b_6, cacheloc_b_7, cacheloc_b_8, cacheloc_b_9, cacheloc_b_10, cacheloc_b_11, cacheloc_b_12, cacheloc_b_13, cacheloc_b_14, cacheloc_b_15, cacheloc_b_16, cacheloc_b_17, cacheloc_b_18, cacheloc_b_19, cacheloc_b_20, cacheloc_b_21, cacheloc_b_22, cacheloc_b_23, cacheloc_b_24, cacheloc_b_25, cacheloc_b_26, cacheloc_b_27, cacheloc_b_28, cacheloc_b_29, cacheloc_b_30, cacheloc_b_31, cacheloc_b_32, cacheloc_b_33, cacheloc_b_34, cacheloc_b_35, cacheloc_b_36, cacheloc_b_37, cacheloc_b_38, cacheloc_b_39, cacheloc_b_40, cacheloc_b_41, cacheloc_b_42, cacheloc_b_43, cacheloc_b_44, cacheloc_b_45, cacheloc_b_46, cacheloc_b_47, cacheloc_b_48, cacheloc_b_49, cacheloc_b_50, cacheloc_b_51, cacheloc_b_52, cacheloc_b_53, cacheloc_b_54, cacheloc_b_55, cacheloc_b_56, cacheloc_b_57, cacheloc_b_58, cacheloc_b_59, cacheloc_b_60];
_cachesC = [cacheloc_c_1, cacheloc_c_2, cacheloc_c_3, cacheloc_c_4, cacheloc_c_5, cacheloc_c_6, cacheloc_c_7, cacheloc_c_8, cacheloc_c_9, cacheloc_c_10, cacheloc_c_11, cacheloc_c_12, cacheloc_c_13, cacheloc_c_14, cacheloc_c_15, cacheloc_c_16, cacheloc_c_17, cacheloc_c_18, cacheloc_c_19, cacheloc_c_20, cacheloc_c_21, cacheloc_c_22, cacheloc_c_23, cacheloc_c_24, cacheloc_c_25, cacheloc_c_26, cacheloc_c_27, cacheloc_c_28, cacheloc_c_29, cacheloc_c_30, cacheloc_c_31, cacheloc_c_32, cacheloc_c_33, cacheloc_c_34, cacheloc_c_35, cacheloc_c_36, cacheloc_c_37, cacheloc_c_38, cacheloc_c_39, cacheloc_c_40, cacheloc_c_41, cacheloc_c_42];

_cachesAshuffled = _cachesA call BIS_fnc_arrayShuffle;
_cachesBshuffled = _cachesB call BIS_fnc_arrayShuffle;
_cachesCshuffled = _cachesC call BIS_fnc_arrayShuffle;

_cacheItems = ["Box_FIA_Support_F","Box_FIA_Ammo_F","Box_FIA_Wps_F"];

// Cache A spawning
_numCachesA = floor random [2,3,4];
for "_i" from 0 to _numCachesA do
{
	_cacheType= selectRandom _cacheItems;
	_newCache = createVehicle [_cacheType, getPos (_cachesA select _i), [], 0, "CAN_COLLIDE"];
	_newCache enableSimulation false;
	_newCache setPosATL (getPosATL (_cachesA select _i));
	
	clearItemCargoGlobal _newCache;
	clearMagazineCargoGlobal _newCache;
	clearWeaponCargoGlobal _newCache;
	clearBackpackCargoGlobal _newCache;
};

// Cache B spawning
_numCachesB = floor random [3,3,5];
for "_i" from 0 to _numCachesB do
{
	_cacheType= selectRandom _cacheItems;
	_newCache = createVehicle [_cacheType, getPos (_cachesB select _i), [], 0, "CAN_COLLIDE"];
	_newCache enableSimulation false;
	_newCache setPosATL (getPosATL (_cachesB select _i));
	
	clearItemCargoGlobal _newCache;
	clearMagazineCargoGlobal _newCache;
	clearWeaponCargoGlobal _newCache;
	clearBackpackCargoGlobal _newCache;
};

// Cache C spawning
_numCachesC = floor random [2,3,4];
for "_i" from 0 to _numCachesC do
{
	_cacheType= selectRandom _cacheItems;
	_newCache = createVehicle [_cacheType, getPos (_cachesC select _i), [], 0, "CAN_COLLIDE"];
	_newCache enableSimulation false;
	_newCache setPosATL (getPosATL (_cachesC select _i));
	
	clearItemCargoGlobal _newCache;
	clearMagazineCargoGlobal _newCache;
	clearWeaponCargoGlobal _newCache;
	clearBackpackCargoGlobal _newCache;
};

{ deleteVehicle _x } forEach _cachesA;
{ deleteVehicle _x } forEach _cachesB;
{ deleteVehicle _x } forEach _cachesC;

// ====================================================================================
// Whale > autocount setup

maxPlayers = 58;
AI_Count_Multiplier = 0.4;
_playerCount = [count switchableUnits, count playableUnits] select isMultiplayer;

if (!isNil "WH_AI_Scaling" && {WH_AI_Scaling != 0}) then 
{
	if (ace_medical_preventInstaDeath) then // ==1
	{		AI_Count_Multiplier = (_playerCount)/maxPlayers;		}
	else {	AI_Count_Multiplier = (_playerCount)/(maxPlayers * 2);	};
	if (AI_Count_Multiplier < 0.2) then { AI_Count_Multiplier = 0.2};
};

if (AI_Count_Multiplier >= 1) then {
	AI_Count_Multiplier = 1;
};

DAC_WP_Nums_A		= ceil(AI_Count_Multiplier * 60);
if (DAC_WP_Nums_A < 20) then { DAC_WP_Nums_A = 20 };

DAC_WP_Nums_B		= ceil(AI_Count_Multiplier * 80);
if (DAC_WP_Nums_B < 28) then { DAC_WP_Nums_B = 28 };

DAC_WP_Nums_C		= ceil(AI_Count_Multiplier * 70);
if (DAC_WP_Nums_C < 25) then { DAC_WP_Nums_C = 25 };

DAC_WP_Nums_D		= ceil(AI_Count_Multiplier * 50);
if (DAC_WP_Nums_D < 18) then { DAC_WP_Nums_D = 18 };

DAC_Camp_Nums_HI 	= ceil(AI_Count_Multiplier * 12);
DAC_Camp_Nums_MED 	= ceil(AI_Count_Multiplier * 8 );
DAC_Camp_Nums_LO 	= ceil(AI_Count_Multiplier * 4 );

// ====================================================================================
// Whale > delete some preplaced AI depending on autocount

_aoList = [ao_0,ao_1,ao_2,ao_3,ao_4];

{
	_ao = _x;
	_groups = [];
	{ if (leader _x inArea _ao) then { _groups pushBack _x }; } forEach allGroups;
	_groupsShuffled = _groups call BIS_fnc_arrayShuffle;
	
	_Prep_AI_Count_Multiplier = AI_Count_Multiplier;
	
	if (_ao == ao_4 && {_Prep_AI_Count_Multiplier < 0.75}) then 
	{ 	_Prep_AI_Count_Multiplier = ((1 - _Prep_AI_Count_Multiplier)/4) + _Prep_AI_Count_Multiplier;	};

	_keepNum = floor(_Prep_AI_Count_Multiplier * (count _groupsShuffled));
	_deleteNum = (count _groupsShuffled) - _keepNum;
	
	for "_i" from 0 to _deleteNum do
	{ 
		{deleteVehicle _x} forEach units (_groupsShuffled select _i); 
		deleteGroup (_groupsShuffled select _i); 
	};
} forEach _aoList;

// ====================================================================================
// Whale > zone triggers

_null = [] spawn {
	zones_1_active = False;
	while {!zones_1_active} do
	{
		// Players detected
		if ((count (playableUnits inAreaArray zone_trig_1)) > 0)  then
		{
			// Spawn in final DAC zones
			[z9] call DAC_Activate;
			[z10] call DAC_Activate;
			[z11] call DAC_Activate;
			[z12] call DAC_Activate;
			[z13] call DAC_Activate;
			[z17] call DAC_Activate;
			[z18] call DAC_Activate;
			// Spawn in Minefield
			{ _mine = createMine ["APERSBoundingMine", _x, [], 0]; _mine enableDynamicSimulation True; } forEach ind_mines;
			// Zone activated
			zones_1_active = True;
		} else { sleep 10 };
	};
};

_null = [] spawn {
	zones_2_active = False;
	while {!zones_2_active} do
	{
		// Players detected
		if ((count (playableUnits inAreaArray zone_trig_2)) > 0)  then
		{
			// Spawn in Zone C DAC zone
			[z23] call DAC_Activate;
			// Zone activated
			zones_2_active = True;
		} else { sleep 10 };
	};
};

// ====================================================================================
// Whale > mission endex
mission_endex = False;
publicVariable "mission_endex";

if (isMultiplayer) then {
	_null = [] spawn 
	{
		waitUntil { sleep 10; (DAC_Init_Finished == 1) };
		_endex_count = independent countSide (allUnits inAreaArray ao_4);
		while {!mission_endex} do
		{
			sleep 120; // 120
			// Player Victory -- Handled inside a trigger
			if ( (independent countSide (allUnits inAreaArray ao_4)) < (ceil(_endex_count * 0.1)))  then
			{
				["end1",true] call BIS_fnc_endMissionServer;
				mission_endex = True;
				publicVariable "mission_endex";
			}
			// Player Loss -- All players dead
			else { if ((west countSide playableUnits) == 0 && {[west] call BIS_fnc_respawnTickets <= 1}) then
			{
				["end2",false] call BIS_fnc_endMissionServer;
				mission_endex = True;
				publicVariable "mission_endex";
			};};
		};
	};
};

// ====================================================================================
// Whale > move preplaced AI to hc

//check if HC1 is present
HCPresent = if(isNil "HC") then{False} else{True};
PublicVariable "HCPresent";

//spawn units on HC1 if present
if(HCPresent && isMultiplayer) then {
	_null = [] spawn {
	diag_log "HC: HC detected. Waiting for HC to initialize...";
	waitUntil { sleep 2; owner HC != 2 };
	diag_log "HC: Moving preplaced AI to the HC...";
	
	{	
		if (side _x == independent) then 
		{ 
			_x setGroupOwner (owner HC); 
			sleep 0.1;
			_x enableDynamicSimulation true;
		};
		//{_x remoteExec ["f_fnc_assignGearAI", owner _x];} forEach units _x;
	} forEach allGroups;
	
	diag_log "HC: Preplaced AI moved to HC.";
	};
}
else {
	// enable dynamic simulation for all units still on server
	diag_log "HC: No HC detected, preplaced AI remaining on server.";
	{ if (side _x == independent) then { _x enableDynamicSimulation true; }; } forEach allGroups;
};

// ====================================================================================
// Whale > DAC AI Spawning

// DAC params
_null = [] spawn {
	waitUntil{(!isNil "DAC_Camp_Nums_LO")};
	diag_log "DAC: Preinitializing DAC...";
	[] execVM "DAC\DAC_Config_Preinit.sqf";
};

// ====================================================================================
// Whale > Delete Ground Clutter once players move out

_null = [] spawn {
	waitUntil{sleep 5;(f_param_mission_timer <= 0)};
	{ deleteVehicle _x; } forEach nearestObjects [getpos main_flag,["WeaponHolder","GroundWeaponHolder"],1000];
};

// ====================================================================================
// slideshow

_null = [] spawn {
	waitUntil{sleep 5; (time > 5)};
	projector_pause = false;
	_imgArray = ['media\ss\1.jpg','media\ss\2.jpg','media\ss\3.jpg','media\ss\4.jpg','media\ss\5.jpg','media\ss\6.jpg','media\ss\7.jpg'];
	_iA = 0;
	projected setObjectMaterialGlobal [0, "\a3\data_f\default.rvmat"];
	while {f_param_mission_timer >= 0} do
	{
		if (_iA >= count _imgArray) then {_iA = 0};
		projected setObjectTextureGlobal [0, (_imgArray select _iA)];
		_iA = _iA + 1;
		sleep 20;
		waitUntil{sleep 1;!projector_pause};
	};
};