// modification-s-2.mo
//
// Equations:
//
//   A.p = 1.0
//   B.A.p = 1.0
//   b.a.p = 2.0
//

class A
  parameter Real p=1.0;
end A;

class B
  A a;
end B;

class C
  B b(A(p=2.0));
end C;
