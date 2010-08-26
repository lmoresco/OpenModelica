// name: TypeClass2
// keywords: type
// status: incorrect
//
// Tests type declaration from a regular class, should be illegal
//

class IllegalClass
  Integer i;
end IllegalClass;

type IllegalType = IllegalClass;

model TypeClass2
  IllegalType it;
equation
  it.i = 1;
end TypeClass2;
// Result:
// Error processing file: TypeClass2.mo
// # Restriction violation: IllegalClass is not a TYPE
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// # Restriction violation: IllegalClass is not a TYPE
// 
// Execution failed!
// endResult
