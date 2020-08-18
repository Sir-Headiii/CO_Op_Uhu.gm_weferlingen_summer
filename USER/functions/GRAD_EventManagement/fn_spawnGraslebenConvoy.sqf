
private _spawnPositionFirstVehicle = [6978.36,10555,0];
private _direction = 133.725;

private _convoy = [];

// private _lead = ["gm_gc_army_ural375d_refuel", _spawnPositionFirstVehicle, _direction] call grad_uhu_fnc_spawnVehicleWithCrew;
// _convoy pushBackUnique (_lead # 1);
private _currentSpawnPosition = _spawnPositionFirstVehicle;
private _firstVehicle = "gm_gc_army_ural4320_cargo" createVehicle _currentSpawnPosition;
_firstVehicle setDir _direction;
private _firstVehicleInf = createGroup [east, true];
private _unitsToSpawn = ["gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_machinegunner_lmgrpk_80_str", "gm_gc_army_medic_mpiak74n_80_str", "gm_gc_army_machinegunner_pk_80_str", "gm_gc_army_antitank_mpiak74n_rpg7_80_str"];
while {(count (units _firstVehicleInf)) < (["gm_gc_army_ural4320_cargo", true] call BIS_fnc_crewCount)} do {
	private _type = selectRandom _unitsToSpawn;
	private _unit = _type createUnit [_currentSpawnPosition findEmptyPosition [0,10,_type], _firstVehicleInf];
};

{
	_x moveinAny _firstVehicle;
	
} forEach (units _firstVehicleInf);

_convoy pushBackUnique _firstVehicle;
// private _leadGroup = _lead # 0;
// _leadGroup addWaypoint [[10225,7983.88,0], 0, 1];
// private _leadFinalWaypoint = _leadGroup addWaypoint [[6066.54,20.9021,0], 0, 2];
// _leadFinalWaypoint setWaypointStatements ["true", "{{deleteVehicle _x;} foreach crew (_x) + [_x];} foreach (missionNamespace getVariable ['allVehiclesConvoyGrasleben', []]);"];

for [{_i = 0}, {_i < 3}, {_i = _i + 1}] do {
	_currentSpawnPosition = _currentSpawnPosition getPos [30, _direction + 180];
	_convoy pushBackUnique (["gm_gc_army_ural4320_reammo", _currentSpawnPosition, _direction] call grad_uhu_fnc_spawnVehicleWithCrew) # 1;
};

_currentSpawnPosition = _currentSpawnPosition getPos [30, _direction + 180];
private _lastVehicle = "gm_gc_army_ural4320_cargo" createVehicle _currentSpawnPosition;
_lastVehicle setDir _direction;
private _lastVehicleInf = createGroup [east, true];
private _unitsToSpawn = ["gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_rifleman_mpiak74n_80_str", "gm_gc_army_machinegunner_lmgrpk_80_str", "gm_gc_army_medic_mpiak74n_80_str", "gm_gc_army_machinegunner_pk_80_str", "gm_gc_army_antitank_mpiak74n_rpg7_80_str"];
while {(count (units _lastVehicleInf)) < (["gm_gc_army_ural4320_cargo", true] call BIS_fnc_crewCount)} do {
	private _type = selectRandom _unitsToSpawn;
	private _unit = _type createUnit [_currentSpawnPosition findEmptyPosition [0,10,_type], _lastVehicleInf];
};

{
	_x moveinAny _lastVehicle;
	
} forEach (units _lastVehicleInf);

_convoy pushBackUnique _lastVehicle;
missionNamespace setVariable ["allVehiclesConvoyGrasleben", _convoy];

//sleep 5;

[{_this inArea [[6184.69,262.391,0], 200, 200, 0, false, 75]}, {
	{
		{
			deleteVehicle _x;
		} foreach crew (_x) + [_x];
	} foreach (missionNamespace getVariable ['allVehiclesConvoyGrasleben', []]);

	private _allCurators = [];
	{
		_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
	} forEach allCurators;

	private _now = date;
	_hour = _now # 3;
	_minute = _now # 4;

	[format['[0%1:%2] Grasleben convoy has arrived and despawned.', _hour, _minute]] remoteExec ["systemChat", _allCurators];	

}, _firstVehicle] call CBA_fnc_waitUntilAndExecute;

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] Grasleben convoy is on its way.', _hour, _minute]] remoteExec ["systemChat", _allCurators];
//systemChat str _convoy;
[_convoy] execVM "USER\scripts\startConvoy.sqf";