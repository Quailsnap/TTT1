// F3 - TFR Serverside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
/*
private["_west_sr","_west_lr","_east_sr","_east_lr","_ind_sr","_ind_lr"];
// WAIT FOR F3 COMMON LOCAL VARIABLES

//waitUntil {scriptDone f_script_setLocalVars};

// WHALE -- if it's a COOP, match the radio nets
//_playersBLU = if ( west countSide playableUnits > 0 ) then { True } else { False };
_playersRED = if ( independent countSide playableUnits > 0 ) then { True } else { False };_playersIND = if ( east countSide playableUnits > 0 ) then { True } else { False };

_presenceArray = [_playersBLU, _playersRED, _playersIND];
_gameType = if ( {_x} count _presenceArray <= 1 ) then { "COOP" } else { "TVT" };

_west_sr  = ["100","101","102","103","104","105","110","50","51"];
_west_lr  = ["50"];

_east_sr  = _west_sr;
_east_lr  = _west_lr;

_ind_sr  =  _west_sr;
_ind_lr  = 	_west_lr;

//if ( _gameType == "COOP" ) then 
//{*/
	tf_west_radio_code = "_tmtm";
	tf_guer_radio_code = "_tmtm";
	tf_east_radio_code = "_tmtm";
	publicVariable "tf_west_radio_code";
	publicVariable "tf_guer_radio_code";
	publicVariable "tf_east_radio_code";/*
//}
//else 
//{
//	_east_sr  = ["200","201","202","203","204","205","210","150"];
//	_east_lr  = ["150"];

//	_ind_sr  =  ["300","301","302","303","304","305","310","250"];
//	_ind_lr  = 	["250"];
//};

TFAR_defaultFrequencies_sr_west  =   		_west_sr;
TFAR_defaultFrequencies_lr_west  = 			_west_lr;
publicVariable "TFAR_defaultFrequencies_sr_west";
publicVariable "TFAR_defaultFrequencies_lr_west";

TFAR_defaultFrequencies_sr_east  =   		_east_sr;
TFAR_defaultFrequencies_lr_east  = 			_east_lr;
publicVariable "TFAR_defaultFrequencies_sr_east";
publicVariable "TFAR_defaultFrequencies_lr_east";

TFAR_defaultFrequencies_sr_independent  =   _ind_sr;
TFAR_defaultFrequencies_lr_independent  = 	_ind_lr;
publicVariable "TFAR_defaultFrequencies_sr_independent";
publicVariable "TFAR_defaultFrequencies_lr_independent";
// ====================================================================================
*/