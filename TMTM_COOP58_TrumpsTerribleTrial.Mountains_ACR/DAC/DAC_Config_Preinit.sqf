if (!isNil "WH_AI_Scaling" && {WH_AI_Scaling != 0}) then
{	DAC_Auto_UnitCount = [32,WH_AI_Scaling];	};

if (!isNil "ace_medical_preventInstaDeath" && {!ace_medical_preventInstaDeath}) then 
{	DAC_Auto_UnitCount = [58,1];				};

if (!isNil "f_param_debugMode") then 
{
		if (f_param_debugMode == 1) then {
				DAC_Com_Values		= [1,2,3,1];
				DAC_Marker			= 2;
		}
		else {
				DAC_Com_Values		= [0,1,0,0];
				DAC_Marker			= 0;
		};
};

diag_log "DAC: DAC Preinit complete.";

//DAC spawning
diag_log "DAC: Initializing DAC...";

DAC_Basic_Value = 0;
DAC_Camp_Pos_Array = [];

[] execVM "DAC\DAC_Config_Creator.sqf";

waitUntil { sleep 0.5; (DAC_Basic_Value == 1) };
diag_log "DAC: DAC Init complete.";
sleep 10;
DAC_Init_Finished = 1;
publicVariable "DAC_Init_Finished";
diag_log "DAC: AI likely virtualized, mission rolling.";