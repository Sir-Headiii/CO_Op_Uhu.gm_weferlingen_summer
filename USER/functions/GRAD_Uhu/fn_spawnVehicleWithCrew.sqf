params ["_vehicleClass", "_spawnPosition", "_spawnDirection"];

private _vehicle = _vehicleClass createVehicle _spawnPosition;
_vehicle setDir _spawnDirection;

private _vehicleGroup = createVehicleCrew _vehicle;

[_vehicleGroup, _vehicle]