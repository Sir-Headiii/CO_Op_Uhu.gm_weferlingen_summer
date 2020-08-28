params [["_duration", 180], ["_type", "gm_sound_e57_airRaid"]];

private _halfMapLength = worldSize / 2;
private _allSirens = nearestObjects [[_halfMapLength, _halfMapLength, 0], ["gm_structure_siren_base", "land_gm_gc_ds977_50", "land_gm_ge_einheitssirene_57"], sqrt 2 * _halfMapLength];
systemChat str (count _allSirens);

private _soundSources = [];
{
	_soundSources pushBack (createSoundSource [format ["%1_near",_type], _x, [], 0]);
	_soundSources pushBack (createSoundSource [format ["%1_far",_type], _x, [], 0]);
} forEach _allSirens;

[_soundSources, _duration] spawn {
	sleep (_this # 1);
	{deleteVehicle _x} foreach (_this # 0);
};