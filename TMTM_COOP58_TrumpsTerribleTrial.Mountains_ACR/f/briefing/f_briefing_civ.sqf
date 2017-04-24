// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: AAF

// ====================================================================================
// Radio Structure
// This shows our radio structure. Do not change it.

_rad = player createDiaryRecord ["diary", ["Zeus NOTES","
<br/>
- You may play the mission any way you desire. Do different objectives if you like. I don't care.
<br/>
- Half of the AI are mobile and spawned in with DAC. They are handled by the server. You may delete them if you like, and they follow orders given by you usually. Not always.
<br/>
- The other half are IMMOBILIZED editor-placed AI with dynamic simulation. They are moved to the headless client. You may delete them if you like. They will not follow orders.
<br/>
- Place AI from the Takistani Locals faction. A script will automatically detect them and SHOULD alter their gear to randomize it and make them match the units already placed.
"]];

_brief = player createDiaryRecord ["diary", ["Their Mission","
<br/>
- Clear three valleys and find 2-6 caches therein.<br/>
- Clean out the AA installation.
<br/><br/>
"]];