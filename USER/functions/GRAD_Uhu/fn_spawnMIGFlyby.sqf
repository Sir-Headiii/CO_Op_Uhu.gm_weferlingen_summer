private _planeFlightHeight = 400;
private _spawnPos = [9752.43,20427.2,0];
private _targetPos = [10006.6,-3493.7,_planeFlightHeight];
private _planeClass = "rhs_mig29s_vvsc";

private _currentSpawnPos = _spawnPos;
private _spawnDir = _spawnPos getDir _targetPos;

private _MIG1 = createVehicle [_planeClass, _currentSpawnPos, [], 0, "FLY"];
private _planePos = getPosATL _MIG1;
_MIG1 setPosATL [_planePos # 0, _planePos # 1, _planeFlightHeight];
_MIG1 setDir _spawnDir;
private _MIGGroup = createVehicleCrew _MIG1;
_currentSpawnPos = _currentSpawnPos getPos [300, _spawnDir + 180];

private _MIG2 = createVehicle [_planeClass, _currentSpawnPos, [], 0, "FLY"];
private _planePos = getPosATL _MIG2;
_MIG2 setPosATL [_planePos # 0, _planePos # 1, _planeFlightHeight];
_MIG2 setDir _spawnDir;
private _MIG2Group = createVehicleCrew _MIG2;
(units _MIG2Group) join _MIGGroup;
_currentSpawnPos = _currentSpawnPos getPos [300, _spawnDir + 180];

_MIGGroup setFormation "FILE";

private _waypoint = _MIGGroup addWayPoint [[_targetPos # 0, _targetPos # 1, _planeFlightHeight], 0, 1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";

[{
(_this # 0) flyInHeight (_this # 2);
(_this # 1) flyInHeight (_this # 2);
}, [_MIG1, _MIG2, _planeFlightHeight], 5] call CBA_fnc_waitAndExecute;

[{
	(_this # 1) inArea [_this # 0, 600, 600, 0, false]
}, {
	{
		private _plane = vehicle _x;
		deleteVehicle _x;
		deleteVehicle _plane;
	} forEach (units (group (_this # 1)));
	[{
		private _seats = nearestObjects [_this # 0, ["rhs_k36d5_seat"], 1000];
		{
			deleteVehicle _x;
		} forEach _seats;
	}, [_this # 0], 1] call CBA_fnc_waitAndExecute;
}, [_targetPos, _MIG1]] call CBA_fnc_waitUntilAndExecute;

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] MIGs have spawned and are heading south.', _hour, _minute]] remoteExec ["systemChat", _allCurators];