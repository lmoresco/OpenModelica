// modification-s-2.mo
//
// Equations:
//
//   b.a.p = 2
//

class A
  parameter Real p=1;
end A;

class B
  A a;
end B;

class C
  B b(A(p=2));
end C;
