
private _spawnPosition = [6039.75,16407.4,500];
private _targetPosition = [18384,296.317,0];
private _planeClass = "gm_ge_airforce_do28d2";
private _planeFlightHeight = 1000;

private _plane = createVehicle [_planeClass, _spawnPosition, [], 0, "FLY"];
_plane setVehicleVarName "FlyByPlane";
FlyByPlane = _plane;
private _planePos = getPosATL _plane;
_plane setPosATL [_planePos # 0, _planePos # 1, _planeFlightHeight];
_plane setDir((getPosATL _plane) getDir _targetPosition);

private _planeGroup = createVehicleCrew _plane;
private _waypoint = _planeGroup addWayPoint [[_targetPosition # 0, _targetPosition # 1, _planeFlightHeight], 0, 1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointSpeed "FULL";

[{
	(damage (_this # 0) >= 0.05) || (count (crew (_this # 0)) <= 0)
},{
	(_this # 0) setDamage 1;
}, [_plane]] call CBA_fnc_waitUntilAndExecute;

[{
	(getPos (_this # 0)) inArea [[9915.58,9671.76,0], 1000, 1000, 0, false]
}, {
	
	if (alive ZSU1 && alive ZSU2 && alive ZSU3) then {
		activateAntiAirSirens = true;
	};
	
	[{
		{
			createVehicleCrew _x;
			private _vehicleGroup = group _x;
			_vehicleGroup reveal [_this#0, 4];
			_x doTarget (_this#0);
			[_this # 0, _x] spawn {
				while {(alive (_this # 0)) && (count (crew (_this # 0)) > 0)} do {
					(_this # 1) doTarget (_this # 0);
				};
			};
			[{
				(!(alive (_this#0))) || (count (crew (_this#0)) <= 0)
			}, {
				//(group (_this#1)) setBehaviour "SAFE";
				_this#1 setPilotLight false;
				[{
					{
						deleteVehicle _x;
					} forEach (units (_this#0));
				}, [_this # 1], 5] call CBA_fnc_waitAndExecute;
			}, [_this # 0, _x]] call CBA_fnc_waitUntilAndExecute;
		} forEach [ZSU1, ZSU2, ZSU3];
	}, [_this # 0], 10] call CBA_fnc_waitAndExecute;
}, [_plane]] call CBA_fnc_waitUntilAndExecute;

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] Aircraft has spawned and is on its way to be shot down. ETA: 1m 50s', _hour, _minute]] remoteExec ["systemChat", _allCurators];

[{(_this # 0) flyInHeight (_this # 1);}, [_plane, _planeFlightHeight], 10] call CBA_fnc_waitAndExecute;