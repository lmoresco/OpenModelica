// name:     Declaration3
// keywords: declaration
// status:   correct
// 
// Misuse of component attributes.
//
// N.B! Panic mode handles this by simply skipping the declaration of x.
//      There is no error output, but there should be.

class Declaration3
  constant parameter Real x;
end Declaration3;

// Result:
// [Declaration3.mo:11:12-11:28:writable] Error: unexpected token: parameter, parsing resumed at token ';' on line 11, column 28
// 
// class Declaration3
// end Declaration3;
// endResult
