// redeclare-s-2.mo

class A
  Real x;
equation
  x = 1.0;
end A;

class B
  Real x,y;
equation
  y = x;
end B;

class C
  replaceable class Q = A;
  Q x;
end C;

// Equations:
//
//   x.x = 1.0
//
