
private _allCurators = [];
{
	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
} forEach allCurators;

["This is test Event 2"] remoteExec ["systemChat", _allCurators];