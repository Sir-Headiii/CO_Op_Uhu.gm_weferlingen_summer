private _positionNearSpawn = [6791.54,677.748,0];
private _disembarkPosition = [10874.9,2472.03,0];
private _campPosition = [11011,2326.88,0];
private _carClass = "gm_gc_army_ural4320_cargo";
private _unitsToSpawn = ["gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_machinegunner_lmgrpk_80_str", "gm_gc_army_medic_mpiak74n_80_str", "gm_gc_army_machinegunner_pk_80_str", "gm_gc_army_antitank_mpiak74n_rpg7_80_str"];

private _roadToSpawn = [_positionNearSpawn, 15] call BIS_fnc_nearestRoad;
private _roadToSpawnPosition = getPosASL _roadToSpawn;
private _carPosition = _roadToSpawnPosition findEmptyPosition [0,0,_carClass];
private _car = _carClass createVehicle _carPosition;

if ((((roadsConnectedTo _roadToSpawn) # 0) distance2d _disembarkPosition) < (((roadsConnectedTo _roadToSpawn) # 1) distance2d _disembarkPosition)) then {
	_car setDir (_roadToSpawn getDir ((roadsConnectedTo _roadToSpawn) # 0));
}
else
{
	_car setDir (_roadToSpawn getDir ((roadsConnectedTo _roadToSpawn) # 1));
};

private _attackGroup = createGroup [east, true];

while {(count (units _attackGroup)) < ([_carClass, true] call BIS_fnc_crewCount)} do {
	private _type = selectRandom _unitsToSpawn;
	private _unit = _type createUnit [_roadToSpawnPosition findEmptyPosition [0,10,_type], _attackGroup];
};

{
	_x moveinAny _car;
	
} forEach (units _attackGroup);

private _getOutWaypoint = _attackGroup addWayPoint [_disembarkPosition, 0, 1];
_getOutWaypoint setWaypointType "GETOUT";
_getOutWaypoint setWaypointBehaviour "AWARE";
_getOutWaypoint setWaypointSpeed "NORMAL";
_getOutWaypoint setWaypointStatements ["true","
private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;
private _now = date;
_hour = _now # 3;
_minute = _now # 4;
[format['[0%1:%2] Search Party has disembarked and proceeds to camp...', _hour, _minute]] remoteExec ['systemChat', _allCurators];
"];

private _attackWaypoint = _attackGroup addWayPoint [_campPosition, 0, 2];
_attackWaypoint setWaypointType "SAD";
_attackWaypoint setWaypointBehaviour "AWARE";
_attackWaypoint setWaypointSpeed "LIMITED";

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] Search Party has spawned. ETA: 5m 30s', _hour, _minute]] remoteExec ["systemChat", _allCurators];