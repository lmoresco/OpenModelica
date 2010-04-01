// name:     Declaration2
// keywords: declaration
// status:   correct
// 
// Misuse of component attributes.
//
// N.B! Panic mode handles this by simply skipping the declaration of x.
//      There is no error output, but there should be.

class Declaration2
  constant discrete Real x;
end Declaration2;

// Result:
// [Declaration2.mo:11:12-11:27:writable] Error: unexpected token: discrete, parsing resumed at token ';' on line 11, column 27
// 
// fclass Declaration2
// end Declaration2;
// endResult
