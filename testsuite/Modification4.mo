// name:     Modification4
// keywords: modification
// status:   incorrect

class A
  class AA
    parameter Integer p=1;
  end AA;
  Integer x = AA.p;
end A;

class B
  A a;
end B;

class Modification4
  B b(A.AA(p=2));
end Modification4;
