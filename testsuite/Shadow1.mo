// name:     Shadow1
// keywords: modification,shadow
// status:   correct
// 
// Modifications override declarations but not equations.

class A
  Real y=3.0;
  Real x;
equation
  x = 1;
end A;

model Shadow1
  Real z;
  A a(x = z, y=2.0);
end Shadow1;

// fclass Shadow1
//   Real a.x;
//   Real a.y;
//   Real z;
// equation
//   a.x = 1;
//   a.x = z;
//   a.y = 2.0;
// end Shadow1;

