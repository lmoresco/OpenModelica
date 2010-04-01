// name:     Declaration1
// keywords: declaration
// status:   correct
// 
// Misuse of component attributes.
//
// N.B! Panic mode handles this by simply skipping the declaration of x.
//      There is no error output, but there should be.

class Declaration1
  discrete constant Real x;
end Declaration1;

// Result:
// [Declaration1.mo:11:12-11:27:writable] Error: unexpected token: constant, parsing resumed at token ';' on line 11, column 27
// 
// fclass Declaration1
// end Declaration1;
// endResult
