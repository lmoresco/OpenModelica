// name:     Modification4
// keywords: modification
// status:   correct

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

// fclass Modification4;
// equation
//   b.a.x = 2
// end Modification4;
//
// Or what? How would the paramter be described?
