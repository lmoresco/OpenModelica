// name:     Redeclare3
// keywords: redeclare
// status:   correct
// 

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

class Redeclare3
  C c(redeclare class Q = B);
end Redeclare3;

// fclass Redeclare3
// equation
//   c.x.y = c.x.x
// end Redeclare3;
