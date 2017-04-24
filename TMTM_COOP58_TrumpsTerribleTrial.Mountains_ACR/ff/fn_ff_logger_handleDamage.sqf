params["_unit", "_hitSelction", "_damage", "_source", "_projectile", "_hitIndex", "_instigator"];
if (side _unit == side _instigator) exitWith
{
    _callback = format["FF-Logger: [FRIENDLY FIRE] Mission Time: %1 Victim: %2 Perpetrator: %3", [time, "HH:MM:SS"] call BIS_fnc_secondsToString, (name _unit), (name _instigator)] remoteExec["diag_log", 0];
};