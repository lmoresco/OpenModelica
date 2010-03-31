// name:     Modification11
// keywords: modification
// status:   incorrect
// 
// 
// Illegal since an element may not have
// the same name as its type identifier 
// (Modelica 1.4 spec 3.1.2.4).
// Apart from that it is legal.
// 
// Compare with Modification2.

class B
  Real x = 1.0;
end B;

class A
  B b;
  B B;
end A;

class Modification11
  A a(B(x = 17.0));
end Modification11;

// Result:
// fclass Modification11
//   Real    a.c.b.x;
//   Real    a.b.x;
// equation
//   a.b.x = 1.0;
//   a.B.x = 17.0;
// end Modification11;
// endResult
