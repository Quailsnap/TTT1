// F3 - Folk ARPS Assign Gear Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following interprets what has been passed to _unit script element

//_typeofUnit = toLower (__unit select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
//_unit = __unit select 1;					// expecting name of unit; originally passed by using '_unit' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// _unit block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing clothing and gear
	
	removeUniform _unit;
	removeHeadgear _unit;
	removeVest _unit;
	//removeGoggles _unit;
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;


	// ====================================================================================

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of _unit faction

	//_unit linkItem _nvg;			// Add and equip the faction's nvg
	//_unit addItem _firstaid;		// Add a single first aid kit (FAK)
	_unit linkItem "ItemMap";		// Add and equip the map
	_unit linkItem "ItemCompass";	// Add and equip a compass
	//_unit linkItem "ItemRadio";		// Add and equip A3's default radio
	_unit linkItem "ItemWatch";		// Add and equip a watch
	//_unit linkItem "ItemGPS"; 	// Add and equip a GPS

	// ====================================================================================

	// INSIGNIA
	// _unit block will give units insignia on their uniforms.

	// NATO and CSAT have different styles of insignia to match the different uniforms for
	// Altis and Tanoa. Additionally, CSAT has an urban camo option. The following variables
	// can be changed to apply the desired style of insignia to the NATO and CSAT platoons.

	_insignia_style_NATO = "Altis"; // Options: "Altis" | "Tanoa"
	_insignia_style_CSAT = "Altis"; // Options: "Altis" | "Tanoa" | "Urban"

	_insignia_styles = [_insignia_style_NATO,_insignia_style_CSAT];
	[_unit,_typeofUnit,_insignia_styles] spawn {
		#include "f_assignInsignia.sqf"
	};

// ====================================================================================
}
else {
	clearMagazineCargoGlobal _unit;
	clearWeaponCargoGlobal _unit;
	clearBackpackCargoGlobal _unit;
	clearItemCargoGlobal _unit;
};

// ====================================================================================

// SELECT LOADOUT
// Pick the appropriate loadout depending on the parameter

