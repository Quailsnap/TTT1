player addEventHandler["HandleDamage",{ _this call Xeno_fnc_ff_logger_handleDamage; }];
player addEventHandler["Killed",{ _this call Xeno_fnc_ff_logger_killed; }];