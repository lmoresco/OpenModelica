//|name:     Modification2
//|keywords: modification
//|status:   correct
// 

class A
  parameter Real p=1.0;
end A;

class B
  A a;
end B;

class Modification2
  B b(A(p=2.0));
end Modification2;

// fclass Modification2
//   parameter Real b.a.p;
// equation
//   b.a.p = 2.0;
// end Modification2;
