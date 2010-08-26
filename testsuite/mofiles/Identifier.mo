// name: Identifier
// keywords: identifier
// status: correct
//
// Using reserved words as identifiers
//

model Identifier
  Real model;
equation
  model = 2;
end Identifier;

// Result:
// [Identifier.mo:9:3-9:13:writable] Error: unexpected token: Real, parsing resumed at token ';' on line 9, column 13
// [Identifier.mo:11:3-12:1:writable] Error: unexpected token: model, parsing resumed at token 'end' on line 12, column 1
// 
// class Identifier
// end Identifier;
// endResult
