if ((!alive ZSU1) && (!alive ZSU2) && (!alive ZSU3)) then {
	private _firstSpawnPosition = [15532.4,1217.45,0];
	private _firstTargetPosition = getPos helipad1;
	private _secondSpawnPosition = [15821.8,1146.14,0];
	private _secondTargetPosition = getPos helipad2;

	private _heloClass = "gm_ge_army_ch53gs";
	private _heloSpawnHeight = 200;

	private _helo1 = createVehicle [_heloClass, _firstSpawnPosition, [], 0, "FLY"];
	_helo1 setVehicleVarName "helo1";
	helo1 = _helo1;
	private _helo1Pos = getPosATL _helo1;
	_helo1 setPosATL [_helo1Pos # 0, _helo1Pos # 1, _heloSpawnHeight];
	_helo1 setDir((getPosATL _helo1) getDir _firstTargetPosition);

	private _helo1Group = createVehicleCrew _helo1;
	private _waypoint = _helo1Group addWayPoint [[_firstTargetPosition # 0, _firstTargetPosition # 1, 0], 0, 1];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "CARELESS";
	_waypoint setWaypointSpeed "NORMAL";
	_waypoint waypointAttachObject helipad1;
	_waypoint setWaypointStatements ["true", "helo1 land 'Land'"];




	private _helo2 = createVehicle [_heloClass, _secondSpawnPosition, [], 0, "FLY"];
	_helo2 setVehicleVarName "helo2";
	helo2 = _helo2;
	private _helo2Pos = getPosATL _helo2;
	_helo2 setPosATL [_helo2Pos # 0, _helo2Pos # 1, _heloSpawnHeight];
	_helo2 setDir((getPosATL _helo2) getDir _secondTargetPosition);

	private _helo2Group = createVehicleCrew _helo2;
	private _waypoint2 = _helo2Group addWayPoint [[_secondTargetPosition # 0, _secondTargetPosition # 1, 0], 0, 1];
	_waypoint2 setWaypointType "MOVE";
	_waypoint2 setWaypointBehaviour "CARELESS";
	_waypoint2 setWaypointSpeed "NORMAL";
	_waypoint2 waypointAttachObject helipad2;
	_waypoint2 setWaypointStatements ["true", "helo2 land 'Land'"];



	private _allCurators = [];
	{
		_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
	} forEach allCurators;

	private _now = date;
	_hour = _now # 3;
	_minute = _now # 4;

	[format['[0%1:%2] Helicopters have spawned and are on their way to the first Exfil-Location. ETA: 2m 10s', _hour, _minute]] remoteExec ["systemChat", _allCurators];
} else {
	private _allCurators = [];
	{
		_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
	} forEach allCurators;

	private _now = date;
	_hour = _now # 3;
	_minute = _now # 4;

	[format['[0%1:%2] Helicopters will not spawn, because not all ZSUs have been destroyed!', _hour, _minute]] remoteExec ["systemChat", _allCurators];
};