// F3 - Folk ARPS Assign Gear Script - AAF - Light Loadout
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_faction) do
{
	case "blu":
	{
	switch (_typeofUnit) do
	{
	// ====================================================================================
	// Rifleman Loadout:
		case "r":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt","CUP_I_B_PMC_Unit_13","CUP_I_B_PMC_Unit_15"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addItemToUniform "SmokeShellGreen";
			
			_unit addVest "CUP_V_B_Eagle_SPC_Rifleman";
			for "_i" from 1 to 12 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			_unit addItemToVest "HandGrenade";
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			
			_unit addBackpack "CUP_B_AssaultPack_Coyote";
			_unit addItemToBackpack "ToolKit";
			
			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;

			_unit addWeapon "CUP_arifle_Mk16_STD";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemMicroDAGR";
		};
	// Autorifleman Loadout:
		case "ar":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			
			for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "SmokeShellGreen";
			_unit addItemToUniform "SmokeShell";
			_unit addItemToUniform "16Rnd_9x21_Mag";
			_unit addVest "CUP_V_B_Eagle_SPC_AR";
			for "_i" from 1 to 10 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "HandGrenade";
			_unit addItemToVest "SmokeShell";
			for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
			_unit addItemToVest "hlc_200rnd_556x45_M_SAW";
			_unit addBackpack "CUP_B_Bergen_BAF";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "hlc_200rnd_556x45_M_SAW";};
			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;

			_unit addWeapon "hlc_lmg_mk46";
			_unit addPrimaryWeaponItem "FHQ_optic_AC12136";
			_unit addWeapon "hgun_Rook40_F";
			_unit addItemToUniform "16Rnd_9x21_Mag";
			_unit addItemToBackpack "hlc_200rnd_556x45_M_SAW";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemMicroDAGR";
		};
	// Grenadier Loadout:
		case "g":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "SmokeShellGreen";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addVest "CUP_V_B_Eagle_SPC_GL";
			for "_i" from 1 to 12 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
			//_unit addBackpack "CUP_B_AssaultPack_Coyote";
			
			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;
			//_unit addGoggles "G_Bandanna_tan";

			_unit addWeapon "CUP_arifle_Mk16_STD_EGLM";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addItemToVest "1Rnd_HE_Grenade_shell";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemMicroDAGR";
		};
	// Ammobearer Loadout:
		case "ab":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "SmokeShellGreen";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addVest "CUP_V_B_Eagle_SPC_Patrol";
			for "_i" from 1 to 12 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			_unit addBackpack "B_Kitbag_cbr";
			for "_i" from 1 to 7 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Yellow";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "hlc_200rnd_556x45_M_SAW";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;
			//_unit addGoggles "G_Bandanna_tan";

			_unit addWeapon "CUP_arifle_Mk16_STD";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemMicroDAGR";
		};
	// Combat Lifesaver Loadout:
		case "m":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "SmokeShellPurple";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addVest "CUP_V_B_Eagle_SPC_Corpsman";
			for "_i" from 1 to 18 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 10 do {_unit addItemToVest "ACE_morphine";};
			for "_i" from 1 to 6 do {_unit addItemToVest "ACE_epinephrine";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellPurple";};
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			_unit addBackpack "B_AssaultPack_cbr";
			for "_i" from 1 to 32 do {_unit addItemToBackpack "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_bloodIV_500";};
			for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
			for "_i" from 1 to 16 do {_unit addItemToBackpack "ACE_morphine";};
			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;
			//_unit addGoggles "G_Bandanna_tan";

			_unit addWeapon "CUP_arifle_Mk16_STD";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Fire Team Leader Loadout:
		case "ftl":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "ACE_MapTools";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addItemToUniform "SmokeShellGreen";
			_unit addVest "CUP_V_B_Eagle_SPC_TL";
			for "_i" from 1 to 12 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			_unit addItemToVest "HandGrenade";
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			_unit addBackpack "CUP_B_AssaultPack_Coyote";

			_helmets = ["CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_USArmy_Helmet_ECH1_Sand","CUP_H_FR_ECH","CUP_H_USArmy_Helmet_ECH2_Sand"];
			// lowest is first one
			_helmet = "CUP_H_USArmy_Helmet_ECH1_Sand";
			_helmet = _helmets select floor(random(count _helmets));
			_unit addHeadgear _helmet;

			_unit addWeapon "CUP_arifle_Mk16_STD";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addWeapon "ACE_Vector";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Squad Leader Loadout:
		case "sl":
		{
			_uniforms = ["U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_B_CombatUniform_mcam_tshirt","CUP_U_B_BAF_DDPM_Tshirt"];
			// lowest is first one
			_uniform = "U_BG_Guerilla2_1";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "ACE_MapTools";
			_unit addItemToUniform "SmokeShellGreen";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addItemToUniform "16Rnd_9x21_Mag";
			_unit addVest "CUP_V_B_Eagle_SPC_SL";
			for "_i" from 1 to 12 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "HandGrenade";
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
			_unit addItemToVest "16Rnd_9x21_Mag";
			_unit addBackpack "TFAR_rt1523g_rhs";

			for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
			_unit addHeadgear "CUP_H_USMC_MICH2000_COMM_DES";

			_unit addWeapon "CUP_arifle_Mk16_STD_EGLM";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addItemToVest "1Rnd_HE_Grenade_shell";
			
			_unit addWeapon "hgun_Rook40_F";
			_unit addWeapon "ACE_Vector";
			_unit addItemToUniform "16Rnd_9x21_Mag";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemcTab";
		};
	// Platoon Leader Loadout:
		case "pl":
		{
			_unit forceAddUniform "U_BG_Guerilla2_2";
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			_unit addItemToUniform "ACE_MapTools";
			_unit addItemToUniform "SmokeShellGreen";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addVest "CUP_V_B_Eagle_SPC_Empty";
			for "_i" from 1 to 11 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_morphine";};
			_unit addItemToVest "ItemcTabHCam";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
			for "_i" from 1 to 3 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
			_unit addBackpack "TFAR_rt1523g_green";
			_unit addHeadgear "H_MilCap_blue";

			_unit addWeapon "CUP_arifle_Mk16_STD";
			_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Yellow";
			_unit addWeapon "hgun_ACPC2_F";
			_unit addWeapon "ACE_Vector";
			_unit addItemToUniform "16Rnd_9x21_Mag";
			_unit addPrimaryWeaponItem "FHQ_optic_MARS";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemcTab";
		};
	// Vehicle & Box LOADOUTS
	// CARGO: CAR - room for 10 weapons and 50 cargo items
		case "v_car_l":
		{
			_unit addWeaponCargoGlobal ["hgun_Rook40_F",1];
			_unit addMagazineCargoGlobal ["16Rnd_9x21_Mag",2];
			_unit addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow",10];
			_unit addMagazineCargoGlobal ["hlc_200rnd_556x45_M_SAW",3];
			_unit addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",3];
			_unit addMagazineCargoGlobal ["SmokeShellGreen",1];
			_unit addItemCargoGlobal ["ACE_fieldDressing",10];
			_unit addItemCargoGlobal ["ACE_morphine",4];
			_unit addItemCargoGlobal ["ACE_epinephrine",1];
			[_unit, 1, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
		};
	// CARGO: CAR - room for 10 weapons and 50 cargo items
		case "v_car_m":
		{
			_unit addWeaponCargoGlobal ["CUP_arifle_Mk16_CQC",1];
			_unit addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow",20];
			_unit addMagazineCargoGlobal ["hlc_200rnd_556x45_M_SAW",8];
			_unit addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",8];
			_unit addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",3];
			_unit addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",3];
			_unit addMagazineCargoGlobal ["HandGrenade",3];
			_unit addMagazineCargoGlobal ["SmokeShell",6];
			_unit addMagazineCargoGlobal ["SmokeShellGreen",2];
			_unit addItemCargoGlobal ["ACE_fieldDressing",30];
			_unit addItemCargoGlobal ["ACE_morphine",10];
			_unit addItemCargoGlobal ["ACE_epinephrine",5];
			_unit addItemCargoGlobal ["ACE_bloodIV_500",4];
			_unit addItemCargoGlobal ["ItemRadio",1];
			[_unit, 4, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
		};
	// CARGO: Repair Truck
		case "v_car_r":
		{
			_unit addWeaponCargoGlobal ["hgun_Rook40_F",1];
			_unit addMagazineCargoGlobal ["16Rnd_9x21_Mag",2];
			_unit addItemCargoGlobal ["ToolKit",1];
			[_unit, 6, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
		};
	// CARGO: MEDICAL BOX
		case "box_m":
		{
			_unit addMagazineCargoGlobal ["SmokeShellPurple",6];
			_unit addItemCargoGlobal ["ACE_fieldDressing",50];
			_unit addItemCargoGlobal ["ACE_morphine",25];
			_unit addItemCargoGlobal ["ACE_epinephrine",15];
			_unit addItemCargoGlobal ["ACE_bloodIV_500",8];
			_unit addItemCargoGlobal ["ItemRadio",1];
		};
	// CARGO: AMMOBOX
		case "box_a":
		{
			_unit addMagazineCargoGlobal ["16Rnd_9x21_Mag",10];
			_unit addMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Yellow",50];
			_unit addMagazineCargoGlobal ["hlc_20rnd_762x51_b_G3",20];
			_unit addMagazineCargoGlobal ["hlc_200rnd_556x45_M_SAW",20];
			_unit addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
			_unit addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",10];
			_unit addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];
			_unit addMagazineCargoGlobal ["HandGrenade",5];
			_unit addMagazineCargoGlobal ["SmokeShell",10];
			_unit addMagazineCargoGlobal ["SmokeShellGreen",2];
			_unit addItemCargoGlobal ["ItemRadio",1];
		};
	};
	};
	case "blus":
	{
	switch (_typeofUnit) do
	{

	// ====================================================================================
	// Rifleman Loadout:
		case "r":
		{
			_unit forceAddUniform "U_Rangemaster";
			_unit addItemToUniform "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addItemToUniform "SmokeShellBlue";
			_unit addVest "V_TacVest_blk";
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_fieldDressing";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "ACE_MapTools";
			_unit addItemToVest "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
			_unit addItemToVest "9Rnd_45ACP_Mag";
			_unit addItemToVest "SmokeShell";
			_unit addHeadgear "CUP_H_FR_Cap_Headset_Green";

			_unit addWeapon "hlc_rifle_hk51";
			_unit addWeapon "hgun_ACPC2_F";
			_unit addHandgunItem "muzzle_snds_acp";
			_unit addItemToVest "hlc_20rnd_762x51_b_G3";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addWeapon "ACE_Vector";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Rifleman AT Loadout:
		case "rat":
		{
			_unit forceAddUniform "U_Rangemaster";
			_unit addItemToUniform "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addItemToUniform "SmokeShellBlue";
			
			_unit addVest "V_TacVest_blk";
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_fieldDressing";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "ACE_MapTools";
			_unit addItemToVest "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
			_unit addItemToVest "9Rnd_45ACP_Mag";
			_unit addItemToVest "SmokeShell";
			
			_unit addBackpack "CUP_B_ACRScout_m95";
			_unit addItemToBackpack "CUP_RPG18_M";
			
			_unit addHeadgear "CUP_H_PMC_Cap_PRR_Grey";
			
			_unit addWeapon "hlc_rifle_hk51";
			_unit addPrimaryWeaponItem "CUP_optic_CompM4";
			_unit addItemToVest "hlc_20rnd_762x51_b_G3";
			
			_unit addWeapon "hgun_ACPC2_F";
			_unit addHandgunItem "muzzle_snds_acp";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			
			_unit addWeapon "CUP_launch_RPG18";
			_unit addWeapon "ACE_Vector";

			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Combat Lifesaver Loadout:
		case "m":
		{
			_unit forceAddUniform "U_Marshal";
			_unit addItemToUniform "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			_unit addItemToUniform "SmokeShellBlue";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addVest "V_TacVest_brn";
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_fieldDressing";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "ACE_MapTools";
			_unit addItemToVest "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
			_unit addItemToVest "9Rnd_45ACP_Mag";
			_unit addItemToVest "SmokeShell";
			_unit addBackpack "CUP_B_ACRScout_m95";
			for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_fieldDressing";};
			for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
			for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_morphine";};
			_unit addHeadgear "CUP_H_USMC_BOONIE_DES";
			
			_unit addWeapon "hlc_rifle_hk51";
			_unit addPrimaryWeaponItem "CUP_optic_CompM4";
			_unit addWeapon "hgun_ACPC2_F";
			_unit addHandgunItem "muzzle_snds_acp";
			_unit addItemToVest "hlc_20rnd_762x51_b_G3";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addWeapon "ACE_Vector";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Squad Leader Loadout:
		case "sl":
		{
			_unit forceAddUniform "U_I_G_resistanceLeader_F";
			_unit addItemToUniform "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
			_unit addItemToUniform "SmokeShellBlue";
			_unit addItemToUniform "hlc_20rnd_762x51_b_G3";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addVest "V_TacVest_blk";
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_fieldDressing";};
			_unit addItemToVest "ItemcTabHCam";
			_unit addItemToVest "ACE_MapTools";
			_unit addItemToVest "ACE_morphine";
			for "_i" from 1 to 4 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
			_unit addItemToVest "9Rnd_45ACP_Mag";
			_unit addItemToVest "SmokeShell";
			_unit addBackpack "TFAR_rt1523g_bwmod";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "hlc_20rnd_762x51_b_G3";};
			_unit addHeadgear "CUP_H_TK_Beret";
			removeGoggles _unit;
			_unit addGoggles "G_Aviator";
			
			_unit addWeapon "hlc_rifle_hk51";
			_unit addPrimaryWeaponItem "CUP_optic_CompM4";
			_unit addWeapon "hgun_ACPC2_F";
			_unit addHandgunItem "muzzle_snds_acp";
			_unit addItemToUniform "hlc_20rnd_762x51_b_G3";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addWeapon "ACE_Vector";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemcTab";
		};
	// Heli Pilot Loadout:
		case "p":
		{
			_unit forceAddUniform "CUP_U_C_Pilot_01";
			_unit addItemToUniform "ItemcTabHCam";
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
			for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
			_unit addItemToUniform "ACE_MapTools";
			for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			_unit addVest "V_TacVest_gen_F";
			for "_i" from 1 to 2 do {_unit addItemToVest "ACE_fieldDressing";};
			for "_i" from 1 to 4 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
			_unit addBackpack "TFAR_rt1523g_bwmod";
			_unit addItemToBackpack "ToolKit";
			_unit addHeadgear "CUP_H_PMC_EP_Headset";

			_unit addWeapon "hgun_ACPC2_F";
			_unit addItemToUniform "9Rnd_45ACP_Mag";
			
			_unit linkItem "ItemRadio";
			_unit linkItem "ItemAndroid";
		};
	// Vehicle & Box LOADOUTS
	// CARGO: heli
		case "v_heli":
		{
			_unit addWeaponCargoGlobal ["hlc_smg_mp510",1];
			_unit addMagazineCargoGlobal ["hlc_30Rnd_10mm_B_MP5",4];
			_unit addMagazineCargoGlobal ["9Rnd_45ACP_Mag",12];
			_unit addMagazineCargoGlobal ["hlc_20rnd_762x51_b_G3",36];
			_unit addMagazineCargoGlobal ["SmokeShellBlue",4];
			_unit addItemCargoGlobal ["ACE_fieldDressing",12];
			_unit addItemCargoGlobal ["ACE_morphine",6];
			_unit addItemCargoGlobal ["ACE_epinephrine",2];
			_unit addItemCargoGlobal ["ToolKit",1];
		};
	};
	};
	case "ai":
	{
	_unit setSpeaker "Male01PER";
	switch (_typeofUnit) do
	{

	// ====================================================================================
	// Rifleman Loadout:
		case "r":
		{
			_rifle = ""; _magazine = "";
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			_randomItem = floor random 3;
			switch (_randomItem) do
			{
				case 0: { _unit addItemToUniform "SmokeShellOrange"; };
				case 1: {
					_unit addItemToUniform "ACE_fieldDressing";
					_unit addItemToUniform "ACE_fieldDressing";
				};
				case 2: {};
			};
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_04"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			
			_randomWeapon = 0;
			_randomWeapon = floor random 5;
	
			switch (_randomWeapon) do
			{
					case 0: { // AK74-1
						_rifle = "hlc_rifle_ak74"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 1: { // AK74-2
						_rifle = "hlc_rifle_ak74_dirty"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 2: { // AK74-3
						_rifle = "hlc_rifle_ak74_dirty2"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 3: { // M16A2
						_rifle = "CUP_arifle_M16A2"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
					case 4: { // M4A1
						_rifle = "CUP_arifle_M4A1_black"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
			};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["G_Squares","G_Shades_Green","","","","","","","","","","","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
		};
	// Autorifleman Loadout:
		case "ar":
		{
			_rifle = ""; _magazine = "";
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			_randomItem = floor random 3;
			switch (_randomItem) do
			{
				case 0: { _unit addItemToUniform "SmokeShellOrange"; };
				case 1: {
					_unit addItemToUniform "ACE_fieldDressing";
					_unit addItemToUniform "ACE_fieldDressing";
				};
				case 2: {};
			};
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_04","CUP_V_O_Ins_Carrier_Rig_MG","CUP_V_O_Ins_Carrier_Rig_MG","CUP_V_O_Ins_Carrier_Rig_MG"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			
			_rifle = "hlc_rifle_rpk74n"; _magazine = "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";
			for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
			for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["G_Squares","G_Shades_Green","","","","","","","","","","","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
		};
	// Combat Lifesaver Loadout:
		case "m":
		{
			_rifle = ""; _magazine = "";
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_fieldDressing";};
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_04"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			for "_i" from 1 to 4 do {_unit addItemToVest "ACE_fieldDressing";};
			_unit addItemToVest "ACE_epinephrine";
			for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
			
			_randomWeapon = 0;
			_randomWeapon = floor random 5;
	
			switch (_randomWeapon) do
			{
					case 0: { // AK74-1
						_rifle = "hlc_rifle_ak74"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 1: { // AK74-2
						_rifle = "hlc_rifle_ak74_dirty"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 2: { // AK74-3
						_rifle = "hlc_rifle_ak74_dirty2"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 3: { // M16A2
						_rifle = "CUP_arifle_M16A2"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
					case 4: { // M4A1
						_rifle = "CUP_arifle_M4A1_black"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
			};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["Bear_RoundGlasses","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
		};
	// Fire Team Leader Loadout:
		case "ftl":
		{
			_rifle = ""; _magazine = "";
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;
			_unit addItemToUniform "ACE_fieldDressing";
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_RUS_Smersh_2","CUP_V_RUS_Smersh_2","CUP_V_RUS_Smersh_2"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			_unit addItemToVest "ACE_fieldDressing";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellOrange";};
			
			_randomWeapon = 0;
			_randomWeapon = floor random 5;
	
			switch (_randomWeapon) do
			{
					case 0: { // AK74-1
						_rifle = "hlc_rifle_ak74"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 1: { // AK74-2
						_rifle = "hlc_rifle_ak74_dirty"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 2: { // AK74-3
						_rifle = "hlc_rifle_ak74_dirty2"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 3: { // M16A2
						_rifle = "CUP_arifle_M16A2"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
					case 4: { // M4A1
						_rifle = "CUP_arifle_M4A1_black"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
			};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["Bear_RoundGlasses","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
			_unit linkItem "ItemRadio";
		};
	// Marksman Loadout:
		case "dm":
		{
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			_randomItem = floor random 3;
			switch (_randomItem) do
			{
				case 0: { _unit addItemToUniform "SmokeShellOrange"; };
				case 1: {
					_unit addItemToUniform "ACE_fieldDressing";
					_unit addItemToUniform "ACE_fieldDressing";
				};
				case 2: {};
			};
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_04"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			
			_rifle = "CUP_srifle_CZ550"; _magazine = "CUP_5x_22_LR_17_HMR_M";
			
			for "_i" from 1 to 4 do {_unit addItemToUniform _magazine;};
			for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["G_Squares","G_Shades_Green","","","","","","","","","","","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
			_unit addWeapon "Binocular";
		};
	// Rifleman Anti-Tank
		case "rat":
		{
			_rifle = ""; _magazine = "";
			_uniforms = ["CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			   "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",			 "CUP_U_O_TK_Green","CUP_U_O_TK_MixedCamo","CUP_U_O_Partisan_TTsKO_Mixed",
						 "CUP_O_TKI_Khet_Jeans_01","CUP_O_TKI_Khet_Jeans_04","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_06"];
			// lowest is first one  
			_uniform = "CUP_U_O_TK_Green";
			_uniform = _uniforms select floor(random(count _uniforms));
			_unit forceAddUniform _uniform;

			_randomItem = floor random 3;
			switch (_randomItem) do
			{
				case 0: { _unit addItemToUniform "SmokeShellOrange"; };
				case 1: {
					_unit addItemToUniform "ACE_fieldDressing";
					_unit addItemToUniform "ACE_fieldDressing";
				};
				case 2: {};
			};
			
			_vests = ["CUP_V_B_GER_Carrier_Rig_2_Brown","CUP_V_I_RACS_Carrier_Rig_2","CUP_V_OI_TKI_Jacket1_04","CUP_V_OI_TKI_Jacket1_06","CUP_V_OI_TKI_Jacket1_05","CUP_V_OI_TKI_Jacket4_05","CUP_V_OI_TKI_Jacket4_06","CUP_V_OI_TKI_Jacket3_03","CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt",
			"CUP_V_O_TK_OfficerBelt","CUP_V_O_TK_CrewBelt","CUP_V_I_Carrier_Belt","CUP_V_OI_TKI_Jacket2_05","CUP_V_OI_TKI_Jacket3_06","CUP_V_OI_TKI_Jacket3_04"];
			// lowest is first one
			_vest = _vests select floor(random(count _vests)); 
			_unit addVest _vest;
			
			_randomWeapon = 0;
			_randomWeapon = floor random 5;
	
			switch (_randomWeapon) do
			{
					case 0: { // AK74-1
						_rifle = "hlc_rifle_ak74"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 1: { // AK74-2
						_rifle = "hlc_rifle_ak74_dirty"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 2: { // AK74-3
						_rifle = "hlc_rifle_ak74_dirty2"; _magazine = "CUP_30Rnd_545x39_AK_M";
						for "_i" from 1 to 2 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 4 do {_unit addItemToVest _magazine;};
						};
					case 3: { // M16A2
						_rifle = "CUP_arifle_M16A2"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
					case 4: { // M4A1
						_rifle = "CUP_arifle_M4A1_black"; _magazine = "30Rnd_556x45_Stanag_Tracer_Yellow";
						for "_i" from 1 to 3 do {_unit addItemToUniform _magazine;};
						for "_i" from 1 to 6 do {_unit addItemToVest _magazine;};
						};
			};
			_unit addBackpack "CUP_B_AlicePack_Khaki";
			
			_rpgCount = floor random [1,1,4];
			for "_i" from 1 to _rpgCount do {_unit addItemToBackpack "RPG7_F";};
			
			_headgears = ["CUP_H_TKI_SkullCap_01","CUP_H_TKI_SkullCap_02","CUP_H_TKI_SkullCap_03","CUP_H_TKI_SkullCap_04","CUP_H_TKI_SkullCap_05","CUP_H_TKI_SkullCap_06","CUP_H_TKI_Pakol_1_01","CUP_H_TKI_Pakol_1_03","CUP_H_TKI_Pakol_1_04","CUP_H_TKI_Pakol_1_05","CUP_H_TKI_Pakol_1_06","CUP_H_TKI_Pakol_2_01","CUP_H_TKI_Pakol_2_02","CUP_H_TKI_Pakol_2_03","H_Shemag_olive","H_ShemagOpen_tan","CUP_H_TKI_Lungee_Open_01","CUP_H_TKI_Lungee_Open_03","CUP_H_TKI_Lungee_Open_06","CUP_H_TKI_Lungee_01","CUP_H_TKI_Lungee_05","H_Cap_tan","CUP_H_C_Beret_02","CUP_H_FR_BandanaGreen","H_Bandanna_cbr","H_Bandanna_sand","H_Bandanna_blu","H_Bandanna_gry","","","","","","","","","","","","","","","","","","",""];
			_headgear = _headgears select floor(random(count _headgears));
			if ( _headgear != "" ) then { _unit addHeadgear _headgear; };
			
			removeGoggles _unit;
			_goggles = ["G_Squares","G_Shades_Green","","","","","","","","","","","",""];
			_goggle = _goggles select floor(random(count _goggles));
			if ( _goggle != "" ) then { _unit addGoggles _goggle; };
			
			_unit addWeapon _rifle;
			_unit addItemToUniform _magazine;
			_unit addWeapon "launch_RPG7_F";
			_unit addItemToBackpack "RPG7_F";
		};
	};
	/*
	if (skill _unit == 0.5) then {
		_unit setUnitAbility 0.6;
		
		_uG   = (floor random [6,7,9])/10;
		_uAA  = (floor random [2,3,4])/10;
		_uASH = (floor random [4,5,6])/10;
		_uASP = (floor random [2,3,4])/10;
		_uSD  = (floor random [2,3,5])/10;
		_uST  = (floor random [2,3,5])/10;
		_uC   = (floor random [1,3,7])/10;
		_uRS  = (floor random [1,2,4])/10;
		_uCM  = (floor random [3,5,8])/10;
		
		_unit setskill ["general",_uG];
		_unit setskill ["aimingAccuracy",_uAA];
		_unit setskill ["aimingShake",_uASH];
		_unit setskill ["aimingSpeed",_uASP];
		_unit setskill ["spotDistance",_uSD];
		_unit setskill ["spotTime",_uST];
		_unit setskill ["courage",_uC];
		_unit setskill ["reloadSpeed",_uRS];
		_unit setskill ["commanding",_uCM];
	};
	*/
	};
};

// ====================================================================================

// If _unit isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;

