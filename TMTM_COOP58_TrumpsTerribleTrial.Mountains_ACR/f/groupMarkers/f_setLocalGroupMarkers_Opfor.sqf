// F3 - Folk Group Markers - OPFOR
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MARKERS: OPFOR > CSAT
// Markers seen by players in CSAT & CSAT (Pacific) slots.

_colorYellow = [0.667,0.592,0.224];
_colorMaroon = [0.667,0.224,0.224];
_colorIndigo = [0.251,0.188,0.459];
_colorForest = [0.176,0.533,0.176];
_colorOrange = [0.667,0.427,0.224];
_colorViolet = [0.345,0.165,0.447];

if (_unitfaction in ["opf_f","opf_t_f"]) then {
	["GrpCSAT_CO",_hq, " Command", "ColorCivilian"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_ASL",_ft, " Alpha", "ColorRed"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_A1",_ft, "A1", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_A2",_ft, "A2", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_A3",_ft, "A3", "ColorYellow"] spawn f_fnc_localGroupMarker;
	
	["GrpCSAT_BSL",_ft, " Bravo", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_B1",_ft, "B1", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_B2",_ft, "B2", "ColorBlue"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_B3",_ft, "B3", "ColorBlue"] spawn f_fnc_localGroupMarker;
	
	["GrpCSAT_CSL",_ft, " Charlie", "ColorYellow"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_C1",_ft, "C1", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_C2",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_C3",_ft, "C2", "ColorGreen"] spawn f_fnc_localGroupMarker;
	
	["GrpCSAT_DSL",_ft, " Delta", "ColorGreen"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_JSL",_ft, " Johto", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_J1",_ft, "J1", "ColorPink"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_J2",_ft, "J2", "ColorPink"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_MMG1",_sup, "MMG1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MMG2",_sup, "MMG2", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HMG1",_sup, "HMG1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MAT1",_lau, "MAT1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MAT2",_lau, "MAT2", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HAT1",_lau, "HAT1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MTR1",_mor, "MTR1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_MSAM1",_lau, "MSAM1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_HSAM1",_lau, "HSAM1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_ST1",_rec, "ST1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_DT1",_rec, "DT1", "ColorCivilian"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_ENG1",_eng, "ENG", "ColorCivilian"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_IFV1",_ifv, "IFV1", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_IFV2",_ifv, "IFV2", "ColorOrange"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TNK1",_tnk, " Tank 1", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TNK2",_tnk, " Tank 2", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH1",_hel, " Heli", "ColorWhite"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH2",_hel, "Heli 2", "ColorWhite"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH3",_hel, "TH3", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH4",_hel, "TH4", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH5",_hel, "TH5", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH6",_hel, "TH6", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH7",_hel, "TH7", "ColorBlack"] spawn f_fnc_localGroupMarker;
	["GrpCSAT_TH8",_hel, "TH8", "ColorBlack"] spawn f_fnc_localGroupMarker;

	["GrpCSAT_AH1",_hel, "AH1", "ColorBlack"] spawn f_fnc_localGroupMarker;

};

// ====================================================================================