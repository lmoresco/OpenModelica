// name:     Lookup5
// keywords: scoping
// status:   correct
// 
// Only fully declared elements (declaration ended by semicolon)
// are known.
//

class Lookup5
  constant Real a = 3.0;
  class B
    Real a = a;
  end B;
  B b;
end Lookup5;

// fclass Lookup5
//   constant Real a;
//   Real b.a;
// equation
//   a = 3.0;
//   b.a = a;
// end Lookup5;

