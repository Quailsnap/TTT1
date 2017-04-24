params["_unit"];
if (_unit != player) exitWith { diag_log "ABORTED"; };

_gun_action_1 = [  
 _unit,  
 "SELECT WEAPON A | MK16 (FN SCAR)", "", "","true","true",{},{},  
 {
	_caller addWeapon "CUP_arifle_Mk16_STD_EGLM";
	_scopes = ["FHQ_optic_AIM","FHQ_optic_AC12136","FHQ_optic_MicroCCO","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","CUP_optic_CompM2_Black","optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_MARS"];
	_scope = _scopes select floor(random(count _scopes));
	_caller addPrimaryWeaponItem _scope;
	_caller addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
	_caller addItemToVest "1Rnd_HE_Grenade_shell";
 },  
 {},[],  
 1,  
 0,false,false  
] call BIS_fnc_holdActionAdd;

_gun_action_2 = [  
 _unit,  
 "SELECT WEAPON B | M4A2 CQB", "", "","true","true",{},{},  
 {
	_caller addWeapon "hlc_rifle_m4m203";
	_scopes = ["FHQ_optic_AIM","FHQ_optic_AC12136","FHQ_optic_MicroCCO","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","CUP_optic_CompM2_Black","optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_MARS"];
	_scope = _scopes select floor(random(count _scopes));
	_caller addPrimaryWeaponItem _scope;
	_caller addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
	_caller addItemToVest "1Rnd_HE_Grenade_shell";
 },  
 {},[],  
 1,  
 0,false,false  
] call BIS_fnc_holdActionAdd;

_gun_action_3 = [  
 _unit,  
 "SELECT WEAPON C | !APEX! SPAR-16 (HK416A5)", "", "","true","true",{},{},  
 {
	_caller addWeapon "arifle_SPAR_01_GL_snd_F";
	_scopes = ["FHQ_optic_AIM","FHQ_optic_AC12136","FHQ_optic_MicroCCO","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","CUP_optic_CompM2_Black","optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_MARS"];
	_scope = _scopes select floor(random(count _scopes));
	_caller addPrimaryWeaponItem _scope;
	_caller addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
	_caller addItemToVest "1Rnd_HE_Grenade_shell";
 },  
 {},[],  
 1,  
 0,false,false  
] call BIS_fnc_holdActionAdd;

_gun_action_4 = [  
 _unit,  
 "SELECT WEAPON D | MK-20 (FN F2000)", "", "","true","true",{},{},  
 {
	_caller addWeapon "arifle_Mk20_GL_plain_F";
	_scopes = ["FHQ_optic_AIM","FHQ_optic_AC12136","FHQ_optic_MicroCCO","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","CUP_optic_CompM2_Black","optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_MARS"];
	_scope = _scopes select floor(random(count _scopes));
	_caller addPrimaryWeaponItem _scope;
	_caller addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
	_caller addItemToVest "1Rnd_HE_Grenade_shell";
 },  
 {},[],  
 1,  
 0,false,false  
] call BIS_fnc_holdActionAdd;

_gun_action_5 = [  
 _unit,  
 "SELECT WEAPON E | L85A2", "", "","true","true",{},{},  
 {
	_caller addWeapon "CUP_arifle_L85A2_GL";
	_scopes = ["FHQ_optic_AIM","FHQ_optic_AC12136","FHQ_optic_MicroCCO","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","CUP_optic_CompM2_Black","optic_ACO_grn","FHQ_optic_AC11704","FHQ_optic_MARS"];
	_scope = _scopes select floor(random(count _scopes));
	_caller addPrimaryWeaponItem _scope;
	_caller addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
	_caller addItemToVest "1Rnd_HE_Grenade_shell";
 },  
 {},[],  
 1,  
 0,false,false  
] call BIS_fnc_holdActionAdd;

_gun_actions = [_gun_action_1,_gun_action_2,_gun_action_3,_gun_action_4,_gun_action_5];

_null = [_gun_actions,_unit] spawn {
	waitUntil{sleep 5;(f_param_mission_timer <= 0)};
	{[_this select 1,_x] call BIS_fnc_holdActionRemove} forEach (_this select 0);
	player setVariable ["Saved_Loadout", getUnitLoadout player];
};