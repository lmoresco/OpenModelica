// name:     Lookup2
// keywords: scoping
// status:   incorrect
// 
// Lookup2 does not exists until it is completely defined.
//

class Lookup2
  constant Real a = 3.0;
  class B
    Real c = Lookup2.a;
  end B;
  B b;
end Lookup2;

// fclass Lookup2
//   Real a;
//   Real c.b
// equation
//   a = 3.0;
//   b.c = a;
// end Lookup2;

