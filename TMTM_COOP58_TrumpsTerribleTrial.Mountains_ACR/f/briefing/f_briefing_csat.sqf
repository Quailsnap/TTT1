// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CSAT

// ====================================================================================
// Radio Structure
// This shows our radio structure. Do not change it.

_rad = player createDiaryRecord ["diary", ["Radio Structure","
<br/><font size='16'>
Command SW Net: CH1 - 100.0
<br/>
Alpha SW Net:	CH2 - 101.0
<br/>
Bravo SW Net:	CH3 - 102.0
<br/>
Charlie SW Net:	CH4 - 103.0
<br/>
Delta SW Net:	CH5 - 104.0
<br/>
Tank SW Net:	CH6 - 110.0
<br/>
Air SW Net:		CH7 - 120.0
<br/>
Command LR Net: CH8 -  50.0
<br/><br/>
Radios should automatically initialize after a brief delay.</font>
<br/><br/>
"]];

// ====================================================================================

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["! Administration","
<br/>
<font size='18'>KNOW YOUR ENEMY</font>
<br/>
- USMC AI can respawn a limited number of times. Taking out their camps will remove their respawns.
<br/>
- The AI will call in support from nearby squads and patrol random sectors. If you remain in one place they will keep coming, so keep moving.
<br/>
- Zeus is not necessary for this mission. If a Zeus is present, do NOT add the spawned in AI to Zeus. The most you should do is blow them up if they get stuck.
<br/><br/>
<font size='18'>MEDICAL AND RESPAWNS</font>
<br/>
- Prevent instant death and revive protection need to both be disabled for this mission. The loadouts are not designed to support them, the respawns are implemented for a reason, and the aggressive nature of the modified AI will make them very unpleasant.
<br/>
- Prevent instant death disabled means bullets generally incapacitate you permanently, which on the battlefield means you die and respawn. Temporary incapacitation should only be expected if you're good at catching small caliber rounds with your plate carrier.
<br/>
- Although this mission has a parameter for advanced medical, loadouts are not designed with advanced medical in mind. There is an ammobox of advanced medical gear in the back of the barn.
<br/>
- Player respawns are limited by tickets. Once the tickets are expended, dying will move you to spectator.
<br/>
- All vehicles will respawn after a few minutes, or if they have been abandoned >500m.
<br/>
- Vital vehicles (Mi8, T55s) can respawn up to three times each.
<br/>
- Non-vital vehicles have unlimited respawns.
<br/><br/>
<font size='18'>GEAR AND FATIGUE</font>
<br/>
- Starting gear and clothing capacity is limited. This is intended. It will give the rearm chopper an actual job to do and encourage cooperation within squads.
<br/>
- Please do not spawn in a box of backpacks unless you are going to enable the increased fatigue parameter.
<br/>
- Increased fatigue is not advanced fatigue. It does however crank up fatigue drain and the effect of heavy loadouts.
<br/>
- You should walk with you weapon lowered at a brisk jog (tactical pace) if using increased fatigue. 'Average' loadout weight should be under 30Kg.
<br/><br/>
<font size='18'>LOGISTICS</font>
<br/>
- Only engineers have the capability to repair vehicle hulls in the field, and even then only partially. If your tank is disabled, call over the infantry to repair it.
<br/>
- You do not have to be an engineer to retrack a tank or replace a wheel.
<br/>
- Every repair costs one toolkit. Keep a supply handy.
<br/>
- Full repairs can be done by anyone as long as they are near the Staging Area's medical cargo house.
<br/>
- There are extra tires, tracks, medical, toolkits, etc already inside the trucks, heli, and tanks.
<br/>
- Vehicle ammo is available at the big box next to the medical facility. Get very close to the side and use ACE Interact to rearm vehicles. It may take two or three trips to get all the magazines necessary.
<br/>
- Extra tires and tracks are available near the medical facility.
<br/>
- Trucks as well as the helicopter can load extra boxes of infantry munitions. They are near the heli.
<br/>
- The sandbag walls in front of the heli can be dragged and loaded in the heli or trucks for in-field fortification.
<br/>
- You can teleport inside the heli at any time from the flagpole.
<br/><br/>
<font size='18'>OTHER BITS</font>
<br/>
- You can adjust your grass settings from the flagpole.
<br/>
- Safestart should prevent you from murdering each other until you leave the starting zone.
<br/>
- Try not to merge groups (tank crews) if you are a group lead. The group marker system runs at the group level, and the markers will disappear if a group is disbanded.
<br/><br/>
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["! Mission Briefing","
<br/>
<font size='18'>MISSION</font>
<br/>
Dobroe utro, comrades. Our Great Assault has pushed the Imperialist Menance nearly back to Alaska. 
Our winter was harsh, our supplies run low, but we will continue to march Eastwards until the last 
of the capitalist scum is driven off our glorious land. Americans have hastily fortified this land. 
In a last ditch effort to hold it they have sprinkled an entire battallion of men and light armor 
across the land. We will drive them back. They are poorly armed and exhausted, beaten by our winter 
and bruised by our weapons. Find their bases. Eliminate as many Americans as you can before their 
helicopters come to whisk them away.
<br/><br/>
<font size='18'>EXECUTION ('BRIEF-ING')</font>
<br/>
- Find the American bases.
<br/>
- Sabotage their bases. Specifically, target their munitions boxes.
<br/>
- Kill as many Americans as possible.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
We are up against hundreds and hundreds of Americans. Their firepower is fairly weak, yet their manpower 
seems endless.
<br/><br/>
<font size='18'>FRIENDLY ASSETS</font>
<br/>
You are a mixed airborne and motorized platoon of our... some of our finest soldiers.
<br/>
You have been alotted the following vehicles:
<br/>
- 1 x Mi-6T 'Hook', a huge Helicopter.
<br/>
- 6 x Ural transport trucks.
<br/>
- 3 x UAZ (DshKM) technical jeeps.
<br/>
- 3 x 
- Various support, ammo, and fuel trucks.
<br/><br/>
<font size='18'>FIRE SUPPORT</font>
<br/>
None available.
<br/><br/>
<font size='18'>RULES OF ENGAGEMENT</font>
<br/>
Kill anything that isn't Russian.
<br/><br/>
"]];

// ====================================================================================

_rad = player createDiaryRecord ["diary", ["Changelog","
<br/>
Mission by: Whale
<br/><br/>
0.98:
<br/>
- Added randomization to US camp structure.
<br/>
- Increased the number of AI significantly.
<br/>
- Increased minimum camp spread.
<br/>
- Tweaked AI gear loadouts.
<br/>
- Added additional defenses to camps.
<br/>
- Reworked squad structure from 2-4-4-4 to 4-4.
<br/>
- Normalized radio structure.
<br/>
- Changed Mi-6 'Hook' to Mi-8MT, adjusted gear accordingly.
<br/>
- Added two T55s and respective crews.
<br/>
- Adjusted squad role makeup.
<br/>
- Adjusted all loadouts.
<br/>
- Added Headless Client support for DAC.
<br/>
- Rewrote match-start viewdistance limiter.
<br/>
- Changed 'GRASS OFF' option to only appear on flagpole and be reversible.
<br/>
- Fixed a problem where one of the US camps' ammoboxes was invincible.
<br/>
- Fixed a problem where vehicles would infinitely respawn.
<br/>
- Added limited tickets to respawns for vital vehicles.
<br/>
- Made it so players would respawn with the gear they first spawned in with, not the gear they died with.
<br/>
- Made it so vehicles would respawn with the gear they first spawned in with, not the gear they died with.
<br/>
- Added haulable, loadable sandbags for field fortifications.
<br/>
- Tweaked localization files.
<br/>
- Gave the US some bigger guns.
<br/>
- Changed repair and rearm systems to be a touch less gamey.
<br/>
- Added more tires, tracks, and toolboxes to vehicles to reflect repair change.
<br/>
- Added randomized cover around US camps to make them easier to approach or defend.
<br/>
- Noticed a problem where one of the five US camps accidentally spawns underwater. Working as intended.
<br/>
- Added some visual variety to the trucks so people can scream at each other when it gets stolen.
<br/>
- Wrestled with a human manifestation of Task Force Arrowhead Radio until it agreed, at gunpoint, to set the radio nets automatically at mission start.
<br/>
- Added custom safestart implementation using a trigger instead of a timer.
<br/>
- Cut out a lot of F3 shit I wasn't using.
<br/>
- Setup parameters for Advanced Medical and DAC debugging.
<br/><br/>
"]];