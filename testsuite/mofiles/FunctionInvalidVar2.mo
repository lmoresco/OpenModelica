// name:     FunctionInvalidVar2
// keywords: function
// status:   incorrect
// 
// Checks restrictions on function variable types.
// 

connector C
  Real r;
end C;

function F
  input C c;
end F;

model FunctionInvalidVar2
  C c;
algorithm
  F(c);
end FunctionInvalidVar2;

// Result:
// Error processing file: FunctionInvalidVar2.mo
// [FunctionInvalidVar2.mo:13:3-13:12:writable] Error: Invalid type C for function component c.
// [FunctionInvalidVar2.mo:19:3-19:7:writable] Error: Class F not found in scope FunctionInvalidVar2 (looking for a function or record).
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
