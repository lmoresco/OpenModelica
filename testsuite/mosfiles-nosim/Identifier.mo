// name: Identifier
// keywords: identifier
// status: incorrect
// cflags: checkparseerror.c
//
// Using reserved words as identifiers
//

model Identifier
  Real model;
equation
  model = 2;
end Identifier;

function isEmpty
  input String inStr;
  output Integer outInt;
  external "C" outInt = checkParseError(inStr) annotation(Library="checkparseerror.c");
end isEmpty;
