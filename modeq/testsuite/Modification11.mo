// name:     Modification11
// keywords: modification,unknown
// status:   correct
// 
// This tests some of the hairy consequenxes of class modifications.
// 

class B
  Real x = 1.0;
end B;

class A
  B b;
  B B;
end A;

class Modification10
  A a(B(x = 17.0));
end Modification10;

// fclass Modification11
//   Real    a.c.b.x;
//   Real    a.b.x;
// equation
//   a.b.x = 17.0;
//   a.B.x = 17.0;
// end Modification11;
