//|name:     Modification3
//|keywords: modification
//|status:   correct


class A
  class AA
    parameter Real p=1.0;
  end AA;
  AA aa;
end A;

class B
  A a;
end B;

class Modification3
  B b(A.AA(p=2.0));
end Modification3;

// fclass Modification3
//   parameter Real b.a.aa.p;
// equation
//   b.a.aa.p = 2.0;
// end Modification3;
