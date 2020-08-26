params ["_convoy"];

private _pointArrows = [graslebenConvoyAnker1, graslebenConvoyAnker2, graslebenConvoyAnker3, graslebenConvoyAnker4, graslebenConvoyAnker5, graslebenConvoyAnker6, graslebenConvoyAnker7, graslebenConvoyAnker8, graslebenConvoyAnker9, graslebenConvoyAnker10, graslebenConvoyAnker11, graslebenConvoyAnker12, graslebenConvoyAnker13, graslebenConvoyAnker14, graslebenConvoyAnker15, graslebenConvoyAnker16, graslebenConvoyAnker17, graslebenConvoyAnker18, graslebenConvoyAnker19, graslebenConvoyAnker20, graslebenConvoyAnker21, graslebenConvoyAnker22, graslebenConvoyAnker23, graslebenConvoyAnker24, graslebenConvoyAnker25, graslebenConvoyAnker26, graslebenConvoyAnker27, graslebenConvoyAnker28, graslebenConvoyAnker29, graslebenConvoyAnker30, graslebenConvoyAnker31, graslebenConvoyAnker32, graslebenConvoyAnker33, graslebenConvoyAnker34, graslebenConvoyAnker35, graslebenConvoyAnker36, graslebenConvoyAnker37, graslebenConvoyAnker38, graslebenConvoyAnker39, graslebenConvoyAnker40, graslebenConvoyAnker41, graslebenConvoyAnker42, graslebenConvoyAnker43, graslebenConvoyAnker44, graslebenConvoyAnker45, graslebenConvoyAnker46, graslebenConvoyAnker47, graslebenConvoyAnker48, graslebenConvoyAnker49, graslebenConvoyAnker50, graslebenConvoyAnker51, graslebenConvoyAnker52, graslebenConvoyAnker53, graslebenConvoyAnker54, graslebenConvoyAnker55, graslebenConvoyAnker56, graslebenConvoyAnker57, graslebenConvoyAnker58, graslebenConvoyAnker59, graslebenConvoyAnker60, graslebenConvoyAnker61, graslebenConvoyAnker62, graslebenConvoyAnker63, graslebenConvoyAnker64, graslebenConvoyAnker65, graslebenConvoyAnker66, graslebenConvoyAnker67, graslebenConvoyAnker68, graslebenConvoyAnker69, graslebenConvoyAnker70, graslebenConvoyAnker71, graslebenConvoyAnker72, graslebenConvoyAnker73, graslebenConvoyAnker74, graslebenConvoyAnker75, graslebenConvoyAnker76, graslebenConvoyAnker77, graslebenConvoyAnker78, graslebenConvoyAnker79, graslebenConvoyAnker80, graslebenConvoyAnker81, graslebenConvoyAnker82, graslebenConvoyAnker83, graslebenConvoyAnker84, graslebenConvoyAnker85, graslebenConvoyAnker86, graslebenConvoyAnker87, graslebenConvoyAnker88, graslebenConvoyAnker89, graslebenConvoyAnker90, graslebenConvoyAnker91, graslebenConvoyAnker92, graslebenConvoyAnker93, graslebenConvoyAnker94, graslebenConvoyAnker95, graslebenConvoyAnker96, graslebenConvoyAnker97, graslebenConvoyAnker98, graslebenConvoyAnker99, graslebenConvoyAnker100, graslebenConvoyAnker101, graslebenConvoyAnker102, graslebenConvoyAnker103, graslebenConvoyAnker104, graslebenConvoyAnker105, graslebenConvoyAnker106, graslebenConvoyAnker107, graslebenConvoyAnker108, graslebenConvoyAnker109, graslebenConvoyAnker110, graslebenConvoyAnker111, graslebenConvoyAnker112, graslebenConvoyAnker113];
private _points = [];
{
    _points pushBackUnique (getPos _x);
} forEach _pointArrows;
//systemChat str _convoy;

(_convoy select 0) setDriveOnPath _points;

for [{_i=0},{_i<count _convoy},{_i=_i+1}] do {
    [{
        params ["_vehicles","_handle"];
        _vehicles params ["_leader","_thisVeh","_follower","_vehicle1"];

        //systemChat format["this is pfh of vehicle %1.", _thisVeh];

        if ((isNull _vehicle1) || !(alive _vehicle1) || !(alive _thisVeh) || (behaviour _thisVeh isEqualTo "COMBAT") || (isNull _thisVeh)) exitWith {
            //systemChat format["PFH deleted of vehicle %1", _thisVeh];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        private _distFront = _thisVeh distance _leader;
        private _distBack = _thisVeh distance _follower;

        if (_vehicle1 inArea [[10330.4,7754.96,0], 225, 225, 0, false, 75]) then {
            if (!isNull _leader) then {
                if (_distFront < 5) then {
                    _thisVeh limitSpeed 5;
                } else {
                    _thisVeh setDriveOnPath [getPos _thisVeh, _thisVeh getPos [0.8 * _distFront,_thisVeh getDir _leader]];
                    private _speedLimit = if (_distFront > 20) then {if (_distFront < 15) then {30} else {35}} else {25};
                    _thisVeh limitSpeed _speedLimit;
                };
            };

            if (!isNull _follower && {_distBack > 55}) then {
                _thisVeh limitSpeed 10;
            } else {
                if (isNull _leader) then {
                    _thisVeh limitSpeed 30;
                };
            };

        } else {

                if (!isNull _leader) then {
                    if (_distFront < 5) then {
                        _thisVeh limitSpeed 5;
                    } else {
                        _thisVeh setDriveOnPath [getPos _thisVeh, _thisVeh getPos [0.8 * _distFront,_thisVeh getDir _leader]];
                        private _speedLimit = if (_distFront > 20) then {if (_distFront < 15) then {50} else {55}} else {40};
                        _thisVeh limitSpeed _speedLimit;
                    };
                };

                if (!isNull _follower && {_distBack > 55}) then {
                    _thisVeh limitSpeed 10;
                } else {
                    if (isNull _leader) then {
                        _thisVeh limitSpeed 50;
                    };
                };
        };

    },0.5,[_convoy param [_i-1,objNull],_convoy select _i,_convoy param [_i+1,objNull],_convoy select 0]] call CBA_fnc_addPerFrameHandler;
};

// private _allCurators = [];
// {
// 	_allCurators pushBackUnique (getAssignedCuratorUnit _x);     
// } forEach allCurators;

// [format['[0%1:%2] points: ', str(_points)]] remoteExec ["systemChat", _allCurators];