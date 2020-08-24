
private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

["This is test Event 3"] remoteExec ["systemChat", _allCurators];