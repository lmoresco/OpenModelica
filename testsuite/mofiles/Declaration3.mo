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
// fclass Declaration3
// end Declaration3;
// endResult
