/*
	array with all Events
	Structure of an event:
	["name", timeTillActiveInSeconds, "functionToCall]
*/


private _allEvents = [
	["spawn Camp search Party", 1180, "[] spawn grad_uhu_fnc_spawnCampSearchParrty"],
	["fly by", 4400, "[] spawn grad_uhu_fnc_spawnFlyby"],
	["test Event 3", 180, "[] spawn grad_uhu_fnc_testEvent3"],
	["Helo Exfil", 7010, "[] spawn grad_uhu_fnc_spawnExfilHelos"],
	["Grasleben Convoy", 2600, "[] spawn grad_uhu_fnc_spawnGraslebenConvoy"],
	["Reinforcements Mariental (Horst)", 3600, "[] spawn grad_uhu_fnc_spawnReinforcementsMarientalHorst"]
];

{

	private _name = _x # 0;
	private _timeTillActiveInSeconds = _x # 1;
	private _functionToCall = _x # 2;

	_functionToCall = compile _functionToCall;
	[{

		params ["_name", "_timeTillActiveInSeconds", "_functionToCall"];

		private _allCurators = [];
		{
			_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
		} forEach allCurators;

		[format["About %1h %2m %3s passed since the mission started. Starting Event '%4'...", floor(_timeTillActiveInSeconds / 3600), floor((_timeTillActiveInSeconds / 60) % 60), floor(_timeTillActiveInSeconds % 60), _name]] remoteExec ["systemChat", _allCurators];
		call _functionToCall;

	}, [_name, _timeTillActiveInSeconds, _functionToCall], _timeTillActiveInSeconds] call CBA_fnc_waitAndExecute;

} forEach _allEvents;