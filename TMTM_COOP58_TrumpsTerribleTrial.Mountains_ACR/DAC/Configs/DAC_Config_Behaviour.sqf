//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Behaviour  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_array","_setSkill","_setCombat","_setBehav","_setSpeed","_setForm","_setPatrol","_setSearch",
			"_setFleeing","_setHeliVal","_setPause","_setBldgBeh","_setSupport","_setJoin","_setEmpVeh","_setSupTime","_setHidTime"
		];

switch (_this select 0) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 0:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.4],[0.2,0.4],[0.2,0.4],[0.2,0.4],[0.5,0.8],[0.2,0.4],[0.2,0.4],[0.2,0.4],[0.2,0.4],[0.2,0.4]];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [6,50,120,600,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};

//-------------------------------------------------------------------------------------------------------------------------
	case 2:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.4],[0.1,0.5],[0.2,0.8],[0.2,0.8],[0.3,0.6],[0.2,0.8],[0.2,0.6],[0.2,0.8],[0.5,0.7],[0.5,0.7]];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,2];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,600,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];//no support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};

//-------------------------------------------------------------------------------------------------------------------------
	case 1:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8]];
		_setCombat  = ["yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0.1,100];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,30],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,70,240,120,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];//support for other zones //blufor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 3:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.4];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [3,50,120,600,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) *	 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 4:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.4];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 5:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.4];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,2];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};

// SENTRY
// Should only walk with weapons lowered
// Will wait long periods of time at each waypoint
// Will search and remain in buildings for a long time
	case 6:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.6],[0.1,0.5],[0.2,0.8],[0.2,0.8],[0.3,0.6],[0.2,0.8],[0.2,0.6],[0.2,0.8],[0.5,0.7],[0.5,0.7]];
		_setCombat  = ["green"];
		_setBehav   = ["safe"];
		_setSpeed   = ["limited"];
		_setForm    = ["column"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[30,120],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [2,50,600,10,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
// CASUAL URBAN PATROL
// Should only walk with weapons lowered
// Will occasionally change formation
// Will search buildings briefly
	case 7:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.6],[0.1,0.5],[0.2,0.8],[0.2,0.8],[0.3,0.6],[0.2,0.8],[0.2,0.6],[0.2,0.8],[0.5,0.7],[0.5,0.7]];
		_setCombat  = ["green"];
		_setBehav   = ["safe"];
		_setSpeed   = ["limited"];
		_setForm    = ["column", "line", "stag column"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,10],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [2,50,10,60,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
// case 9 but for motorized
	case 8:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.6],[0.3,0.5],[0.4,0.8],[0.2,0.6],[0.3,0.5],[0.2,0.7],[0.2,0.5],[0.2,0.5],[0.4,0.8],[0.5,0.7]];
		_setCombat  = ["yellow"]; // red bad mmk
		_setBehav   = ["safe"];
		_setSpeed   = ["limited","normal"];
		_setForm    = ["column","stag column"];
		_setFleeing = [0.05,50];
		_setHeliVal = [50,400,0.8,0];
		_setPause   = [[3,8],[0,5],[0,15],[20,30,5,5],[0,4],[0,0]];
		_setBldgBeh = [3,50,240,400,3];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[50,25]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
// some shit whale made up cause why not
// basically badass nuggas
	case 9:
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.3,0.6],[0.3,0.5],[0.4,0.8],[0.2,0.6],[0.3,0.5],[0.2,0.7],[0.3,0.5],[0.2,0.5],[0.4,0.8],[0.5,0.7]];
		_setCombat  = ["yellow"]; // red bad mmk
		_setBehav   = ["safe"];
		_setSpeed   = ["normal"];
		_setForm    = ["line","stag column"];
		_setFleeing = [0.1,50];
		_setHeliVal = [50,400,0.8,0];
		_setPause   = [[3,8],[0,5],[0,15],[20,30,5,5],[0,4],[0,0]];
		_setBldgBeh = [0,50,240,400,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,0];
		_setJoin    = 0;
		_setEmpVeh  = [[100,75],[150,75]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((5 * DAC_AI_Level) + ((skill _leader) * 25)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Behaviour > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array =	[
				_setSkill,_setCombat,_setBehav,_setSpeed,_setForm,_setFleeing,
				_setHeliVal,_setPause,_setBldgBeh,_setPatrol,_setSearch,
				_setSupport,_setJoin,_setEmpVeh,_setSupTime,_setHidTime
			];
_array