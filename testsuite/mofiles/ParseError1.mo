// name:     ParseError1
// keywords: parse error
// status:   correct
// 
// Parsing error message.
// 
// TODO: omc should return both instantiated class -and-
//       error messages, so this model can be fully tested.

model ParseError1
  Real x,y,;
end ParseError1;

// Result:
// [ParseError1.mo:11:12-11:12:writable] Error: unexpected token: ;, parsing resumed at token ';' on line 11, column 12
// 
// class ParseError1
// end ParseError1;
// endResult
