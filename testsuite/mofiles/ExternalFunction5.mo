// name: ExternalFunction5
// status: correct
// teardown_command: rm -f myFloor.* myFloor_* ExternalFunction5_*

function myFloor
  input Real r;
  output Real o;
external "builtin" o=floor(r);
end myFloor;

class ExternalFunction5
  function myFloor
    input Real r;
    output Real o;
  external "builtin" o=floor(r);
  end myFloor;

  function myFloor2
    input Real r;
    output Real o;
  algorithm
    o := myFloor(r);
  end myFloor2;

  Real r1 = .myFloor(1.5);
  Real r2 = myFloor(1.5);
  Real r3 = myFloor2(1.5);
end ExternalFunction5;

// Result:
// function ExternalFunction5.myFloor2
//   input Real r;
//   output Real o;
// algorithm
//   o := ExternalFunction5.myFloor(r);
// end ExternalFunction5.myFloor2;
// 
// class ExternalFunction5
//   Real r1 = 1.0;
//   Real r2 = 1.0;
//   Real r3 = 1.0;
// end ExternalFunction5;
// endResult
