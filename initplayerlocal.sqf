if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];


private _light = "#lightpoint" createVehicleLocal (getPos lightObject1); 
_light setLightBrightness 70; 
_light setLightAmbient [1.0, 1.0, 1.0]; 
_light setLightColor [1.0, 1.0, 1.0]; 
_light lightAttachObject [lightObject1, [0,0,0]];