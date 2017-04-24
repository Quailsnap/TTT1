// F3 - Set CLIENTSIDE FIRETEAM TFR Frequencies Function
// Credits: Whale
// ====================================================================================

_swChannel = switch (groupID (group player)) do {
				case 'Command': 			{0};
				case 'Alpha': 				{1};
				case 'Bravo': 				{2};
				case 'Charlie':				{3};
				case 'Delta':				{4};
				case 'Observation':			{5};
				case 'Heli':				{5};
				default 					{7};
};

[(call TFAR_fnc_activeSwRadio), _swChannel] call TFAR_fnc_setSwChannel;

// ====================================================================================
