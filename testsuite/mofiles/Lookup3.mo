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
// Result:
// Error processing file: Lookup3.mo
// [Lookup3.mo:13:3-13:6:readonly] Error: Variable b: Variable a in package Lookup3 is not constant
// [Lookup3.mo:13:3-13:6:readonly] Error: Variable b: Found a component with same name when looking for type a
// [Lookup3.mo:13:3-13:6:readonly] Error: Variable b: Variable a in package Lookup3 is not constant
// [Lookup3.mo:13:3-13:6:readonly] Error: Variable b: Variable a not found in scope Lookup3.B
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
