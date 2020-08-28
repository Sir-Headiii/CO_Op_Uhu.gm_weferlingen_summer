/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

["CAManBase", "init", {
    params ["_unit"];
    
	if ( ((side group _unit) != east) || (isPlayer _unit) )  exitWith {};

	[{
		params ["_unit"];

		private _face = selectRandom ["gm_face_whiteHead_01", "gm_face_whiteHead_02", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16"];
		[_unit, _face] remoteExec ["setFace", 0, _unit];

	}, [_unit], 1] call CBA_fnc_waitAndExecute;

}] call CBA_fnc_addClassEventHandler;