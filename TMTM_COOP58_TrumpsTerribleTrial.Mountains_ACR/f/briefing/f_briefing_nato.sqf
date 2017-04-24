// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================
// Radio Structure
// This shows our radio structure. Do not change it.

_rad = player createDiaryRecord ["diary", ["Radio Structure","
<br/>
<font size='16'>(Short Range)</font>
<br/>
CH1 - 100.0 - Command <br/>
CH2 - 101.0 - Alpha <br/>
CH3 - 102.0 - Bravo <br/>
CH4 - 103.0 - Charlie <br/>
CH5 - 104.0 - Delta <br/>
CH6 - 105.0 - Observation and Air<br/>
CH8 -  50.0 - Long Range Backup<br/>
<br/>
<font size='16'>(Long Range)</font>
<br/>
CH1 - 50.0 - Platoon Net<br/>
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
- Using the marked plan is optional. If you want to remove the marker clutter entirely there's a mission parameter for that.<br/>
- Respawn tickets are in effect. You will recieve twice as many tickets as there are people in the mission. Infantry respawns take 3-6 minutes.<br/>
- The mission will fail if everyone is dead and all tickets are depleted.<br/>
- MRAPs will not respawn. The helicopter will respawn up to three times. The rest will respawn unlimited times.<br/>
- There is a nifty slideshow inside the 'Briefing Room.'<br/>
- You can change your grass and teleport to the helicopter at the flag pole.<br/>
- The action menu will allow regular infantry to select their weapon of choice after mission start. These options will be removed when Safe Start goes away.<br/>
- Zeus is optional and not recommended.<br/>
- The JTAC (Observation SL) can call in three (3) airstrikes during the mission with ACE Self Interact. Strikes take ~2 min to come in and ~5 min to 'recharge.' They are HE strikes effective against infantry and not much else.<br/>
- Radios are already setup but I encourage you guys to use fireteam nets if you've slotted full 12-man squads.<br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Mission Briefing","
<br/>
<font size='18'>BACKGROUND</font>
<br/>
Field Commander Don Rumsfeld here. I'm sure you're all very confused right now. That's fine. If I had joined the Red Cross hoping to travel around the world and give charity to people in need, I'd be surprised too if I was where you are right now. Yet desperate times call for desperate measured. If the United States is going to be successful in this new Syrian front we'll need all the help we can get. Accordingly, Supreme Commander Donald J. Trump has requisitioned your non-governmental organization, nationalized it, and given you all a gun and a mission. Hopefully your intense forty-eight hours of military training have prepared you for this moment.<br/><br/>
So here you are, coughing up sand and sweating to death in the deserts of South Syria. I'd perk up if I were you. Your objective today is to impress our Supreme Commander, and you'll be competing against the finest NGOs in the world -- names like Blackwater, Viper 6, and the Salvation Army. If you don't give Trump a fine showing today... you may not be in business tomorrow.<br/><br/>
Across the 35th parallel to your south is a valley full of suspected militiants. At this point the war has dragged on so long that we have no idea whether these insurgents hail from ISIS, the SDF, FSA shields, or socialist sects. We do know that they are mostly Muslim, have guns, and look very angry. They have seized an encampment previously held by the Assad regieme and have converted it into an anti-air fortification. So here's what you're going to do --
<br/><br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
- Sweep and clear the three valleys marked (West AO, Central AO, East AO) for ammo caches. There should be between two and six caches per valley.<br/>
- Seize the anti-air installation and clean it free of insurgent presence.<br/>
- Side objective: locate a server on top of a ridgeline west of the Central AO. Wipe it of data. Do NOT look at the contents of the server. 
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
A swathe of socialist rebels who have infested this area of Syria. Expect unconventional forces numbering around three companies' strength. They will have medium anti-tank and possible motorized technical support.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
The International Red Cross.
<br/><br/>
<br/><br/>
<br/><br/>
Mission by: Whale
<br/>
Made with F3
"]];

// ====================================================================================