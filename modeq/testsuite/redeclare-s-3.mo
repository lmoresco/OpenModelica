// redeclare-s-2.mo

class A
  Real x;
equation
  x = 1;
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

class D
  C c(redeclare class Q = B);
end D;

// Equations:
//
//   c.x.y = c.x.x
//
