params ["_unit", "_killer", "_instigator"];

if (side _unit == side (_unit getVariable["ace_lastDamageSource", objNull]) || side _unit == side _killer) then
{
    _callback = format["FF-Logger: [TEAMKILL] Mission Time: %1 Victim: %2 Perpetrator: %3", [time, "HH:MM:SS"] call BIS_fnc_secondsToString, (name _unit), (name (_unit getVariable["ace_lastDamageSource", objNull]))] remoteExec["diag_log", 0];
};