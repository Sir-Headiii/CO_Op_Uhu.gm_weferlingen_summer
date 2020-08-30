
1 fadeSound 0;
showHud false;
diwako_dui_main_toggled_off = true;

cutText ["", "BLACK FADED"];
sleep 2;
cutText ["", "PLAIN"];

playMusic "IntroMusic";

private _camera = "camera" camCreate (getPosATL clockCloseup);
_camera camCommand "inertia on";
_camera camSetTarget clockTrainStation;
_camera camSetFov 0.38;
_camera camCommit 0;
_camera cameraEffect ["internal", "BACK"];

sleep 5;

_camera camSetPos (getPosATL clockMediumShot);
_camera camSetFov 0.75;
_camera camCommit 38;
sleep 38;

cutText ["", "BLACK FADED"];

_camera cameraEffect ["terminate", "BACK"];
camDestroy _camera;

sleep 2;
cutText ["", "BLACK IN", 3];
3 fadeSound 1;
sleep 3;

showHud true;
diwako_dui_main_toggled_off = false;