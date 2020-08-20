private _spawnPosition = [10186.9,9785.62,0];
private _spawnDirection = 183.732;
private _vehicleClass = "gm_gc_army_brdm2";
private _waypointLocations = [[11838.4,7388.07,0], [12196.8,5541.46,0], [14697.5,6.89575,0]];
private _currentSpawnPosition = _spawnPosition;

private _vehicle1 = _vehicleClass createVehicle _currentSpawnPosition;
_vehicle1 setDir _spawnDirection;
_vehicle1 setVehicleVarName "SPWConvoyVehicle1";
SPWConvoyVehicle1 = _vehicle1;
private _vehicle1Crew = createVehicleCrew _vehicle1;
// _secondWaypointVehicle1 setWaypointSpeed "LIMITED";
// _thirdWaypointVehicle1 setWaypointSpeed "LIMITED";
SPWConvoyVehicle1 action ["SearchlightOn"];
SPWConvoyVehicle1 addWeaponTurret ['fakeweapon', [1]];
[] spawn {
	while {behaviour SPWConvoyVehicle1 != "COMBAT"} do {
		private _foo = 350;
		while {_foo <= 370} do {
			SPWConvoyVehicle1 doWatch (SPWConvoyVehicle1 getRelPos [400, _foo]);
			_foo = _foo + 0.3;
			sleep 0.1;
		};

		while {_foo >= 350} do {
			SPWConvoyVehicle1 doWatch (SPWConvoyVehicle1 getRelPos [400, _foo]);
			_foo = _foo - 0.3;
			sleep 0.1;
		};
	};
};
_currentSpawnPosition = _currentSpawnPosition getPos [30, _spawnDirection + 180];



private _vehicle2 = _vehicleClass createVehicle _currentSpawnPosition;
_vehicle2 setDir _spawnDirection;
_vehicle2 setVehicleVarName "SPWConvoyVehicle2";
SPWConvoyVehicle2 = _vehicle2;
private _vehicle2Crew = createVehicleCrew _vehicle2;
(units _vehicle2Crew) join _vehicle1Crew;
// private _firstWaypointVehicle2 = _vehicle2Crew addWaypoint [_waypointLocations # 0, 0, 1];
// private _secondWaypointVehicle2 = _vehicle2Crew addWaypoint [_waypointLocations # 1, 0, 2];
// private _thirdWaypointVehicle2 = _vehicle2Crew addWaypoint [_waypointLocations # 2, 0, 3];
// _firstWaypointVehicle2 setWaypointSpeed "LIMITED";
// _secondWaypointVehicle2 setWaypointSpeed "LIMITED";
// _thirdWaypointVehicle2 setWaypointSpeed "LIMITED";
SPWConvoyVehicle2 action ["SearchlightOn"];
SPWConvoyVehicle2 addWeaponTurret ['fakeweapon', [1]];
[] spawn {
	while {behaviour SPWConvoyVehicle2 != "COMBAT"} do {
		private _foo = 345;
		while {_foo >= 295} do {
			SPWConvoyVehicle2 doWatch (SPWConvoyVehicle2 getRelPos [400, _foo]);
			_foo = _foo - 0.3;
			sleep 0.1;
		};

		while {_foo <= 345} do {
			SPWConvoyVehicle2 doWatch (SPWConvoyVehicle2 getRelPos [400, _foo]);
			_foo = _foo + 0.3;
			sleep 0.1;
		};
	};
};
_currentSpawnPosition = _currentSpawnPosition getPos [30, _spawnDirection + 180];



private _vehicle3 = _vehicleClass createVehicle _currentSpawnPosition;
_vehicle3 setDir _spawnDirection;
_vehicle3 setVehicleVarName "SPWConvoyVehicle3";
SPWConvoyVehicle3 = _vehicle3;
private _vehicle3Crew = createVehicleCrew _vehicle3;
(units _vehicle3Crew) join _vehicle1Crew;
// private _firstWaypointVehicle3 = _vehicle3Crew addWaypoint [_waypointLocations # 0, 0, 1];
// private _secondWaypointVehicle3 = _vehicle3Crew addWaypoint [_waypointLocations # 1, 0, 2];
// private _thirdWaypointVehicle3 = _vehicle3Crew addWaypoint [_waypointLocations # 2, 0, 3];
// _firstWaypointVehicle3 setWaypointSpeed "LIMITED";
// _secondWaypointVehicle3 setWaypointSpeed "LIMITED";
// _thirdWaypointVehicle3 setWaypointSpeed "LIMITED";
SPWConvoyVehicle3 action ["SearchlightOn"];
SPWConvoyVehicle3 addWeaponTurret ['fakeweapon', [1]];
[] spawn {
	while {behaviour SPWConvoyVehicle3 != "COMBAT"} do {
		private _foo = 15;
		while {_foo <= 65} do {
			SPWConvoyVehicle3 doWatch (SPWConvoyVehicle3 getRelPos [400, _foo]);
			_foo = _foo + 0.3;
			sleep 0.1;
		};

		while {_foo >= 15} do {
			SPWConvoyVehicle3 doWatch (SPWConvoyVehicle3 getRelPos [400, _foo]);
			_foo = _foo - 0.3;
			sleep 0.1;
		};
	};
};
_currentSpawnPosition = _currentSpawnPosition getPos [30, _spawnDirection + 180];

_vehicle1Crew setFormation "FILE";
_vehicle1Crew setSpeedMode "LIMITED";
private _firstWaypointVehicle1 = _vehicle1Crew addWaypoint [_waypointLocations # 0, 0, 1];
private _secondWaypointVehicle1 = _vehicle1Crew addWaypoint [_waypointLocations # 1, 0, 2];
private _thirdWaypointVehicle1 = _vehicle1Crew addWaypoint [_waypointLocations # 2, 0, 3];
// _firstWaypointVehicle1 setWaypointFormation "COLUMN";
// _firstWaypointVehicle1 setWaypointSpeed "LIMITED";

[{
	(getPos SPWConvoyVehicle1) inArea [[14697.4,7.40112,0], 100, 100, 0, false, 75]
}, {
	params ["_vehicle1Crew"];
	{
		deleteVehicle _x;		
	} forEach (units _vehicle1Crew) + [SPWConvoyVehicle1, SPWConvoyVehicle2, SPWConvoyVehicle3];
}, [_vehicle1Crew]] call CBA_fnc_waitUntilAndExecute;

private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

private _now = date;
_hour = _now # 3;
_minute = _now # 4;

[format['[0%1:%2] SPW Convoy north-east of Grasleben is making its way down the border', _hour, _minute]] remoteExec ["systemChat", _allCurators];