// name: IllegalSubscript
// status: incorrect

class IllegalSubscript
  Real r[1];
equation
  r[0] = 1.0;
end IllegalSubscript;

// Result:
// Error processing file: IllegalSubscript.mo
// [IllegalSubscript.mo:7:3-7:13:writable] Error: Illegal subscript [0] for dimensions 1 in component <NO COMPONENT>
// [IllegalSubscript.mo:7:3-7:13:writable] Error: Variable r[0] not found in scope IllegalSubscript
// Error: Error occurred while flattening model IllegalSubscript
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
