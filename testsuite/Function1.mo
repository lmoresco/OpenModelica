// name:     Function1
// keywords: function
// status:   correct
// 
// This tests basic function functionality

function f
  input Real x;
  output Real r;
algorithm
  r := 2.0 * x;
end f;

model Function1
  Real x, y, z;
equation
  x = y;
  x = f(z);
  y = f(z);
end Function1;

// fclass Function1
//   Real    x;
//   Real    y;
//   Real    z;
//   Real f~1.x;
//   Real f~1.r;
//   Real f~2.x;
//   Real f~2.r;
// equation
//   x = y;
//   f~1.x = z;
//   x = f~1.r;
//   f~2.x = z;
//   y = f~2.r;
// algorithm
//   f~1.r := 2.0 * f~1.x;
// algorithm
//   f~2.r := 2.0 * f~2.x;
// end Function1;
