
private _spawnPosition = [6039.75,16407.4,500];
private _targetPosition = [18609.3,1300.09,0];
private _planeClass = "gm_ge_airforce_do28d2";
private _planeFlightHeight = 500;

private _plane = createVehicle [_planeClass, _spawnPosition, [], 0, "FLY"];
private _planePos = getPosATL _plane;
_plane setPosATL [_planePos # 0, _planePos # 1, _planeFlightHeight];
_plane setDir((getPosATL _plane) getDir _targetPosition);

private _planeGroup = createVehicleCrew _plane;
private _waypoint = _planeGroup addWayPoint [[_targetPosition # 0, _targetPosition # 1, _planeFlightHeight], 0, 1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";

_plane flyInHeight _planeFlightHeight;

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] Aircraft has spawned and is on its way to be shot down. ETA: 1m 50s', _hour, _minute]] remoteExec ["systemChat", _allCurators];