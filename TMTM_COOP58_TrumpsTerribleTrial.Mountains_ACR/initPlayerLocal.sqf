private["_colorCorrection"];

// ====================================================================================
// Check for JIP
_didJIP = (_this select 1);

// ====================================================================================
// Medical Params
ace_medical_enableRevive = if (!ace_medical_preventInstaDeath) then {0} else {1};

// ====================================================================================
// Handle teamkilling
player addRating 99999;

// ====================================================================================
// Safe Start
[] execVM "f\safeStart\f_safeStart.sqf";

// ====================================================================================
// F3 - Radio Systems Support
f_param_radios = 2;
[] execVM "f\radios\radio_init.sqf";

// ====================================================================================
// F3 - Disable Saving and Auto Saving
enableSaving [false, false];

// ====================================================================================
// F3 - Folk ARPS Group IDs, Markers, FTMarkers, Buddy Team Colors, Briefing, ORBAT, Loadouts, Nametags
f_script_setTeamColours = [] execVM "f\setTeamColours\f_setTeamColours.sqf";
f_script_setGroupMarkers = [] execVM "f\groupMarkers\f_setLocalGroupMarkers.sqf";
[] spawn f_fnc_SetLocalFTMemberMarkers;
f_script_briefing = [] execVM "briefing.sqf";
if (!isNil "WH_Mission_Preplan" && {WH_Mission_Preplan == 1}) then
{	[] execVM "f\briefing\wh_preplan.sqf";	};
[] execVM "f\briefing\f_loadoutNotes.sqf";
[] execVM "f\nametag\f_nametags.sqf";

// ====================================================================================
// Whale Introduction and JIP handling

if (_didJIP) then
{
	if ([west] call BIS_fnc_respawnTickets < 2) then { player setDamage 1; hideObjectGlobal player; }
	else { [west,-1] call BIS_fnc_respawnTickets; };
}
else
{
	_null = [] spawn {
		waitUntil {!isNull (findDisplay 46)};
		cutText ["Sit still for a minute or two while the AI initialize.", "BLACK IN", 25];
		waitUntil{sleep 0.5;(DAC_Init_Finished == 1)};
		sleep 10;
		cutText ["Free to move.", "PLAIN"];
		[ [ ["TTT1 - Trump's Terrible Trial"], ["by Whale"] ] , 1, 0.7, "<t align = 'center' shadow = '1' size = '1.5'>%1</t>" ] spawn BIS_fnc_typeText;
		
	};
	_null = [] spawn {
		waitUntil {sleep 1; (!isNull (findDisplay 46))};
		sleep 10;
		main_flag say3D "trumpspeech";
		// also, projector stuff
		projector_pause = false;
	};
};

// ====================================================================================
// Whale ticket system eventhandler
player addEventHandler["Killed", 
{
	if ([west] call BIS_fnc_respawnTickets > 1) then
	{
		_state = ["Initialize", [player, [blufor], false, false, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
		[west,-1] call BIS_fnc_respawnTickets;
	}
	else
	{
		_dummy = grpDed createUnit["VirtualMan_F", getPos spec_pos, [], 0, "NONE"];
		selectPlayer _dummy;
		setPlayerRespawnTime 99999;
		_dummy setDamage 1;
		hideObjectGlobal _dummy;
		_state = ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
		hint "Respawn tickets disabled. Welcome to spectator. Mission ends when everyone is dead.";
	};
}];

// ====================================================================================
// Whale respawn gear eventhandler
player setVariable ["Saved_Loadout", getUnitLoadout player];

player addEventHandler["Respawn",
{
	player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);
	["Terminate"] call BIS_fnc_EGSpectator;
	_tickets = [west] call BIS_fnc_respawnTickets;
	hint format ["%1 respawn tickets remain.",_tickets];
}];

// ====================================================================================
// cc
_colorCorrection = ppEffectCreate["ColorCorrections",1000];
_ccEffect = [1, 1, 0, 0,0,0,0, 0.6,0.7,0.8,1.1, 0.299,0.587,0.114,0];
_colorCorrection ppEffectAdjust _ccEffect;
_colorCorrection ppEffectEnable true;
_colorCorrection ppEffectcommit 1;

// ====================================================================================
// camp smoke fx
_null = [] spawn {
	waitUntil {sleep 2; DAC_Init_Finished == 1};
	{
	_ps = "#particlesource" createVehicleLocal _x;
	_ps setParticleCircle [0, [0, 0, 0]];
	_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_ps setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 3, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 2.5], 0, 10, 7.9, 0.066, [2, 6, 12], [[0.5, 0.5, 0.5, 0.3], [0.75, 0.75, 0.75, 0.15], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _x];
	_ps setDropInterval 0.1;
	} forEach DAC_Camp_Pos_Array;
};

// ====================================================================================
// server hold action
/*
[  
 obj_server,  
 "Expunge Watersports Porn",  
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
 "_this distance _target < 3",  
 "_caller distance _target < 3",  
 {},  
 {},  
 {
	_hintS = "Pornography Wiped! Intel added to map menu.";
	hint _hintS;
	vehicle player groupChat _hintS;
	_intel = player createDiaryRecord ["diary", ["! SERVER FILES !","
		<br/>
		<font size='18'>Inside is a picture of Supreme Commander Trump in a prone position. Over him are two Russian supermodels. He is looking up at them. They are urinating. Urine is landing all over Supreme Commander Trump as he smiles. The rest of the album is similiar -- a picture of Trump getting pissed on and looking at the camera -- a picture of lil' Trump (his member) getting stepped on by the supermodels as he urinates on himself -- etc etc. You are oddly aroused.</font>
		<br/>
	"]];
},  
 {},  
 [],  
 6,  
 0,  
 true,  
 false  
] call BIS_fnc_holdActionAdd; 
*/
// ====================================================================================
// loadout selection

_null = player spawn
{
	waitUntil{sleep 1;(player == player)};
		
	_rArray = [UnitBLU_CO_C,UnitBLU_CO_M,UnitBLU_A_M,UnitBLU_A_D,UnitBLU_A_G,UnitBLU_A1_FTL,UnitBLU_A1_AB,UnitBLU_A2_FTL,UnitBLU_A2_AB,UnitBLU_B_M,UnitBLU_B_D,UnitBLU_B_G,UnitBLU_B1_FTL,UnitBLU_B1_AB,UnitBLU_B2_FTL,UnitBLU_B2_AB,UnitBLU_C_M,UnitBLU_C_D,UnitBLU_C_G,UnitBLU_C1_FTL,UnitBLU_C1_AB,UnitBLU_C2_FTL,UnitBLU_C2_AB,UnitBLU_D_M,UnitBLU_D_D,UnitBLU_D_G,UnitBLU_D1_FTL,UnitBLU_D1_AB,UnitBLU_D2_FTL,UnitBLU_D2_AB];

	_glArray= [UnitBLU_A_SL,UnitBLU_A1_G,UnitBLU_A2_G,UnitBLU_B_SL,UnitBLU_B1_G,UnitBLU_B2_G,UnitBLU_C_SL,UnitBLU_C1_G,UnitBLU_C2_G,UnitBLU_D_SL,UnitBLU_D1_G,UnitBLU_D2_G];

	if (player in _rArray) then { player execVM "f\assignGear\f_rSelect.sqf" };
	if (player in _glArray)then { player execVM "f\assignGear\f_glSelect.sqf" };
};