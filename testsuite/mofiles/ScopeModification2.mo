// name:     ScopeModification2
// keywords: scoping,modification
// status:   incorrect
// 
// In class modifications the scope of the outer class is used for
// looking up variables. There is no 'a' known in the example.
//

class ScopeModification2
  class Inner
    Real a;
    Real b;
  end Inner;
  Inner m(b = a);
end ScopeModification2;
// Result:
// Error processing file: ScopeModification2.mo
// Error: Variable a not found in scope ScopeModification2
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
