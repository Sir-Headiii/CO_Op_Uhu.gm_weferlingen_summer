["Terminate"] call BIS_fnc_EGSpectator;

// if (([missionConfigFile >> "missionSettings","waveRespawnEnabled",0] call BIS_fnc_returnConfigEntry) == 1) then {
//     [] call grad_waverespawn_fnc_onPlayerRespawn;
// };

["Initialize", [player, [playerside], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;