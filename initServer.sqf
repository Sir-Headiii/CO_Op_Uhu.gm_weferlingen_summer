["Initialize"] call BIS_fnc_dynamicGroups;

[] call grad_uhu_fnc_startEventTimer;

[{
	if (isDedicated) then {
		[[], grad_uhu_fnc_startIntro] remoteExec ["spawn", -2];
	} else {
		[[], grad_uhu_fnc_startIntro] remoteExec ["spawn", 2];
	};
}, [], 30] call CBA_fnc_waitAndExecute;


[{
	{
		deleteVehicle _x;		
	} forEach [clockCloseup, clockMediumShot, introOfficer, introRifleman, introRifleman2];
}, [], 120] call CBA_fnc_waitAndExecute;


private _allUnits = allUnits select {(!(isPlayer _x)) && ((side group _x) == east)};

{
	[{
		params ["_unit"];

		private _face = selectRandom ["gm_face_whiteHead_01", "gm_face_whiteHead_02", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16"];
		[_unit, _face] remoteExec ["setFace", 0, _unit];

	}, [_x], 1] call CBA_fnc_waitAndExecute;	
} forEach _allUnits;