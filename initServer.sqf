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