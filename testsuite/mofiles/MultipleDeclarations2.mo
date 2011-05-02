// name:     MultipleDeclarations2
// keywords: declaration
// status:   incorrect
// 
// Multiple declarations are not allowed.
//


model MultipleDeclarations2
  Real x;
  Real x;
end MultipleDeclarations2;

// Result:
// Error processing file: MultipleDeclarations2.mo
// [MultipleDeclarations2.mo:11:3-11:9:writable] Error: An element with name x is already declared in this scope.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
