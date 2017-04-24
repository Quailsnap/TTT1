// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
/*
// ADD MISSION MAKER NOTES SECTIONS
// All text added below will only be visible to the current admin

_customText = "<br/>
<font size='18'>Enemy Spawn Locations</font>
<br/>
See 'ADMIN SECTION'"; 
*/
// ====================================================================================

// ADMIN BRIEFING
// This is a generic section displayed only to the ADMIN

_briefing ="
<br/>
<font size='18'>ADMIN SECTION</font><br/>
- This mission can be played with a Zeus, but it's built to not need Zeus at all. If there is a Zeus, let him know all this stuff.
<br/>
- The majority of units are moved to the Headless Client (HC). DAC remains managed by the server.
<br/>
- Safestart (F3) is enabled for this mission. It will disable after fifteen minutes (when f_param_mission_timer == 0), or when players enter the mission area. It makes players invulnerable.
";

// ====================================================================================
/*
// MISSION-MAKER NOTES
// This section displays notes made by the mission-maker for the ADMIN

if (_customText != "") then {
	_briefing = _briefing + "<br/><font size='18'>MISSION-MAKER NOTES</font><br/>";
	_briefing = _briefing + _customText + "<br/><br/>";
};
*/
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["!!! (Admin Only)",_briefing]];

// ====================================================================================