// name:     Lookup3
// keywords: scoping
// status:   incorrect
// 
// Non-constants in an outer scope can not be referred to.
//

class Lookup3
  Real a = 3.0;
  class B
    Real c = a;
  end B;
  B b;
end Lookup3;
