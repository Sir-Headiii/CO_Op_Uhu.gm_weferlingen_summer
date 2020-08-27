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
_light2 setLightBrightness 60; 
_light2 setLightAmbient [1.0, 1.0, 1.0]; 
_light2 setLightColor [1.0, 1.0, 1.0]; 
_light2 lightAttachObject [lightObject2, [0,0,0]];

private _light3 = "#lightpoint" createVehicleLocal (getPos lightObject3); 
_light3 setLightBrightness 60; 
_light3 setLightAmbient [1.0, 1.0, 1.0]; 
_light3 setLightColor [1.0, 1.0, 1.0]; 
_light3 lightAttachObject [lightObject3, [0,0,0]];

private _light4 = "#lightpoint" createVehicleLocal (getPos lightObject4); 
_light4 setLightBrightness 60; 
_light4 setLightAmbient [1.0, 1.0, 1.0]; 
_light4 setLightColor [1.0, 1.0, 1.0]; 
_light4 lightAttachObject [lightObject4, [0,0,0]];

private _light5 = "#lightpoint" createVehicleLocal (getPos lightObject5); 
_light5 setLightBrightness 60; 
_light5 setLightAmbient [1.0, 1.0, 1.0]; 
_light5 setLightColor [1.0, 1.0, 1.0]; 
_light5 lightAttachObject [lightObject5, [0,0,0]];