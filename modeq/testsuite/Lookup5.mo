// name:     Lookup5
// keywords: scoping
// status:   correct
// 
// Is a variable already known on the right hand side of its 
// declaration equation? <Ruediger: assume not?>
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

