// name:     ScopeModification1
// keywords: scoping,modification
// status:   correct
// 
// In class modifications the scope of the outer class is used for
// looking up variables. Consequently 'a' of the outer class is used 
// in the modification.
//

class ScopeModification1
  class Inner
    Real a=2;
    Real b;
  end Inner;
  Real a=1;
  Inner m(b = a);
end ScopeModification1;

// fclass ScopeModification1
//   Real a=1;
//   Real m.a=2;
//   Real m.b;
// equation
//   m.b = a;
// end ScopeModification1;
