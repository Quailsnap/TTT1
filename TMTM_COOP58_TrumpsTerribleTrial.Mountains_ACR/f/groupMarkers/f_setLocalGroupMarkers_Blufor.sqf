// F3 - Folk Group Markers - BLUFOR
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MARKERS: BLUFOR > NATO
// Markers seen by players in NATO, NATO (Pacific) & CTRG slots.

if (_unitfaction in ["blu_f","blu_t_f","blu_ctrg_f"]) then {

	["GrpBLU_CO",_hq, " Command", "ColorYellow"] spawn f_fnc_localGroupMarker;

	["GrpBLU_A",_ft, " Alpha", "ColorRed"] spawn f_fnc_localGroupMarker;

	["GrpBLU_B",_ft, " Bravo", "ColorBlue"] spawn f_fnc_localGroupMarker;
	
	["GrpBLU_C",_ft, " Charlie", "ColorGreen"] spawn f_fnc_localGroupMarker;
	
	["GrpBLU_D",_ft, " Delta", "ColorOrange"] spawn f_fnc_localGroupMarker;

	["GrpBLU_O",_sup, " Observation", "ColorCivilian"] spawn f_fnc_localGroupMarker;

	["GrpBLU_TH1",_hel, " Pilots", "ColorBlack"] spawn f_fnc_localGroupMarker;
};


// ====================================================================================