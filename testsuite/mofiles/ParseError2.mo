// name:     ParseError2
// keywords: parse error
// status:   correct
// 
// Parsing error message.
// 
// TODO: omc should return both instantiated class -and-
//       error messages, so this model can be fully tested.

model ParseError2
  Real 1x;
end ParseError2;

// Result:
// [ParseError2.mo:11:3-11:10:writable] Error: unexpected token: Real, parsing resumed at token ';' on line 11, column 10
// 
// class ParseError2
// end ParseError2;
// endResult
