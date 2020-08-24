params ["_wreck"];

//["_wreck", "_color", "_damage", "_size", "_density", "_lifetime", "_speed", "_particleSize", "_orientation"];
//["_colorRed", "_colorGreen", "_colorBlue"];

private _colorRed = 0.5;
private _colorGreen = 0.5;
private _colorBlue = 0.5;
private _damage = 0;
private _size = 1;
private _density = 30;
private _lifetime = 3.5;
private _speed = 1;
private _particleSize = 4.5;
private _orientation = 0;

private _emitter = "#particlesource" createVehicleLocal (getPos _wreck);

_emitter setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
    "",
    "billboard",
    1,
    _lifetime,
    [0, 0, 0],
    [0, 0, 0.4 * _speed],
    0,
    0.0565,
    0.05,
    0.03,
    [0.9 * _particleSize, 0],
    [
        [_colorRed, _colorGreen, _colorBlue, 0],
        [_colorRed, _colorGreen, _colorBlue, -1],
        [_colorRed, _colorGreen, _colorBlue, -1],
        [_colorRed, _colorGreen, _colorBlue, -1],
        [_colorRed, _colorGreen, _colorBlue, -1],
        [_colorRed, _colorGreen, _colorBlue, 0]
    ],
    [1],
    0.01,
    0.02,
    "",
    "",
    "",
    _orientation,
    false,
    -1,
    [[3, 3, 3, 0]]
];

_emitter setParticleRandom [_lifetime / 4, [0.15 * _size, 0.15 * _size, 0], [0.2, 0.2, 0], 0.4, 0, [0, 0, 0, 0], 0, 0, 0.2];

if (_damage > 0) then {
    _emitter setParticleFire [0.6 * _damage, 0.25 * _damage, 0.1];
} else {
    _emitter setParticleFire [0, 0, 0];
};

_emitter setDropInterval (1 / _density);
_emitter attachTo [_wreck, [0, -0.65, 0.2]];

// Create light source effect
private _light = "#lightpoint" createVehicleLocal (getPos _wreck);
_light setLightBrightness 1;
_light setLightColor [1, 0.65, 0.4];
_light setLightAmbient [0.15, 0.05, 0];
_light setLightIntensity (2000 * _particleSize + 1000);
//_light setLightAttenuation [0, 0, 0, 100];
_light setLightDayLight false;

_light lightAttachObject [_wreck, [0, -0.65, 0.6]];


[{
	isNull (_this#0)
}, {
	deleteVehicle (_this # 2);
	deleteVehicle (_this # 3);
}, [_wreck, _particleSize, _light, _emitter]] call CBA_fnc_waitUntilAndExecute;

sleep 30;

while {!(isNull _wreck) && (_particleSize > 0)} do {
	
	_emitter setParticleParams [
		["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32],
		"",
		"billboard",
		1,
		_lifetime,
		[0, 0, 0],
		[0, 0, 0.4 * _speed],
		0,
		0.0565,
		0.05,
		0.03,
		[0.9 * _particleSize, 0],
		[
			[_colorRed, _colorGreen, _colorBlue, 0],
			[_colorRed, _colorGreen, _colorBlue, -1],
			[_colorRed, _colorGreen, _colorBlue, -1],
			[_colorRed, _colorGreen, _colorBlue, -1],
			[_colorRed, _colorGreen, _colorBlue, -1],
			[_colorRed, _colorGreen, _colorBlue, 0]
		],
		[1],
		0.01,
		0.02,
		"",
		"",
		"",
		_orientation,
		false,
		-1,
		[[3, 3, 3, 0]]
	];

	_emitter setParticleRandom [_lifetime / 4, [0.15 * _size, 0.15 * _size, 0], [0.2, 0.2, 0], 0.4, 0, [0, 0, 0, 0], 0, 0, 0.2];

	_light setLightIntensity (2000 * _particleSize + 1000);

	_particleSize = _particleSize - 0.1;
	_lifetime = _lifetime - 0.05;

	sleep 10;
};

if !(isNull _emitter) then {
	deleteVehicle _emitter;
};

if !(isNull _light) then {
	deleteVehicle _light;
};