// modification-s-3.mo
//
// Equations:
//
//   b.a.aa.p = 2
//

class A
  class AA
    parameter Real p=1;
  end AA;
  AA aa;
end A;

class B
  A a;
end B;

class C
  B b(A.AA(p=2));
end C;
