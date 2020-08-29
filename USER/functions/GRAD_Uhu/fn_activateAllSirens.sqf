params [["_duration", 180], ["_scanForSirens", false], ["_type", "gm_sound_e57_airRaid"]];

private _soundSources = [];
private _allSirens = [];

if (_scanForSirens) then {
	private _halfMapLength = worldSize / 2;
	_allSirens = nearestObjects [[_halfMapLength, _halfMapLength, 0], ["gm_structure_siren_base", "land_gm_gc_ds977_50", "land_gm_ge_einheitssirene_57"], sqrt 2 * _halfMapLength];
} else {
	_allSirens = missionNamespace getVariable ["GRAD_allSirens", []];
};

[_allSirens, _duration, _type] spawn {
	params ["_allSirens", "_duration", "_type"];

	private _timesToPlay = round (_duration / 67);
	private _soundSources = [];

	for [{_i = 0}, {_i < _timesToPlay}, {_i = _i + 1}] do {
		{
			deleteVehicle _x;
		} forEach _soundSources;

		{
			_soundSources pushBack (createSoundSource [format ["%1_near",_type], getPos _x, [], 0]);
			_soundSources pushBack (createSoundSource [format ["%1_far",_type], getPos _x, [], 0]);
		} forEach _allSirens;

		sleep 67;

	};

	sleep 10;

	{
		deleteVehicle _x;
	} forEach _soundSources;

};