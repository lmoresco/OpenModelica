// name: Identifier
// keywords: identifier
// status: incorrect
//
// Using reserved words as identifiers
//

model Identifier
  Real model;
equation
  model = 2;
end Identifier;

// Result:
// Error processing file: Identifier.mo
// [Identifier.mo:9:3-9:7:writable] Error: No viable alternative near token: Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
