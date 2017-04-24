//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Camps      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_CampTyp","_campBasic","_campAmmo","_campStatic","_campWall","_campObjInit",
			"_campUserObj","_campAddUnit","_campRandomObj","_Unit_Pool_C","_array"
		];

			_CampTyp = _this select 0;_array = [];

switch (_CampTyp) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		_campBasic     = ["FlagSmall_F",["Land_WoodenLog_F",0,2,0],["Land_TentDome_F",0,-1,0],["Logic",0,5,0],0];
		_campAmmo      = [];
		_campStatic    = [];
		_campAddUnit   = [];
		_campUserObj   = [["Campfire_burning_f",2,2,0]];
		_campRandomObj = [[["Land_TentDome_F",0.1,100]],8,0,25,5];
		_campWall	   = [];
		_campObjInit   = [["_x enableSimulationGlobal false;"],[],[],[],["DAC_Camp_Pos_Array pushBack (position _x); publicVariable 'DAC_Camp_Pos_Array';"],["_x allowDamage false; _x enableSimulationGlobal false;"],[]];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 1:
	{
		_campBasic     = ["Flag_US_F",["FirePlace_burning_f",15,10,0],["Land_BagBunker_Tower_F",10,0,0],["Logic",10,15,0],0];
		_campAmmo      = [["rhsusf_mags_crate",20,2,0]];
		_campStatic    = [];
		_campAddUnit   = ["B_soldier_LAT_F"];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = [];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};

//-------------------------------- LARGE BLUFOR FOB -----------------------------------------------------------
	case 2:
	{
		_campBasic     = ["Flag_US_F",["Land_WaterTank_F",8,5,0],["Land_Cargo_HQ_V1_F",9,1,180],["Logic",8,-36,0],0];
		_campAmmo      = [["CUP_USLaunchersBox",8,-6,15]];
		_campStatic    = [];
		_campAddUnit   = ["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_AA"];
		
		_userObjData = selectRandom [1,2,3]; // 123
		if (_userObjData == 1) then {_campUserObj = [
			["Land_BagBunker_Tower_F",20,-20,270],["Land_BagBunker_Tower_F",-5,-20,90],
			["Land_Cargo_House_V1_F",1,21,0],["Land_Cargo_House_V1_F",10,21,0],
			["Land_Mil_ConcreteWall_F",-2,12,135],["Land_Mil_ConcreteWall_F",17,12,45],
			["Land_Mil_ConcreteWall_F",-2,-10,225],["Land_Mil_ConcreteWall_F",17,-10,315]];};
		if (_userObjData == 2) then {_campUserObj = [
			["Land_Cargo_Patrol_V1_F",26,-20,270],["Land_Cargo_Patrol_V1_F",-11,-20,90],
			["Land_Shed_Small_F",15,16,270],
			["Land_Mil_ConcreteWall_F",-2,12,135],["Land_Mil_ConcreteWall_F",17,12,45],
			["Land_Mil_ConcreteWall_F",-2,-10,225],["Land_Mil_ConcreteWall_F",17,-10,315]];};
		if (_userObjData == 3) then {_campUserObj = [
			["Land_Cargo_Patrol_V2_F",26,-20,270],["Land_Cargo_Patrol_V2_F",-11,-20,90],
			["Land_Cargo_House_V2_F",1,21,0],["Land_Cargo_House_V2_F",10,21,0],
			["Land_BagFence_Round_F",-2,12,135],["Land_BagFence_Round_F",17,12,45],
			["Land_BagFence_Round_F",-2,-10,225],["Land_BagFence_Round_F",17,-10,315]];};
			
		_campRandomObj = [[["Land_SharpStone_01",0.3,30],["Land_SharpStone_02",0.8,10],["Land_SharpStone_03",0.15,60],["Land_GarbageWashingMachine_F",0.4,20],["Land_GarbagePallet_F",0.3,25],["Land_Tyres_F",0.3,5],["Land_Mound01_8m_F",0.5,25],["Land_Mound02_8m_F",0.2,35],["Land_Wreck_T72_Hull_F",0.5,5],["Land_Wreck_BRDM2_F",0.3,5],["Land_Wreck_HMMWV_F",0.4,10],["Land_Wreck_BMP2_F",0.4,5],["Land_Wreck_UAZ_F",0.3,7],["Land_Pipes_Large_F",0.1,10],["Land_Coil_F",0.1,5],["Land_StallWater_F",0.1,5],["Land_BagBunker_Small_F",0.1,2]],20,0,80,25];
		
		_wallshiftX = -15;
		_wallshiftY = 28;
		_wallX = 45;
		_wallY = 50;
		_wallData = selectRandom [1,2,3,4,5,6]; //123456
		if (_wallData == 1) then {_campWall = 
			["Land_HBarrierBig_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,2,1,0],[1,0.1],[0,0]];};
		if (_wallData == 2) then {_campWall = 
			["Land_Mil_WallBig_4m_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,4,3,0],[1,0.1],[0,0]];};
		if (_wallData == 3) then {_campWall = 
			["Land_HBarrierWall4_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,4,2,0],[1,0.1],[0,0]];};
		if (_wallData == 4) then {_campWall = 
			["Land_CncWall4_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,4,2,0],[1,0.1],[0,0]];};
		if (_wallData == 5) then {_campWall = 
			["Land_Rampart_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,2,2,0],[1,0.1],[0,90]];};
		if (_wallData == 6) then {_campWall = 
			["Land_Wall_IndCnc_4_F",[_wallshiftX,_wallshiftY],[_wallX,_wallY,0],[0,3,2,0],[1,0.2],[0,0]];};
		
		
		_campObjInit   = [
			["_x enableSimulationGlobal false; _x allowDamage true;"], //campBasic
			["clearWeaponCargo _x; _x allowDamage true; DAC_Camp_Pos_Array pushBack (position _x); publicVariable 'DAC_Camp_Pos_Array';"], //campAmmo
			[], //campStatic
			[], //campAddUnit
			[" _x enableSimulationGlobal false; _x allowDamage true;"], //campUserObj
			["_x allowDamage false; _x enableSimulationGlobal false;"], //campRandomObj
			["_x allowDamage false; _x enableSimulationGlobal false;"] //campWall
		];
	};
//------------------------------------ EMPTY CAMP  -----------------------------------------------------------

	case 3:
	{
		_campBasic     = ["Flag_US_F",["FirePlace_burning_f",2,2,0],["Flag_US_F",-5,0,0],["Logic",-5,-5,0],0];
		_campAmmo      = [];
		_campStatic    = [];
		_campAddUnit   = ["B_soldier_LAT_F","B_soldier_LAT_F"];
		_campUserObj   = [];
		_campRandomObj = [];
		_campWall      = [];
		_campObjInit   = [[],[],[],[],[],[],[]];
	};

//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Camps > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array = [_campBasic,_campAmmo,_campStatic,_campAddUnit,_campUserObj,_campRandomObj,_campWall,_campObjInit];
_array