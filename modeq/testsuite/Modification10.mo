// name:     Modification10
// keywords: modification,unknown
// status:   correct
// 
// This tests some of the hairy consequenxes of class modifications.
// 

class B
  Real x = 1.0;
end B;

class C
  B b;
end C;

class A
  C c;
  B b;
end A;

class Modification10
  A a(B(x = 17.0));
end Modification10;

// fclass Modification10
//   Real    a.c.b.x;
//   Real    a.b.x;
// equation
//   a.c.b.x = 17.0;
//   a.b.x = 17.0;
// end Modification10;
