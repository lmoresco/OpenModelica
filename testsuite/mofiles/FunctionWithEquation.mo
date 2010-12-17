// name: FunctionWithEquation
// status: incorrect

model FunctionWithEquation

function fn
  input Real inR;
  output Real outR;
equation
  assert(true, "This really should succeed ;)");
end fn;

  Real r, r2;
equation
  r = fn(r2);
end FunctionWithEquation;

// Result:
// Error processing file: FunctionWithEquation.mo
// [FunctionWithEquation.mo:6:1-11:7:writable] Error: Element is not allowed in function context: equation
//   assert(true,"This really should succeed ;)");
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
