// modification-s-3.mo
//
// Equations:
//
//   b.a.x = 2
//
// Or what? How would the paramter be described?

class A
  class AA
    parameter Real p=1;
  end AA;
  Real x = AA.p;
end A;

class B
  A a;
end B;

class C
  B b(A.AA(p=2));
end C;
