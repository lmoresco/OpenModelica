// name:     Lookup3
// keywords: scoping
// status:   incorrect
// 
// Non-constants can not be referred to using class names.
//

class Lookup3
  Real a = 3.0;
  class B
    Real c = Lookup3.a;
  end B;
  B b;
end Lookup3;
