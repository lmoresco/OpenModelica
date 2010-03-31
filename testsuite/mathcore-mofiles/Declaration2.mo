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
// fclass Declaration2
// end Declaration2;
// endResult
