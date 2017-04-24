/* 	
	Calls in an airstrike on cursor.
	By: Whale & Vauun
*/

private["_pos"];

// Get position cursor is pointing to.
_pos = 0;
_pos = screenToWorld [0.5, 0.5];

if (isNil "airstrike_number") then { airstrike_number = 3 };

// If out of airstrikes, exit with a hint.
if (airstrike_number < 1) exitWith {
	_errorString = format["No airstrikes available at this time."];
	vehicle player groupChat _errorString;
	hint _errorString;
	[player,1,["ACE_SelfActions","airstrike"]] call ace_interact_menu_fnc_removeActionFromObject;
};

// If airstrike is on cooldown, exit with a hint.
if (!isNil "airstrike_cooldown" && {airstrike_cooldown > 0}) exitWith {
	_errorString = format["Airstrike currently on cool down. Try again in %1 seconds",airstrike_cooldown];
	vehicle player groupChat _errorString;
	hint _errorString;
};

// If player is less than fifty meters from pointing direction, exit with a hint.
if ((player distance _pos)<50) exitWith {
	_errorString = "Airstrike too close! Try again.";
	vehicle player groupChat _errorString;
	hint _errorString;
};

// The entire action is within the ACE progressbar call.
[6,_pos,
	{ 
	params["_pos"];
	// This happens when the progressbar is successful.
	_null = _pos spawn 
	{
		// Give notice to the player that a strike is inbound.
		_hintS = "Coordinates recieved, airstrike inbound! Give it around two minutes.";
		hint _hintS;
		vehicle player groupChat _hintS;
		_pos = _this;
		
		// Put airstike on cooldown.
		_null = [] spawn 
		{
			airstrike_cooldown = random [120,300,330];
			while {airstrike_cooldown > 0} do
			{ sleep 1; airstrike_cooldown = (airstrike_cooldown - 1); };
		};
		
		// Increment number of strikes downwards.
		airstrike_number = airstrike_number - 1;
		
		// Randomly wait 1-2 minutes.
		sleep random [60,110,140];
		
		// Spawn in an A10 south of the target.
		_simPos = _pos vectorAdd [0,-2500,1500];
		_simCAS = [_simPos, 0, "CUP_B_A10_CAS_USA", independent] call BIS_fnc_spawnVehicle;
		_simVEH = (_simCAS select 0);
		_simVEH setVelocity [0,250,0];
		_simVEH setVehicleAmmo 0;
		[_simVEH, -35, 0] call BIS_fnc_setPitchBank;
		((_simCAS select 1) select 0) setBehaviour "SAFE";

		// Set a waypoint north of the target.
		_wpPos = _pos vectorAdd [0,1000,800];
		_wp = (group ((_simCAS select 1) select 0)) addWaypoint [_wpPos, 0];
		_simVEH flyinHeight 500;
		
		// Wait fifteen seconds.
		sleep 15;
		
		// Spawn a rocket and send it towards the target.
		_bombPos = _pos vectorAdd [0,0,200];
		_bomb = "R_80mm_HE" createVehicle _bombPos;
		_bomb setVelocity [0,0,-2];
		_bomb setVectorDirAndUp [[0,0,-1],[0,1,0]];
		
		// Tell the plane to pitch up and go out of sight.
		_simVEH flyinHeight 2500;

		// If airstrikes remain, tell the player that the plane is refueling.
		if (airstrike_number > 0) then 
		{
			_hintF = format["Airstrike delivered. %1 strike(s) remain. We'll have the bird ready again in roughly five minutes.",airstrike_number];
			hint _hintF;
			vehicle player groupChat _hintF;
		}
		// If none remain, tell the player and remove the action.
		else
		{
			_hintF = format["Airstrikes expended, A10s have exited area. Good luck out there."];
			vehicle player groupChat _hintF;
			hint _hintF;
			[player,1,["ACE_SelfActions","airstrike"]] call ace_interact_menu_fnc_removeActionFromObject;
		}
		
		// Delete the flying A10 after thirty seconds.
		sleep 30;
		deleteVehicle _simVEH;
		deleteVehicle ((_simCAS select 1) select 0);
	};
}, {}, "Calling in Airstrike..."] call ace_common_fnc_progressBar;