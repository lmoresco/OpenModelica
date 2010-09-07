// name:     SimpleIntegrator4
// keywords: declaration,modification
// status:   incorrect
// 
// Try to access non-existend attribute 'initial'.
//

model SimpleIntegrator4
  Real u = 1.0;
  Real x(initial = 2.0);
equation
  der(x) = u;
end SimpleIntegrator4;
// Result:
// Error processing file: SimpleIntegrator4.mo
// [SimpleIntegrator4.mo:10:10-10:10:writable] Error: Missing token: RPAR
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
