if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];


private _light = "#lightpoint" createVehicleLocal (getPos lightObject1); 
_light setLightBrightness 60; 
_light setLightAmbient [1.0, 1.0, 1.0]; 
_light setLightColor [1.0, 1.0, 1.0]; 
_light lightAttachObject [lightObject1, [0,0,0]];

private _light2 = "#lightpoint" createVehicleLocal (getPos lightObject2); 
_light2 setLightBrightness 50; 
_light2 setLightAmbient [1.0, 1.0, 1.0]; 
_light2 setLightColor [1.0, 1.0, 1.0]; 
_light2 lightAttachObject [lightObject1, [0,0,0]];

private _light3 = "#lightpoint" createVehicleLocal (getPos lightObject3); 
_light3 setLightBrightness 50; 
_light3 setLightAmbient [1.0, 1.0, 1.0]; 
_light3 setLightColor [1.0, 1.0, 1.0]; 
_light3 lightAttachObject [lightObject1, [0,0,0]];