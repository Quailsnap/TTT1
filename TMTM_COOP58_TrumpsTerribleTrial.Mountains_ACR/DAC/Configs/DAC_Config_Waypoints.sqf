//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.0 - 2007    //
//--------------------------//
//    DAC_Config_Waypoints  //
//--------------------------//
//    Script by Silola      //
//    silola@mapfact.net    //
//////////////////////////////

private [
			"_DAC_WP_Typ","_DAC_WP_Nr","_CheckRadius1","_CheckRadius2","_checkAreaH","_checkAreaH","_array","_checkResol",
			"_checkMaxH","_checkMinH","_checkNear","_checkObjH1","_checkObjH2","_checkCount","_TempWPArray","_DACTemp"
		];

			_DACTemp = ["S","V","T","A","C"];_DAC_WP_Typ = _this select 0;_DAC_WP_Nr = _this select 1;_array = [];_TempWPArray = [];
			
if((_DAC_WP_Typ < 5) && (_DAC_WP_Typ >= 0)) then
{
	switch (_DAC_WP_Nr) do
	{
		case 0:	{ // default
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp---- Default
					_CheckRadius1 	= [	3,		8,		10,		20,		3		];
					_CheckRadius2 	= [	6,		15,		18,		30,		6		];
					_checkAreaH   	= [	999,	999,	999,	10,		10		];
					_checkMaxH    	= [	9999,	9999,	9999,	9999,	9999	];
					_checkMinH    	= [	1,		1,		1,		3,		3		];
					_checkNear    	= [	20,		50,		100,	300,	100		];
					_checkObjH1    	= [	1.5,	0.5,	0.5,	0.2,	1.5		];
					_checkObjH2    	= [	30,		15,		15,		5,		6		];
					_checkCount   	= [	400,	500,	500,	500,	1500	];
					_checkResol   	= [	45,		25,		25,		12,		25		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 1:	{ // low checknear
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp---- Default
					_CheckRadius1 	= [	3,		8,		10,		20,		3		];
					_CheckRadius2 	= [	6,		15,		18,		30,		6		];
					_checkAreaH   	= [	999,	999,	999,	10,		10		];
					_checkMaxH    	= [	9999,	9999,	9999,	9999,	9999	];
					_checkMinH    	= [	1,		1,		1,		3,		3		];
					_checkNear    	= [	2,		5,		5,		5,		5		];
					_checkObjH1    	= [	1.5,	0.5,	0.5,	0.2,	1.5		];
					_checkObjH2    	= [	30,		15,		15,		5,		6		];
					_checkCount   	= [	400,	500,	500,	500,	1500	];
					_checkResol   	= [	45,		25,		25,		12,		25		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 2:	{ // lax
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp----;
					_CheckRadius1 	= [	0,		0,		0,		0,		0		];
					_CheckRadius2 	= [	0,		0,		0,		0,		0		];
					_checkAreaH   	= [	100,	100,	100,	100,	100		];
					_checkMaxH    	= [	5000,	5000,	5000,	5000,	5000	];
					_checkMinH    	= [	1,		1,		1,		1,		1		];
					_checkNear    	= [	0.1,	0.1,	0.1,	0.1, 	0.1		];
					_checkObjH1    	= [	5,		3,  	3,  	2,		2		];
					_checkObjH2    	= [	30,		25,		25,		10,		10		];
					_checkCount   	= [	500,	500,	500,	500,	1500	];
					_checkResol   	= [	45,		45,		45,		45,		45		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 3:	{
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp----;
					_CheckRadius1 	= [	10,		10,		10,		20,		20		];
					_CheckRadius2 	= [	50,		30,		30,		40,		50		];
					_checkAreaH   	= [	100,	1,		1,		10,		10		];
					_checkMaxH    	= [	5000,	5000,	5000,	5000,	5000	];
					_checkMinH    	= [	5,		-1,		-1,		20,		20		];
					_checkNear    	= [	0,		30,		30,		100,	200		];
					_checkObjH1    	= [	0.1,	0.1,	0.1,	0.1,	0.1		];
					_checkObjH2    	= [	30,		10,		10,		5,		4		];
					_checkCount   	= [	200,	200,	200,	500,	500		];
					_checkResol   	= [	45,		36,		36,		12,		12		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 4:	{
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp----;
					_CheckRadius1 	= [	0,		0,		0,		0,		0		];
					_CheckRadius2 	= [ 0,		0,		0,		0,		0		];
					_checkAreaH   	= [	50,		50,		50,		50,		50		];
					_checkMaxH    	= [	5000,	5000,	5000,	5000,	5000	];
					_checkMinH    	= [	5,		5,		3,		5,		5		];
					_checkNear    	= [	0,		0,		0,		0,		3		];
					_checkObjH1    	= [	5,		0.1,	0.1,	8,		5		];
					_checkObjH2    	= [	50,		50,		5,		5,		50		];
					_checkCount   	= [	500,	500,	500,	500,	500		];
					_checkResol   	= [	18,		18,		18,		18,		18		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 5:	{
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp----;
					_CheckRadius1 	= [	5,		5,		5,		10,		10		];
					_CheckRadius2 	= [	10,		10,		10,		20,		20		];
					_checkAreaH   	= [	50,		50,		50,		50,		50		];
					_checkMaxH    	= [	5000,	5000,	5000,	5000,	5000	];
					_checkMinH    	= [	-5,		-5,		-3,		-5,		-5		];
					_checkNear    	= [	0,		0,		0,		0,		3		];
					_checkObjH1    	= [	5,		0.1,	0.1,	8,		5		];
					_checkObjH2    	= [	50,		50,		5,		5,		50		];
					_checkCount   	= [	500,	500,	500,	500,	500		];
					_checkResol   	= [	18,		18,		18,		18,		18		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		case 6:	{ // For camp waypoints
					//----------------- #Sol----#Veh----#Tan----#Air----#Camp---- Default
					_CheckRadius1 	= [	3,		8,		10,		20,		15		];
					_CheckRadius2 	= [	6,		15,		18,		30,		40		];
					_checkAreaH   	= [	999,	999,	999,	10,		10		];
					_checkMaxH    	= [	9999,	9999,	9999,	9999,	9999	];
					_checkMinH    	= [	1,		1,		1,		3,		3		];
					_checkNear    	= [	10,		1,		1,		1,		1		];
					_checkObjH1    	= [	1.5,	0.5,	0.5,	0.2,	1.5		];
					_checkObjH2    	= [	30,		15,		15,		5,		6		];
					_checkCount   	= [	400,	500,	500,	500,	1500	];
					_checkResol   	= [	36,		25,		25,		12,		12		];
					
					_TempWPArray  = call compile format["DAC_WP_Pool_%1",(_DACTemp select _DAC_WP_Typ)];
				};
		Default {
					if(DAC_Basic_Value != 5) then
					{
						DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
						hintc "Error: DAC_Config_Waypoints > No valid config number";
					};
					if(true) exitwith {};
				};
	};

	_array =	[
					[(_CheckRadius1 select _DAC_WP_Typ),(_CheckRadius2 select _DAC_WP_Typ),(_checkResol select _DAC_WP_Typ)],
					(_checkAreaH select _DAC_WP_Typ),(_checkNear select _DAC_WP_Typ),
					[(_checkObjH1 select _DAC_WP_Typ),(_checkObjH2 select _DAC_WP_Typ)],(_checkMaxH select _DAC_WP_Typ),
					(_checkMinH select _DAC_WP_Typ),(_checkCount select _DAC_WP_Typ),_TempWPArray
				];
};
_array