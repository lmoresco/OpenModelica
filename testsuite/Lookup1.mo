// name:     Lookup1
// keywords: scoping
// status:   correct
// 
// Names are looked up in a partially defined class.
// 

class Lookup1
  constant Real a = 3.0;
  class B
    Real c = a;
  end B;
  B b;
end Lookup1;

// fclass Lookup1
//   constant Real a;
//   Real b.c;
// equation
//   a = 3.0;
//   b.c = a;
// end Lookup1;

