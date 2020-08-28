private _positionNearSpawn = [6791.54,677.748,0];
private _disembarkPosition = [10874.9,2472.03,0];
private _campPosition = [11011,2326.88,0];
private _carClass = "gm_gc_army_ural4320_cargo";
private _unitsToSpawn = ["O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F",  "O_soldier_M_F", "O_soldier_AR_F"];

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
	private _unit = _attackGroup createUnit [_type, _roadToSpawnPosition findEmptyPosition [0,10,_type], [], 0, "NONE"];
	[_unit] call GRAD_Loadout_fnc_doLoadoutForUnit;

	private _face = selectRandom ["gm_face_whiteHead_01", "gm_face_whiteHead_02", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16"];
	[_unit, _face] remoteExec ["setFace", 0, _unit];

	private _speaker = selectRandom ["gm_voice_male_deu_01", "gm_voice_male_deu_02", "gm_voice_male_deu_03", "gm_voice_male_deu_04", "gm_voice_male_deu_05", "gm_voice_male_deu_06", "gm_voice_male_deu_07", "gm_voice_male_deu_08", "gm_voice_male_deu_09"];
	[_unit, _speaker] remoteExec ["setSpeaker", 0, _unit];
};

// _attackGroup enableGunLights "ForceOn";

{
	_x moveinAny _car;
	
} forEach (units _attackGroup);

private _getOutWaypoint = _attackGroup addWayPoint [_disembarkPosition, 0, 1];
_getOutWaypoint setWaypointType "GETOUT";
_getOutWaypoint setWaypointBehaviour "AWARE";
_getOutWaypoint setWaypointSpeed "NORMAL";
_getOutWaypoint setWaypointStatements ["true","
(group this) enableGunLights 'ForceOn';
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