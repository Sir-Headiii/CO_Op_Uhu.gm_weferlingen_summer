["Initialize"] call BIS_fnc_dynamicGroups;

sleep 1;

[] call grad_uhu_fnc_startEventTimer;

sleep 10;

if (isDedicated) then {
	[[], grad_uhu_fnc_startIntro] remoteExec ["spawn", -2];
} else {
	[[], grad_uhu_fnc_startIntro] remoteExec ["spawn", 2];
};