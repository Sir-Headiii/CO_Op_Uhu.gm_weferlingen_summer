private _spawnDirection = 103.450;
private _firstSpawnPosition = [2783.97,6484.21,0];
private _vehicleClass = "gm_gc_army_ural4320_cargo";
private _unitsToSpawn = ["O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_F",  "O_soldier_M_F", "O_soldier_AR_F"];
private _targetWaypoints = [[[9520.15,5898.01,0], [10338.7,6639.84,0]], [[9148.73,6031.06,0], [9960.23,6876.81,0]], [[8899.51,6100.61,0], [9549.06,7167.76,0]], [[8584.43,6119.52,0], [8971.8,7456.78,0]]];

private _allGroups = [];

private _currentSpawnPosition = _firstSpawnPosition;

// private _searchLightSPW = "gm_gc_army_brdm2um" createVehicle _currentSpawnPosition;
// _searchLightSPW setDir _spawnDirection;
// private _searchLightSPwCrew = createVehicleCrew _searchLightSPW;
// [[_searchLightSPW],{(_this # 1) setVehicleVarName "searchLightSPWPatrol"; searchLightSPWPatrol = (_this # 1);}] remoteExec ["call"];
// private _moveWaypoint = _searchLightSPwCrew addWaypoint [[8077.64,4338.21,0], 0, 1];
// _moveWaypoint setWaypointSpeed "FULL";
// private _moveWaypoint2 = _searchLightSPwCrew addWaypoint [[8947.06,5736.09,0], 0, 2];
// _moveWaypoint2 setWaypointStatements ["true", "[] spawn {searchLightSPWPatrol action ['SearchlightOn']; searchLightSPWPatrol addWeaponTurret ['fakeweapon', [0]]; while {(behaviour searchLightSPWPatrol) != 'COMBAT'} do {private _foo = 270; while {_foo < 440} do {searchLightSPWPatrol doWatch (searchLightSPWPatrol getRelPos [200, _foo]); _foo = _foo + 0.5; sleep 0.1;}; while {_foo > 280} do {searchLightSPWPatrol doWatch (searchLightSPWPatrol getRelPos [200, _foo]); _foo = _foo - 0.5; sleep 0.1;};};};"];
// private _patrolWaypoint05 = _searchLightSPwCrew addWaypoint [[8767.35,6124.3,0], 0, 3];
// _patrolWaypoint05 setWaypointStatements ["true", "searchLightSPWPatrol limitSpeed 20;"];
// private _patrolWaypoint1 = _searchLightSPwCrew addWaypoint [[8204.72,6992.36,0], 0, 4];
// private _patrolWaypoint2 = _searchLightSPwCrew addWaypoint [[7776.94,6760.83,0], 0, 5];
// _patrolWaypoint2 setWaypointStatements ["true", "searchLightSPWPatrol limitSpeed 30;"];
// private _patrolWaypoint3 = _searchLightSPwCrew addWaypoint [[8481.2,5629.19,0], 0, 6];
// _patrolWaypoint3 setWaypointStatements ["true", "searchLightSPWPatrol limitSpeed 60;"];
// private _patrolWaypoint4 = _searchLightSPwCrew addWaypoint [[8771.95,6114.6,0], 0, 7];
// _patrolWaypoint4 setWaypointType "CYCLE";

// _currentSpawnPosition = _currentSpawnPosition getPos [75, _spawnDirection + 180];

for [{_i = 0}, {_i < 4}, {_i = _i + 1}] do {
	private _vehicle = _vehicleClass createVehicle _currentSpawnPosition;
	_vehicle setDir _spawnDirection;
	private _vehicleInf = createGroup [east, true];
	while {(count (units _vehicleInf)) < ([_vehicleClass, true] call BIS_fnc_crewCount)} do {
		private _type = selectRandom _unitsToSpawn;
		private _unit = _vehicleInf createUnit [_type, _currentSpawnPosition findEmptyPosition [0,15,_type], [], 0, "NONE"];

		[_unit] call GRAD_Loadout_fnc_doLoadoutForUnit;
		
		private _face = selectRandom ["gm_face_whiteHead_01", "gm_face_whiteHead_02", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16"];
		[_unit, _face] remoteExec ["setFace", 0, _unit];

		private _speaker = selectRandom ["gm_voice_male_deu_01", "gm_voice_male_deu_02", "gm_voice_male_deu_03", "gm_voice_male_deu_04", "gm_voice_male_deu_05", "gm_voice_male_deu_06", "gm_voice_male_deu_07", "gm_voice_male_deu_08", "gm_voice_male_deu_09"];
		[_unit, _speaker] remoteExec ["setSpeaker", 0, _unit];
	};
	// _vehicleInf enableGunLights "ForceOn";
	{
		_x moveinAny _vehicle;
		
	} forEach (units _vehicleInf);

	private _target = _targetWaypoints # _i;
	private _getOut = _vehicleInf addWaypoint [_target # 0, 0, 1];
	_getOut setWaypointType "GETOUT";
	_getOut setWaypointSpeed "FULL";
	_getOut setWaypointStatements ["true", "(group this) enableGunLights 'ForceOn';"];
	private _search = _vehicleInf addWaypoint [_target # 1, 0, 2];
	_search setWaypointType "MOVE";
	_search setWaypointSpeed "LIMITED";
	_search setWaypointFormation "LINE";
	//_search setWaypointBehaviour "COMBAT";
	private _backToVehicle = _vehicleInf addWaypoint [getPos _vehicle, 0, 3];
	_backToVehicle setWaypointType "GETIN";
	_backToVehicle waypointAttachVehicle _vehicle;
	_currentSpawnPosition = _currentSpawnPosition getPos [75, _spawnDirection + 180];	
	//sleep 2;
};

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] Search-Party for Mariental (Horst) is on its way. ETA 7min', _hour, _minute]] remoteExec ["systemChat", _allCurators];