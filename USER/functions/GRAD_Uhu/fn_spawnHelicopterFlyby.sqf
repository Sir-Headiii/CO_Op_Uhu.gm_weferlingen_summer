private _heliClass = "gm_gc_bgs_mi2p";
private _spawnPos = [2942.07,1381.68,0];
private _targetPos = [13536.1,9360.1,0.0153809];
private _firstWaypointPos = [11199.9,5564.07,0];
private _spawnDir = _spawnPos getDir _firstWaypointPos;

private _heli = createVehicle [_heliClass, _spawnPos, [], 0, "FLY"];
_heli setDir _spawnDir;
private _heliGroup = createVehicleCrew _heli;

private _firstWaypoint = _heliGroup addWaypoint [_firstWaypointPos, 0, 1];
_firstWaypoint setWaypointBehaviour "CARELESS";

private _getOutWaypoint = _heliGroup addWaypoint [_targetPos, 0, 2];
_getOutWaypoint setWaypointType "GETOUT";

//_heli setPilotLight true;