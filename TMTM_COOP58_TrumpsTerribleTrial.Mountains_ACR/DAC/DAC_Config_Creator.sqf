//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

//////////////////////////////////////////////////////////
// Modified by Monsoon to be headless client compatible //
//////////////////////////////////////////////////////////

isHC = if(!isServer && !hasInterface) then{ True } else{ False };

_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};

scalar = "any";DAC_Init_Camps = 0;

waituntil{time > 0.3};

if(isServer || isHC) then {if(local player) then {DAC_Code = 1} else {DAC_Code = 0}} else {if(isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

	if(isNil "DAC_STRPlayers")		then {		DAC_STRPlayers		= ["tester","UnitBLU_CO_C","UnitBLU_CO_M","UnitBLU_TH1_CP","UnitBLU_TH1_P","UnitBLU_A_SL","UnitBLU_A_M","UnitBLU_A_D","UnitBLU_A_G","UnitBLU_A1_FTL","UnitBLU_A1_G","UnitBLU_A1_AB","UnitBLU_A1_AR","UnitBLU_A2_FTL","UnitBLU_A2_G","UnitBLU_A2_AB","UnitBLU_A2_AR","UnitBLU_B_SL","UnitBLU_B_M","UnitBLU_B_D","UnitBLU_B_G","UnitBLU_B1_FTL","UnitBLU_B1_G","UnitBLU_B1_AB","UnitBLU_B1_AR","UnitBLU_B2_FTL","UnitBLU_B2_G","UnitBLU_B2_AB","UnitBLU_B2_AR","UnitBLU_C_SL","UnitBLU_C_M","UnitBLU_C_D","UnitBLU_C_G","UnitBLU_C1_FTL","UnitBLU_C1_G","UnitBLU_C1_AB","UnitBLU_C1_AR","UnitBLU_C2_FTL","UnitBLU_C2_G","UnitBLU_C2_AB","UnitBLU_C2_AR","UnitBLU_D_SL","UnitBLU_D_M","UnitBLU_D_D","UnitBLU_D_G","UnitBLU_D1_FTL","UnitBLU_D1_G","UnitBLU_D1_AB","UnitBLU_D1_AR","UnitBLU_D2_FTL","UnitBLU_D2_G","UnitBLU_D2_AB","UnitBLU_D2_AR","UnitBLU_E_SL","UnitBLU_E_M","UnitBLU_E1_R","UnitBLU_E1_AT","UnitBLU_E2_AR","UnitBLU_E2_R"]};
	if(isNil "DAC_AI_Count_Level")	then {		DAC_AI_Count_Level  = [[1,2],[3,5],[4,6],[6,11],[1,0]] };
	if(isNil "DAC_Dyn_Weather") 	then {		DAC_Dyn_Weather		= [0,0,0,[0, 0, 0],0] };
	if(isNil "DAC_Reduce_Value") 	then {		DAC_Reduce_Value	= [1000,1080,0.2] };
	if(isNil "DAC_AI_Spawn") 		then {		DAC_AI_Spawn		= [[240,120,120],[240,120,120],1,0,400,0]		};
	if(isNil "DAC_Delete_Value") 	then {		DAC_Delete_Value	= [[9000,1],[9000,1],9000] };
												// using vanilla GC
	if(isNil "DAC_Del_PlayerBody") 	then {		DAC_Del_PlayerBody	= [9000,1]};
	if(isNil "DAC_Com_Values") 		then {		DAC_Com_Values		= [0,1,0,0]	};
																	//[0,1,0,0] normal, [1,2,3,1] debug
	if(isNil "DAC_AI_AddOn") 		then {		DAC_AI_AddOn		= 1	};
	if(isNil "DAC_AI_Level") 		then {		DAC_AI_Level		= 3	};
	if(isNil "DAC_Res_Side") 		then {		DAC_Res_Side		= 0 };
	if(isNil "DAC_Marker") 			then {		DAC_Marker			= 0 };
																	//0 normal, 2 debug
	if(isNil "DAC_WP_Speed") 		then {		DAC_WP_Speed		= 0.1 };
	if(isNil "DAC_Join_Action")		then {		DAC_Join_Action		= false };
	if(isNil "DAC_Fast_Init") 		then {		DAC_Fast_Init		= false };
	if(isNil "DAC_Player_Marker")	then {		DAC_Player_Marker	= false };
	if(isNil "DAC_Direct_Start")	then {		DAC_Direct_Start	= false };
	if(isNil "DAC_Activate_Sound")	then {		DAC_Activate_Sound	= false };
	if(isNil "DAC_Auto_UnitCount")	then {		DAC_Auto_UnitCount	= [32,0] };
	if(isNil "DAC_Player_Support")	then {		DAC_Player_Support	= [0,[0,2000,3,1000]] };
	if(isNil "DAC_SaveDistance")	then {		DAC_SaveDistance	= [500,["DAC_Save_Pos"]] };
	if(isNil "DAC_Radio_Max")		then {		DAC_Radio_Max		= DAC_AI_Level };
		
	DAC_BadBuildings 	= 	[];
	DAC_GunNotAllowed	= 	[];
	DAC_VehNotAllowed	= 	[];
	DAC_Locked_Veh		=	[];
	DAC_SP_Soldiers     =   ["B_soldier_AR_F","B_G_soldier_AR_F","O_soldier_AR_F","O_soldierU_AR_F",				"O_G_soldier_AR_F","I_soldier_AR_F","I_G_soldier_AR_F","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_MG","CUP_I_TK_GUE_Soldier_AR","CUP_I_TK_GUE_Soldier_MG"];
	DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
	DAC_Marker_Val		= 	[];
	DAC_Zones			=	[];
	//=============================================================================================================|
	
	_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Start_Creator.sqf");
	waituntil {scriptdone _scr};
	sleep 0.1;
	waituntil {(DAC_Basic_Value > 0)};
	
if(DAC_Code < 2) then
{
	//===========================================|
	// StartScriptOnServer                       |
	//===========================================|
	//player sidechat "ServerStart"
	//[] execVM "myServerScript.sqf";
	//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
}
else
{
	if(DAC_Code == 3) then
	{
		//===========================================|
		// StartScriptOnJipClient                    |
		//===========================================|
		//player sidechat "JipClientStart"
		//[] execVM "myJipClientScript.sqf";
	}
	else
	{
		//===========================================|
		// StartScriptOnClient                       |
		//===========================================|
		//player sidechat "ClientStart"
		//[] execVM "myClientScript.sqf";
		//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	};
};